package com.carlosrpg.wazenotify;

/** Run with plain java; exits non-zero on the first wrong answer. Version-independent self-check. */
public final class NavTextCheck {
    private static void eq(Object actual, Object expected) {
        if (expected == null ? actual != null : !expected.equals(actual)) {
            throw new AssertionError("expected <" + expected + "> but was <" + actual + ">");
        }
    }

    public static void main(String[] args) {
        eq(NavText.drawableFor("TURN_LEFT"), "big_direction_left");
        eq(NavText.drawableFor("ROUNDABOUT_EXIT_RIGHT"), "big_directions_roundabout_r");
        eq(NavText.drawableFor("SLIGHT_RIGHT"), "big_direction_exit_right");
        eq(NavText.drawableFor("NAV_INSTR_NONE"), null);
        eq(NavText.drawableFor(null), null);

        eq(NavText.describe("KEEP_RIGHT"), "Keep right");
        eq(NavText.describe("NAV_INSTR_NONE"), "");

        eq(NavText.distance(312), "312 m");
        eq(NavText.distance(1180), "1.2 km");
        eq(NavText.distance(0), "");

        eq(NavText.instruction("TURN_LEFT", " Rua Augusta ", "Vire à esquerda"), "Rua Augusta");
        eq(NavText.instruction("TURN_LEFT", "", "Vire à esquerda"), "Vire à esquerda");
        eq(NavText.instruction("TURN_LEFT", "", null), "Turn left");
        eq(NavText.instruction("ROUNDABOUT_EXIT_LEFT", "Av. Paulista", null), "Av. Paulista");

        eq(NavText.promptKey("ROUNDABOUT_EXIT_LEFT", 2), "CUSTOM_PROMPT_SECOND");
        eq(NavText.promptKey("ROUNDABOUT_ENTER", 0), "CUSTOM_PROMPT_ROUNDABOUT");
        eq(NavText.promptKey("ROUNDABOUT_ENTER", 9), "CUSTOM_PROMPT_ROUNDABOUT");
        eq(NavText.promptKey("ROUNDABOUT_U", 3), "CUSTOM_PROMPT_U_TURN");
        eq(NavText.promptKey("SHARP_RIGHT", 0), "CUSTOM_PROMPT_TURN_RIGHT");
        eq(NavText.promptKey("APPROACHING_DESTINATION", 0), "CUSTOM_PROMPT_ARRIVE");
        eq(NavText.promptKey("NAV_INSTR_NONE", 0), null);

        eq(NavText.exitLabel("ROUNDABOUT_EXIT_RIGHT", 3), "3");
        eq(NavText.exitLabel("ROUNDABOUT_EXIT_RIGHT", 0), null);
        eq(NavText.exitLabel("TURN_RIGHT", 2), null);

        eq(NavText.eta(12), "12 min");
        eq(NavText.eta(80), "1 h 20 min");
        eq(NavText.eta(120), "2 h");
        eq(NavText.eta(0), "");

        eq(NavText.remaining(850), "850 m");
        eq(NavText.remaining(5234), "5.2 km");
        eq(NavText.remaining(0), "");
        eq(NavText.join("200 m", "Av. Paulista"), "200 m · Av. Paulista");
        eq(NavText.join("", "12 min"), "12 min");
        eq(NavText.join("", ""), "");

        eq(UpdateTag.build("waze-5.28.5.0-build6"), 6);
        eq(UpdateTag.build("waze-5.29.0.0-build12"), 12);
        eq(UpdateTag.build("waze-5.28.5.0"), 0);
        eq(UpdateTag.build("waze-5.28.5.0-buildx"), 0);
        eq(UpdateTag.build(null), 0);
        System.out.println("NavTextCheck: all checks passed");
    }
}
