bool mutex = false; // Semaphore
byte critical[2]; // Critical section

active [2] proctype P() {

    do
    ::  /* Check request */
        if
        :: !mutex -> mutex = true;
        :: else -> skip;
        fi;

        /* Critical section */
        critical[_pid] = 1;
        printf("P%d: Entered critical section\n", _pid);
        critical[_pid] = 0;

        /* Release */
        mutex = false;
        printf("P%d: Exited critical section\n", _pid);
    od
}

ltl never_cs_both {[] (critical[0] != 1 || critical[1] != 1)}