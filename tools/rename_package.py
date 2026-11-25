"""Give the APK its own application id (e.g. com.carlosrpg.waze) so it installs next to a normal Waze.

Used by assemble.py on the original's binary AndroidManifest.xml and resources.arsc. Class names stay com.waze.*
(only the app's identity moves): the manifest's package, every provider authority and Waze's own permissions
(names under the old id; two apps cannot both define them or both own an authority) and the resource table's
package name (Waze and the patches look resources up with getIdentifier(..., getPackageName())). Component class
names in the manifest are already absolute, so they keep pointing at com.waze.* classes.
"""
import struct

RES_STRING_POOL, RES_XML_START_ELEMENT, RES_XML_RESOURCE_MAP, RES_TABLE_PACKAGE = 0x1, 0x102, 0x180, 0x200
UTF8, TYPE_STRING = 0x100, 0x03
PERMISSION_ELEMENTS = {"permission", "permission-group", "permission-tree", "uses-permission", "uses-permission-sdk-23"}
PERMISSION_ATTRS = {"permission", "readPermission", "writePermission"}


def _chunks(d, start, end):
    o = start
    while o < end:
        t, h, sz = struct.unpack_from("<HHI", d, o)
        yield o, t, h, sz
        o += sz


def _read_pool(d, o):
    _, h, sz, count, styles, flags, s_start, _ = struct.unpack_from("<HHIIIIII", d, o)
    assert styles == 0, "styled strings in a manifest pool"
    out = []
    for i in range(count):
        p = o + s_start + struct.unpack_from("<I", d, o + h + 4 * i)[0]
        if flags & UTF8:
            p += 2 if d[p] & 0x80 else 1                       # utf-16 length
            n = (d[p] & 0x7f) << 8 | d[p + 1] if d[p] & 0x80 else d[p]
            p += 2 if d[p] & 0x80 else 1
            out.append(d[p:p + n].decode("utf-8", "surrogatepass"))
        else:
            n = struct.unpack_from("<H", d, p)[0]
            if n & 0x8000:
                n = (n & 0x7fff) << 16 | struct.unpack_from("<H", d, p + 2)[0]; p += 2
            out.append(d[p + 2:p + 2 + 2 * n].decode("utf-16-le", "surrogatepass"))
    return out, flags


def _build_pool(strings, flags):
    data, offs = bytearray(), []
    for s in strings:
        offs.append(len(data))
        if flags & UTF8:
            b = s.encode("utf-8", "surrogatepass")
            for n in (len(s.encode("utf-16-le", "surrogatepass")) // 2, len(b)):
                data += bytes([0x80 | n >> 8, n & 0xff]) if n > 0x7f else bytes([n])
            data += b + b"\0"
        else:
            b = s.encode("utf-16-le", "surrogatepass")
            assert len(b) // 2 < 0x8000
            data += struct.pack("<H", len(b) // 2) + b + b"\0\0"
    while len(data) % 4:
        data += b"\0"
    s_start = 28 + 4 * len(offs)
    body = struct.pack(f"<{len(offs)}I", *offs) + bytes(data)
    return struct.pack("<HHIIIIII", RES_STRING_POOL, 28, 28 + len(body), len(offs), 0, flags, s_start, 0) + body


def _moved(value, old, new):
    return new + value[len(old):] if value == old or value.startswith(old + ".") else value


def rename_manifest(d, new):
    """Binary AndroidManifest.xml with the app id moved to new. Returns (bytes, old id, changed attribute count)."""
    d = bytearray(d)
    _, h, _ = struct.unpack_from("<HHI", d, 0)
    pool_at = strings = flags = old = None
    changed = 0
    for o, t, ch, sz in _chunks(d, h, len(d)):
        if t == RES_STRING_POOL:
            pool_at, (strings, flags) = (o, sz), _read_pool(d, o)
        elif t == RES_XML_START_ELEMENT:
            elem = strings[struct.unpack_from("<I", d, o + 20)[0]]
            a_start, a_size, a_count = struct.unpack_from("<HHH", d, o + 24)
            for i in range(a_count):
                a = o + 16 + a_start + a_size * i
                attr = strings[struct.unpack_from("<I", d, a + 4)[0]]
                raw = struct.unpack_from("<i", d, a + 8)[0]
                if raw < 0 or d[a + 15] != TYPE_STRING:
                    continue
                v = strings[raw]
                if elem == "manifest" and attr == "package":   # the first element, so old is known from here on
                    old, nv = v, new
                elif attr == "authorities":
                    nv = ";".join(_moved(x, old, new) for x in v.split(";"))
                elif (elem in PERMISSION_ELEMENTS and attr == "name") or attr in PERMISSION_ATTRS:
                    nv = _moved(v, old, new)
                else:
                    continue
                if nv != v:
                    strings.append(nv)   # appended: the resource map only covers the pool's leading attribute names
                    struct.pack_into("<i", d, a + 8, len(strings) - 1)
                    struct.pack_into("<I", d, a + 16, len(strings) - 1)
                    changed += 1
    assert old, "no package in the manifest"
    o, sz = pool_at
    out = d[:o] + _build_pool(strings, flags) + d[o + sz:]
    struct.pack_into("<I", out, 4, len(out))
    return bytes(out), old, changed


def rename_table(d, old, new):
    """resources.arsc with its (single) package's name moved from old to new."""
    d = bytearray(d)
    _, h, _ = struct.unpack_from("<HHI", d, 0)
    for o, t, ch, sz in _chunks(d, h, len(d)):
        if t == RES_TABLE_PACKAGE:
            name = d[o + 12:o + 12 + 256].decode("utf-16-le").split("\0")[0]
            assert name == old, f"resource package is {name}, expected {old}"
            assert len(new) < 128
            d[o + 12:o + 12 + 256] = new.encode("utf-16-le").ljust(256, b"\0")
            return bytes(d)
    raise AssertionError("no package chunk in resources.arsc")
