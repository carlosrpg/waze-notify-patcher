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

    private static final String[] ORDINALS = {"FIRST", "SECOND", "THIRD", "FOURTH", "FIFTH", "SIXTH", "SEVENTH"};

    /**
     * Name (without "DS_") of Waze's display string for a manoeuvre, shown when Waze gives no street name. NavNotifier
     * has Waze translate it into the app's language. The names are Waze's own constants (kept through obfuscation).
     */
    static String promptKey(String instruction, int exit) {
        if (instruction == null) return null;
        if (instruction.startsWith("ROUNDABOUT") && !instruction.endsWith("_U")) {
            return exit >= 1 && exit <= ORDINALS.length ? "CUSTOM_PROMPT_" + ORDINALS[exit - 1] : "CUSTOM_PROMPT_ROUNDABOUT";
        }
        switch (instruction) {
            case "TURN_LEFT": case "SHARP_LEFT": case "PREPARE_TURN_LEFT": return "CUSTOM_PROMPT_TURN_LEFT";
            case "TURN_RIGHT": case "SHARP_RIGHT": case "PREPARE_TURN_RIGHT": return "CUSTOM_PROMPT_TURN_RIGHT";
            case "KEEP_LEFT": case "SLIGHT_LEFT": return "CUSTOM_PROMPT_KEEP_LEFT";
            case "KEEP_RIGHT": case "SLIGHT_RIGHT": return "CUSTOM_PROMPT_KEEP_RIGHT";
            case "EXIT_LEFT": case "PREPARE_EXIT_LEFT": return "CUSTOM_PROMPT_EXIT_LEFT";
            case "EXIT_RIGHT": case "PREPARE_EXIT_RIGHT": return "CUSTOM_PROMPT_EXIT_RIGHT";
            case "CONTINUE_STRAIGHT": return "CUSTOM_PROMPT_STRAIGHT";
            case "U_TURN": case "ROUNDABOUT_U": case "ROUNDABOUT_EXIT_U": return "CUSTOM_PROMPT_U_TURN";
            case "APPROACHING_DESTINATION": return "CUSTOM_PROMPT_ARRIVE";
            default: return null;
        }
    }

    /** "TURN_LEFT" -> "Turn left"; the last resort when Waze gives no street and no translation. */
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

    /** The line under the distance: the street to turn onto, else Waze's translated words for the manoeuvre
     *  ({@code translated}, from {@link #promptKey}). The roundabout exit number is drawn on the arrow, as Waze does. */
    static String instruction(String instruction, String street, String translated) {
        String s = street == null ? "" : street.trim();
        if (!s.isEmpty()) return s;
        return translated != null && !translated.trim().isEmpty() ? translated.trim() : describe(instruction);
    }

    /** The number drawn on a roundabout arrow, or null. */
    static String exitLabel(String instruction, int exit) {
        return instruction != null && instruction.startsWith("ROUNDABOUT") && exit > 0 ? Integer.toString(exit) : null;
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
