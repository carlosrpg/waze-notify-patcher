package com.carlosrpg.wazenotify;

/** Release tags are "waze-<waze version>-build<CI run number>"; the run number alone orders them. */
final class UpdateTag {
    private UpdateTag() {}

    /** The build number of a release tag, or 0 when it has none. */
    static int build(String tag) {
        int at = tag == null ? -1 : tag.lastIndexOf("-build");
        if (at < 0) return 0;
        try {
            return Integer.parseInt(tag.substring(at + 6));
        } catch (NumberFormatException e) {
            return 0;
        }
    }
}
