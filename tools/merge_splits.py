"""Merge an app bundle's config splits (density, language, ABI) into one installable APK.

Usage: python merge_splits.py <base.apk> <out.apk> <split.apk>...

The car installs from a file manager, which takes one APK. Config splits share the base's package
(0x7f) and type ids, so each split type chunk is copied into the base table with its key and string
indices remapped into the base pools (the indices are fixed-width, so the chunk is patched in place).
Split files (res/*, lib/*) are copied as they are. The manifest's isSplitRequired and the
com.android.vending.splits.required meta-data are set to false, else the install (or Play Core's
missing-split check) refuses the lone APK. Output is unsigned and unaligned.
"""
import struct
import sys
import zipfile

RES_STRING_POOL, RES_TABLE_PACKAGE, RES_TABLE_TYPE, RES_TABLE_TYPE_SPEC = 0x1, 0x200, 0x201, 0x202
UTF8 = 0x100
TYPE_STRING = 0x03
ATTR_IS_SPLIT_REQUIRED = 0x01010591
ATTR_REQUIRED_SPLIT_TYPES = 0x0101064e


def chunks(d, start, end):
    o = start
    while o < end:
        t, h, sz = struct.unpack_from('<HHI', d, o)
        yield o, t, h, sz
        o += sz


# ---- string pools ---------------------------------------------------------------------------
def _len8(d, o):
    n = d[o]
    return ((n & 0x7f) << 8 | d[o + 1], 2) if n & 0x80 else (n, 1)


def read_pool(d, o):
    _, h, sz, count, styles, flags, s_start, _ = struct.unpack_from('<HHIIIIII', d, o)
    assert flags & UTF8, 'only UTF-8 pools are handled'
    out = []
    for i in range(count):
        p = o + s_start + struct.unpack_from('<I', d, o + h + 4 * i)[0]
        _, k = _len8(d, p); p += k          # utf-16 length
        n, k = _len8(d, p); p += k          # utf-8 byte length
        out.append(d[p:p + n].decode('utf-8', 'surrogatepass'))
    return out, styles, d[o:o + sz]


def build_pool(strings, flags, raw_styles=None):
    """Rebuild a UTF-8 pool; raw_styles = (style_offsets, style_bytes) kept from the original."""
    data, offs = bytearray(), []
    for s in strings:
        b = s.encode('utf-8', 'surrogatepass')
        u16 = len(s.encode('utf-16-le', 'surrogatepass')) // 2
        offs.append(len(data))
        for n in (u16, len(b)):
            data += bytes([0x80 | n >> 8, n & 0xff]) if n > 0x7f else bytes([n])
        data += b + b'\0'
    while len(data) % 4:
        data += b'\0'
    soffs, sbytes = raw_styles or ([], b'')
    h = 28
    s_start = h + 4 * (len(offs) + len(soffs))
    st_start = s_start + len(data) if soffs else 0
    body = struct.pack(f'<{len(offs)}I', *offs) + struct.pack(f'<{len(soffs)}I', *soffs) + bytes(data) + sbytes
    return struct.pack('<HHIIIIII', RES_STRING_POOL, h, h + len(body), len(offs), len(soffs), flags, s_start,
                       st_start) + body


def pool_styles(raw):
    _, h, sz, count, styles, flags, s_start, st_start = struct.unpack_from('<HHIIIIII', raw, 0)
    if not styles:
        return None
    soffs = list(struct.unpack_from(f'<{styles}I', raw, h + 4 * count))
    return soffs, raw[st_start:sz]


class Pool:
    def __init__(self, strings):
        self.strings = list(strings)
        self.index = {}
        for i, s in enumerate(self.strings):
            self.index.setdefault(s, i)

    def get(self, s):
        if s not in self.index:
            self.index[s] = len(self.strings)
            self.strings.append(s)
        return self.index[s]


# ---- resource table -------------------------------------------------------------------------
def parse_table(d):
    _, h, sz, npk = struct.unpack_from('<HHII', d, 0)
    assert npk == 1, 'one package expected'
    pool = pkg = None
    for o, t, ch, csz in chunks(d, h, len(d)):
        if t == RES_STRING_POOL:
            pool = o
        elif t == RES_TABLE_PACKAGE:
            pkg = o
    return pool, pkg


def package_parts(d, pkg):
    _, h, sz = struct.unpack_from('<HHI', d, pkg)
    type_str, _, key_str, _ = struct.unpack_from('<IIII', d, pkg + 268)
    body = list(chunks(d, pkg + h, pkg + sz))
    return h, type_str, key_str, body


def remap_type_chunk(d, o, sz, key_map, str_map):
    """Copy one type chunk with key and string-value indices remapped."""
    c = bytearray(d[o:o + sz])
    _, h, _, tid, flags, _, count, entries = struct.unpack_from('<HHIBBHII', c, 0)
    assert not flags & 0x01, 'sparse types not handled'
    for i in range(count):
        eo = struct.unpack_from('<I', c, h + 4 * i)[0]
        if eo == 0xFFFFFFFF:
            continue
        p = entries + eo
        esize, eflags, key = struct.unpack_from('<HHI', c, p)
        struct.pack_into('<I', c, p + 4, key_map[key])
        values = []
        if eflags & 0x1:   # complex: parent, count, then (name, Res_value) pairs
            n = struct.unpack_from('<I', c, p + 12)[0]
            values = [p + esize + 4 + 12 * k for k in range(n)]
        else:
            values = [p + esize]
        for v in values:
            if c[v + 3] == TYPE_STRING:
                struct.pack_into('<I', c, v + 4, str_map[struct.unpack_from('<I', c, v + 4)[0]])
    return tid, bytes(c)


def merge_tables(base, splits):
    pool_o, pkg_o = parse_table(base)
    gstrings, _, graw = read_pool(base, pool_o)
    gpool, gstyles, gflags = Pool(gstrings), pool_styles(graw), struct.unpack_from('<I', graw, 16)[0]
    ph, ts_o, ks_o, body = package_parts(base, pkg_o)
    keys, _, _ = read_pool(base, pkg_o + ks_o)
    kpool = Pool(keys)
    # base chunks after the two pools, in order; split type chunks go after the last chunk of their type
    rest = [(t, base[o:o + sz]) for o, t, _, sz in body if o >= pkg_o + ks_o + struct.unpack_from('<I', base, pkg_o + ks_o + 4)[0]]
    spec_at = {}
    for i, (t, c) in enumerate(rest):
        if t == RES_TABLE_TYPE_SPEC:
            spec_at[c[8]] = i
    extra = {}
    for s in splits:
        spool_o, spkg_o = parse_table(s)
        sstrings, _, _ = read_pool(s, spool_o)
        str_map = [gpool.get(x) for x in sstrings]
        _, _, sks_o, sbody = package_parts(s, spkg_o)
        skeys, _, _ = read_pool(s, spkg_o + sks_o)
        key_map = [kpool.get(x) for x in skeys]
        for o, t, _, sz in sbody:
            if t == RES_TABLE_TYPE_SPEC:
                tid, n = s[o + 8], struct.unpack_from('<I', s, o + 12)[0]
                i = spec_at[tid]
                spec = bytearray(rest[i][1])
                bn = struct.unpack_from('<I', spec, 12)[0]
                if n > bn:   # entries only the split defines: grow the spec (base type chunks may stay shorter)
                    spec += bytes(4 * (n - bn))
                    struct.pack_into('<I', spec, 4, len(spec))
                    struct.pack_into('<I', spec, 12, n)
                sh = struct.unpack_from('<H', s, o + 2)[0]
                bh = struct.unpack_from('<H', spec, 2)[0]
                for k in range(n):   # OR in the config-change flags
                    f = struct.unpack_from('<I', spec, bh + 4 * k)[0] | struct.unpack_from('<I', s, o + sh + 4 * k)[0]
                    struct.pack_into('<I', spec, bh + 4 * k, f)
                rest[i] = (t, bytes(spec))
            elif t == RES_TABLE_TYPE:
                tid, c = remap_type_chunk(s, o, sz, key_map, str_map)
                extra.setdefault(tid, []).append(c)
    # rebuild the package: header, type strings (unchanged), keys (grown), chunks with split types inserted
    out_chunks, last_of = [], {}
    for t, c in rest:
        if t in (RES_TABLE_TYPE, RES_TABLE_TYPE_SPEC):
            last_of[c[8]] = len(out_chunks)
        out_chunks.append(c)
    for tid in sorted(extra, key=lambda x: -last_of[x]):   # insert from the back so indices hold
        out_chunks[last_of[tid] + 1:last_of[tid] + 1] = extra[tid]
    type_pool = base[pkg_o + ts_o:pkg_o + ks_o]
    key_pool = build_pool(kpool.strings, UTF8)
    header = bytearray(base[pkg_o:pkg_o + ph])
    struct.pack_into('<I', header, 268, ph)                       # typeStrings offset
    struct.pack_into('<I', header, 276, ph + len(type_pool))      # keyStrings offset
    pkg = bytes(header) + type_pool + key_pool + b''.join(out_chunks)
    pkg = pkg[:4] + struct.pack('<I', len(pkg)) + pkg[8:]
    gp = build_pool(gpool.strings, gflags, gstyles)
    total = 12 + len(gp) + len(pkg)
    return struct.pack('<HHII', 0x2, 12, total, 1) + gp + pkg


# ---- manifest ---------------------------------------------------------------------------------
def unsplit_manifest(d):
    d = bytearray(d)
    _, h, _ = struct.unpack_from('<HHI', d, 0)
    strings, resmap, changed, meta_name = None, [], 0, None
    for o, t, ch, sz in chunks(d, h, len(d)):
        if t == RES_STRING_POOL:
            fl = struct.unpack_from('<I', d, o + 16)[0]
            if fl & UTF8:
                strings, _, _ = read_pool(d, o)
            else:   # manifests are usually UTF-16
                count, s_start = struct.unpack_from('<I', d, o + 8)[0], struct.unpack_from('<I', d, o + 20)[0]
                strings = []
                for i in range(count):
                    p = o + s_start + struct.unpack_from('<I', d, o + ch + 4 * i)[0]
                    n = struct.unpack_from('<H', d, p)[0]
                    strings.append(d[p + 2:p + 2 + 2 * n].decode('utf-16-le'))
        elif t == 0x180:
            resmap = list(struct.unpack_from(f'<{(sz - ch) // 4}I', d, o + ch))
        elif t == 0x102:   # start element
            name = strings[struct.unpack_from('<I', d, o + 20)[0]]
            a_start, a_size, a_count = struct.unpack_from('<HHH', d, o + 24)
            attrs = [o + 16 + a_start + a_size * i for i in range(a_count)]
            def aname(a):
                return strings[struct.unpack_from('<I', d, a + 4)[0]]
            for a in attrs:
                ni = struct.unpack_from('<I', d, a + 4)[0]
                rid = resmap[ni] if ni < len(resmap) else 0
                if name == 'application' and rid == ATTR_IS_SPLIT_REQUIRED:
                    struct.pack_into('<I', d, a + 16, 0); changed += 1
                if name == 'manifest' and rid == ATTR_REQUIRED_SPLIT_TYPES and '' in strings:   # Android 14+ only
                    e = strings.index('')
                    struct.pack_into('<i', d, a + 8, e); struct.pack_into('<I', d, a + 16, e); changed += 1
            if name == 'meta-data':
                byname = {aname(a): a for a in attrs}
                if 'name' in byname and 'value' in byname:
                    ri = struct.unpack_from('<i', d, byname['name'] + 8)[0]
                    if ri >= 0 and strings[ri] == 'com.android.vending.splits.required':
                        struct.pack_into('<I', d, byname['value'] + 16, 0); changed += 1
    return bytes(d), changed


def main(base_path, out_path, split_paths):
    base = zipfile.ZipFile(base_path)
    splits = [zipfile.ZipFile(p) for p in split_paths]
    table = merge_tables(base.read('resources.arsc'),
                         [s.read('resources.arsc') for s in splits if 'resources.arsc' in s.namelist()])
    manifest, changed = unsplit_manifest(base.read('AndroidManifest.xml'))
    print(f'manifest: {changed} split flag(s) cleared')
    seen = set()
    skip = ('META-INF/', 'stamp-cert-sha256')
    with zipfile.ZipFile(out_path, 'w') as out:
        def put(info, data):
            if info.filename in seen or info.filename.startswith(skip):
                return
            seen.add(info.filename)
            zi = zipfile.ZipInfo(info.filename, info.date_time)
            zi.compress_type = info.compress_type
            out.writestr(zi, data)
        for info in base.infolist():
            if info.filename == 'resources.arsc':
                zi = zipfile.ZipInfo('resources.arsc', info.date_time)   # stored, as API 30 requires
                seen.add('resources.arsc'); out.writestr(zi, table)
            elif info.filename == 'AndroidManifest.xml':
                put(info, manifest)
            else:
                put(info, base.read(info))
        for s in splits:
            for info in s.infolist():
                if info.filename not in ('AndroidManifest.xml', 'resources.arsc'):
                    assert info.filename not in seen or info.filename.startswith(skip), f'clash: {info.filename}'
                    put(info, s.read(info))
    print(f'wrote {out_path} ({len(seen)} entries)')


if __name__ == '__main__':
    if len(sys.argv) < 4:
        sys.exit(__doc__)
    main(sys.argv[1], sys.argv[2], sys.argv[3:])
