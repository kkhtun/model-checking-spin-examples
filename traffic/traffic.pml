mtype = { RED, YELLOW, GREEN };

mtype ns_light = GREEN;
mtype ew_light = RED;

active proctype controller() {
    do
    :: ns_light == GREEN ->
        printf("NS: GREEN | EW: RED\n");
        ns_light = YELLOW;

    :: ns_light == YELLOW ->
        printf("NS: YELLOW | EW: RED\n");
        ns_light = RED;
        ew_light = GREEN;

    :: ew_light == GREEN ->
        printf("NS: RED | EW: GREEN\n");
        ew_light = YELLOW;

    :: ew_light == YELLOW ->
        printf("NS: RED | EW: YELLOW\n");
        ew_light = RED;
        ns_light = GREEN;
    od
}

// LTL property: never both GREEN at the same time (or cars will crash)
ltl safe { [] !(ns_light == GREEN && ew_light == GREEN) }
