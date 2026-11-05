# Experiment 9 — Process Creation & Termination Using C

**Aim:** To write a C program that creates a child process with `fork()`, waits for its termination with `wait()`, and displays the process IDs of both the parent and the child.

## Program

| File | Purpose |
| --- | --- |
| `fork_wait.c` | Forks a child, the child sleeps for 2 seconds, and the parent waits and prints the terminated child's PID |

## Concepts Used

| Function | Meaning | Use |
| --- | --- | --- |
| `fork()` | Clone the calling process | Returns `0` in the child and the child's PID in the parent |
| `getpid()` | Get process ID | Prints the current process's own PID |
| `wait(NULL)` | Wait for a child | Blocks the parent until the child exits and returns its PID |
| `sleep()` | Sleep | Keeps the child alive for 2 seconds so the parent can wait |
| `exit(0)` | Exit | Terminates the child cleanly |

## How to Run

```bash
gcc fork_wait.c -o fork_wait
./fork_wait
```

## Sample Output

```text
Parent Waiting for Child to terminate...
Child Running with PID: 4321
Child Exiting...
Parent Terminated Child PID: 4321
```

The PIDs will be different on every run.

## Result

The parent process successfully waited for the child to finish and displayed the PID of the terminated child.
