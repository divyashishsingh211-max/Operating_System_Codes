# Experiment 6 — Memory Allocation & Virtual Memory in C

**Aim:** To allocate a user-specified amount of memory using `malloc()`, touch every page so it becomes resident in RAM, and observe the change with `free -h`.

## Program

| File | Purpose |
| --- | --- |
| `memory.c` | Allocates `MB` memory, touches one byte per 4 KB page, and waits for `Ctrl+C` |

## Concepts Used

| Concept | Meaning | Use |
| --- | --- | --- |
| `argc` / `argv` | Argument count and vector | Reads the memory size from the command line |
| `atoi()` | ASCII to integer | Converts `argv[1]` from text to a number |
| `malloc()` | Memory allocation | Reserves virtual address space on the heap |
| 4 KB page | Standard Linux page size | The loop touches one byte every 4096 bytes |
| `free -h` | Free memory | Shows total, used, and available RAM |
| `top` | Process monitor | Shows the process's memory usage live |

## How to Run

```bash
gcc memory.c -o memory
./memory 500

# In a second terminal
free -h
watch -n 1 free -h
```

Press `Ctrl+C` in the first terminal to stop the program.

## Sample Output

```text
500 MB memory allocated.
Program is running... Press Ctrl+C to exit.
```

## Observation

- `malloc()` reserves **virtual** address space; it does not immediately reserve physical RAM.
- Writing to `memory[i]` once per 4 KB page forces each page to become resident.
- `free -h` shows a drop in available memory while the program is running.
- After `Ctrl+C`, the operating system reclaims the memory automatically.

## Note

`1024 × 1024` bytes is technically one **MiB**, but the program calls it MB for simplicity, as is common in lab exercises.
