# Experiment 8 — Observing Process Memory Maps Using `pmap`

**Aim:** To examine the virtual memory mappings of the Experiment 7 processes using the `pmap` and `pmap -x` commands.

## Procedure

1. Compile and run the Experiment 7 programs in the background.
2. Find their PIDs with `pgrep -af 'cpu_bound|io_bound'`.
3. Run `pmap <PID>` and `pmap -x <PID>` for each process.
4. Observe the address, size, resident memory, permissions, and mapping name of every region.

## Commands Used

| Command | Meaning | Use |
| --- | --- | --- |
| `pmap PID` | Process map | Shows the memory regions of a process |
| `pmap -x PID` | Extended map | Adds RSS, Dirty, and Mode columns |
| `pgrep -af` | Process grep | Finds the PIDs of the running programs |
| `kill` | Send signal | Stops the background processes |

## `pmap -x` Columns

| Column | Meaning |
| --- | --- |
| `Address` | Starting virtual address of the memory region |
| `Kbytes` | Total size of the mapping in kilobytes |
| `RSS` | Resident Set Size — pages currently in physical RAM |
| `Dirty` | Pages that have been modified |
| `Mode` | Permissions: `r` read, `w` write, `x` execute |
| `Mapping` | File, library, or region name (`libc.so.6`, `[stack]`, etc.) |

Size order: `Dirty ≤ RSS ≤ Kbytes`.

## How to Run

```bash
# Automated demo
./pmap_demo.sh

# Or manually, after starting the Experiment 7 programs
pmap -x <PID>
```

The demo script compiles both Experiment 7 programs, runs them in the background, prints `pmap -x` for each, and cleans up automatically.

## Sample Output

```text
Address           Kbytes     RSS   Dirty Mode  Mapping
0000563c1a2b4000       4       4       0 r---- cpu_bound
0000563c1a2b5000       4       4       0 r-x-- cpu_bound
0000563c1a2b7000       4       4       4 rw--- cpu_bound
00007f8e3c000000    1892    1124       0 r-x-- libc.so.6
00007ffd5e2a1000     132      12      12 rw--- [ stack ]
...
total kB          2500    1400     120
```

## Observation

- Both programs have executable code, data, stack, heap, and shared-library mappings.
- `r-x--` regions are program code; `rw---` regions are writable data or stack.
- The CPU-bound and I/O-bound programs have similar memory-map layouts; their main difference is CPU usage, not map size.

## Result

The memory maps of both processes were examined and compared using `pmap` and `pmap -x`.
