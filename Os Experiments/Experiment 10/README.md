# Experiment 10 — Observing Virtual Memory Addresses in C

**Aim:** To print the virtual address of a local variable from multiple concurrent processes and observe the effect of Address Space Layout Randomization (ASLR).

## Program

| File | Purpose |
| --- | --- |
| `virtual_addr.c` | Prints its PID and the address of a stack variable, then sleeps forever |

## Concepts Used

| Concept | Meaning | Use |
| --- | --- | --- |
| `%p` | Pointer format specifier | Prints a virtual address in hexadecimal |
| `&var` | Address-of operator | Gets the address of the local variable |
| `getpid()` | Get process ID | Identifies each running instance |
| ASLR | Address Space Layout Randomization | Randomizes stack, heap, and library base addresses |
| `setarch -R` | Disable ASLR | Runs a program with randomization turned off |
| `-no-pie` | No position-independent executable | Builds a fixed-address executable |

## How to Run

```bash
gcc virtual_addr.c -o virtual_addr

./virtual_addr &
./virtual_addr &
./virtual_addr &
./virtual_addr &

pgrep -a virtual_addr
killall virtual_addr
```

### With ASLR disabled

```bash
gcc -no-pie virtual_addr.c -o virtual_addr_fixed

setarch $(uname -m) -R ./virtual_addr_fixed &
setarch $(uname -m) -R ./virtual_addr_fixed &
setarch $(uname -m) -R ./virtual_addr_fixed &
setarch $(uname -m) -R ./virtual_addr_fixed &

killall virtual_addr_fixed
```

## Sample Output

ASLR enabled — addresses differ:

```text
PID: 5101 | Address: 0x7ffd8a3e41ac
PID: 5102 | Address: 0x7ffc1b9028dc
PID: 5103 | Address: 0x7ffe44d1953c
PID: 5104 | Address: 0x7ffdf012b76c
```

ASLR disabled — addresses are identical:

```text
PID: 5210 | Address: 0x7fffffffde4c
PID: 5211 | Address: 0x7fffffffde4c
PID: 5212 | Address: 0x7fffffffde4c
PID: 5213 | Address: 0x7fffffffde4c
```

## Observation

- With ASLR enabled, the stack address changes between runs.
- With ASLR disabled, every instance prints the same virtual address.
- The same virtual address does **not** mean the same physical memory: each process has its own page table, and the MMU maps the virtual address to a different physical frame.

## Result

The experiment verified that C pointers hold virtual addresses, not physical RAM addresses, and that the operating system and MMU isolate concurrent processes through per-process page tables.
