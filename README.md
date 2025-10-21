## Example commands

### Generate C source from the promela file

```
spin -a traffic.pml
```

### Compile the pan.c file using gcc

```
gcc -o pan pan.c
```

### Run the pan executable checker

```
./pan -a
```

If the property is satisfied, the following phrase will be shown :
State-vector 28 byte, depth reached 27, errors: 0

If the propety is violated, then the following command replays the error trace (using the .trail file generated during the run) to track the exact sequence leading to the error.

```
spin -p -g -l -t traffic.pml
```
