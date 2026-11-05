# Experiment 7 — CPU-Bound vs I/O-Bound C Programs

**Aim:** To write a CPU-bound and an I/O-bound C program and compare their CPU utilization, process state, and accumulated CPU time using `top`.

## Programs

| File | Type | Behaviour |
| --- | --- | --- |
| `cpu_bound.c` | CPU-bound | Runs an infinite counter loop and prints every 100 million iterations |
| `io_bound.c` | I/O-bound | Writes `dummy.txt` once per second and then sleeps |

## Commands Used

| Command | Meaning | Use |
| --- | --- | --- |
| `gcc` | GNU C compiler | Compiles the C programs |
| `&` | Background operator | Runs a program in the background |
| `pgrep -af` | Process grep | Finds the PIDs of the running programs |
| `top` | Process monitor | Shows `%CPU`, process state, and `TIME+` |
| `top -p PID1,PID2` | Filter by PID | Monitors only the two selected processes |
| `kill` | Send signal | Stops the background programs |

## How to Run

```bash
gcc cpu_bound.c -o cpu_bound
gcc io_bound.c -o io_bound

./cpu_bound &
./io_bound &

pgrep -af 'cpu_bound|io_bound'
top -p <CPU_PID>,<IO_PID>
```

Inside `top`, press `P` to sort by CPU usage and `q` to quit.

## Observation Table

| Parameter | CPU-Bound | I/O-Bound |
| --- | --- | --- |
| CPU utilization (`%CPU`) | High, close to 100% of one core | Low |
| Process state (`S`) | Usually `R` (running) | Usually `S` (sleeping) |
| CPU time (`TIME+`) | Increases quickly | Increases slowly |
| Main activity | Repeated counter increments | File writing and sleeping |

## Cleanup

```bash
kill <CPU_PID> <IO_PID>
```

## Result

The CPU-bound program consumed significantly more CPU time, while the I/O-bound program used very little CPU because it spent most of its time waiting and sleeping.
