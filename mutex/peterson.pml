byte critical[2];
bool flag[2]; // Variables showing intent to enter the critical section
byte turn; // Which process's turn for the critical section

active [2] proctype P() {
    byte other = 1 - _pid;

    do
    ::  /* Request */
        flag[_pid] = true;
        turn = other;

        /* Wait until the other is not interested or it's current process's turn */
        do
        :: (turn == _pid || !flag[other]) -> break;
        od;

        /* Critical section */
        critical[_pid] = 1;
        printf("P%d: Entered critical section\n", _pid);
        critical[_pid] = 0;

        /* Release */
        flag[_pid] = false;
        printf("P%d: Exited critical section\n", _pid);
    od
}

ltl never_cs_both {[] (critical[0] != 1 || critical[1] != 1)}