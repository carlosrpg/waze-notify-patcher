package com.carlosrpg.wazenotify;

/** Pure text and icon-name rules for the navigation notification, free of Android types so they run on a JVM. */
final class NavText {
    private NavText() {}

    /**
     * Waze's own drawable for an instruction (its enum constant name), following the right-hand-traffic table.
     * The enum keeps its real constant names through obfuscation, so this is version-independent.
     * shortcut: no left-hand-traffic (_uk) roundabout icons; add them if the car drives on the left.
     */
    static String drawableFor(String instruction) {
        if (instruction == null) return null;
        switch (instruction) {
            case "TURN_LEFT": case "SHARP_LEFT": return "big_direction_left";
            case "TURN_RIGHT": case "SHARP_RIGHT": return "big_direction_right";
            case "KEEP_LEFT": case "EXIT_LEFT": case "SLIGHT_LEFT": return "big_direction_exit_left";
            case "KEEP_RIGHT": case "EXIT_RIGHT": case "SLIGHT_RIGHT": return "big_direction_exit_right";
            case "CONTINUE_STRAIGHT": return "big_direction_forward";
            case "ROUNDABOUT_ENTER": case "ROUNDABOUT_EXIT": return "big_directions_roundabout";
            case "ROUNDABOUT_LEFT": case "ROUNDABOUT_EXIT_LEFT": return "big_directions_roundabout_l";
            case "ROUNDABOUT_STRAIGHT": case "ROUNDABOUT_EXIT_STRAIGHT": return "big_directions_roundabout_s";
            case "ROUNDABOUT_RIGHT": case "ROUNDABOUT_EXIT_RIGHT": return "big_directions_roundabout_r";
            case "ROUNDABOUT_U": case "ROUNDABOUT_EXIT_U": return "big_directions_roundabout_u";
            case "APPROACHING_DESTINATION": return "big_direction_end";
            case "U_TURN": return "big_directions_uturn";
            case "ENTER_HOV_LANE": return "big_direction_hov";
            case "APPROACHING_STOP_POINT": return "big_direction_stop";
            default: return null;
        }
    }

    /** "TURN_LEFT" -> "Turn left"; used only when Waze gives no street name. */
    static String describe(String instruction) {
        if (instruction == null || instruction.isEmpty() || instruction.equals("NAV_INSTR_NONE")) return "";
        String s = instruction.replace('_', ' ').toLowerCase(java.util.Locale.ROOT);
        return Character.toUpperCase(s.charAt(0)) + s.substring(1);
    }

    /** Distance to the manoeuvre from raw metres, e.g. "312 m" or "1.2 km". Formatted here rather than from
     *  Waze's unit word, so it reads the same in any app language (Waze gives that word in English on some builds).
     *  shortcut: metric only; add imperial if a non-metric car ever needs it. */
    static String distance(int meters) {
        if (meters <= 0) return "";
        if (meters < 1000) return meters + " m";
        return String.format(java.util.Locale.ROOT, "%.1f km", meters / 1000.0);
    }

    /** The line under the distance: the street to turn onto, with the roundabout exit in front when there is one. */
    static String instruction(String instruction, int exit, String street) {
        String s = street == null ? "" : street.trim();
        boolean roundabout = instruction != null && instruction.startsWith("ROUNDABOUT");
        if (roundabout && exit > 0) return s.isEmpty() ? "Exit " + exit : "Exit " + exit + " · " + s;
        return s.isEmpty() ? describe(instruction) : s;
    }

    /** ETA to the destination from raw minutes, e.g. "12 min" or "1 h 20 min". Formatted here rather than from
     *  Waze's unit word, so it reads the same in any app language ("h"/"min" are the same abbreviations in pt-BR).
     *  shortcut: metric-style h/min split; no day-scale trips (a car ETA never reaches 24 h). */
    static String eta(int minutes) {
        if (minutes <= 0) return "";
        if (minutes < 60) return minutes + " min";
        int h = minutes / 60, m = minutes % 60;
        return m == 0 ? h + " h" : h + " h " + m + " min";
    }

    /** Remaining distance to the destination from raw metres, e.g. "850 m" or "5.2 km". */
    static String remaining(int meters) {
        if (meters <= 0) return "";
        if (meters < 1000) return meters + " m";
        return String.format(java.util.Locale.ROOT, "%.1f km", meters / 1000.0);
    }

    /** Join the non-empty parts with " · " (e.g. distance and road, or ETA and remaining distance). */
    static String join(String... parts) {
        StringBuilder b = new StringBuilder();
        for (String p : parts) {
            if (p == null || p.isEmpty()) continue;
            if (b.length() > 0) b.append(" · ");
            b.append(p);
        }
        return b.toString();
    }
}
