# Operating System Codes

> A complete collection of 10 Operating Systems laboratory experiments — Bash scripts, C programs, and verified sample outputs.

![Experiments](https://img.shields.io/badge/Experiments-10%20%2F%2010-blue)
![Language](https://img.shields.io/badge/Language-C%20%7C%20Bash-green)
![Platform](https://img.shields.io/badge/Platform-Linux-lightgrey)

---

## Overview

This repository contains the Operating Systems lab experiments completed as part of the college curriculum. Every experiment has its own folder with:

- A **README** explaining the aim, concepts, commands, and result.
- The **source code** (Bash script or C program).
- A **sample output** where applicable.

The experiments cover Linux commands, shell scripting, text processing, process management, memory management, and virtual memory.

---

## Experiments

| # | Experiment | Key Topics | Folder |
| --- | --- | --- | --- |
| 01 | Linux System Administration & Process Management | Directories, files, redirection, pipes, `grep`, `find`, `ps`, `kill`, `nice`, `top` | [Experiment 01](./Os%20Experiments/Experiment%2001/) |
| 02 | Shell Redirection & the `sed` Stream Editor | `>`, `>>`, `2>`, `&>`, `sed` print/delete/substitute, regex | [Experiment 02](./Os%20Experiments/Experiment%2002/) |
| 03 | Bash Scripting: Conditionals & Loops | `if`/`elif`, `for`, `$@`, `-f`, `-d`, file/directory check | [Experiment 03](./Os%20Experiments/Experiment%2003/) |
| 04 | User Session Tracking, Line Ranges & Text Processing | `w`, `awk`, `date`, timestamps, `sed -n`, `sed -i` | [Experiment 04](./Os%20Experiments/Experiment%2004/) |
| 05 | String Operations in Shell Script & C | `${#str}`, `${str:start:length}`, C arrays, `fgets`, `time` | [Experiment 05](./Os%20Experiments/Experiment%2005/) |
| 06 | Memory Allocation & Virtual Memory in C | `malloc`, 4 KB pages, `free -h`, `watch` | [Experiment 06](./Os%20Experiments/Experiment%2006/) |
| 07 | CPU-Bound vs I/O-Bound C Programs | `top`, `%CPU`, process state, `TIME+` | [Experiment 07](./Os%20Experiments/Experiment%2007/) |
| 08 | Observing Process Memory Maps Using `pmap` | `pmap -x`, RSS, Dirty, Mode, shared libraries | [Experiment 08](./Os%20Experiments/Experiment%2008/) |
| 09 | Process Creation & Termination Using C | `fork()`, `getpid()`, `wait()`, parent-child | [Experiment 09](./Os%20Experiments/Experiment%2009/) |
| 10 | Observing Virtual Memory Addresses in C | `%p`, ASLR, `setarch -R`, `-no-pie`, page tables | [Experiment 10](./Os%20Experiments/Experiment%2010/) |

---

## Repository Structure

```text
Operating_System_Codes/
└── Os Experiments/
    ├── Experiment 01/
    │   ├── README.md
    │   └── *.png
    ├── Experiment 02/
    │   ├── README.md
    │   └── *.png
    ├── Experiment 03/
    │   ├── README.md
    │   └── check_type.sh
    ├── Experiment 04/
    │   ├── README.md
    │   ├── working_users.sh
    │   ├── line_range.sh
    │   └── delete_word.sh
    ├── Experiment 05/
    │   ├── README.md
    │   ├── string_ops.sh
    │   └── string_ops.c
    ├── Experiment 06/
    │   ├── README.md
    │   ├── memory.c
    │   └── output.txt
    ├── Experiment 07/
    │   ├── README.md
    │   ├── cpu_bound.c
    │   ├── io_bound.c
    │   └── output.txt
    ├── Experiment 08/
    │   ├── README.md
    │   ├── pmap_demo.sh
    │   └── output.txt
    ├── Experiment 09/
    │   ├── README.md
    │   ├── fork_wait.c
    │   └── output.txt
    └── Experiment 10/
        ├── README.md
        ├── virtual_addr.c
        └── output.txt
```

---

## Getting Started

### Prerequisites

- A Linux system (Ubuntu or any distribution with Bash and GCC)
- `gcc` for the C programs
- `procps` for `top`, `ps`, and `pmap`

### Clone the repository

```bash
git clone https://github.com/divyashishsingh211-max/Operating_System_Codes.git
cd Operating_System_Codes
```

### Run a shell script

```bash
cd "Os Experiments/Experiment 03"
chmod +x check_type.sh
./check_type.sh /etc/passwd /var/log /no/such/path
```

### Compile and run a C program

```bash
cd "Os Experiments/Experiment 06"
gcc memory.c -o memory
./memory 500

# In another terminal
free -h
```

### Experiment-specific notes

- **Experiment 06:** the program runs until `Ctrl+C`; watch memory with `free -h` or `top`.
- **Experiment 07:** run both programs in the background (`&`) and inspect them with `top -p PID1,PID2`.
- **Experiment 08:** `./pmap_demo.sh` compiles and runs the Experiment 07 programs, prints `pmap -x`, and cleans up.
- **Experiment 09:** prints the parent and child PIDs; values differ on every run.
- **Experiment 10:** use `setarch $(uname -m) -R ./virtual_addr_fixed` to compare addresses with ASLR disabled.

---

## Notes on Sample Output

- `output.txt` files are real runs recorded on a Linux machine.
- Paths, usernames, PIDs, addresses, and timings will differ on your system.
- Programs that run forever (Experiments 06, 07, and 10) are stopped with `Ctrl+C` or `kill`.

---

## Acknowledgements

Experiments 6–10 were adapted from the Operating System Lab repository by [Harshit Singh Jamwal](https://github.com/harshit-singh-jamwal/Operating-System-LAB).

---

## Author

**Divyashish Singh**

- GitHub: [@divyashishsingh211-max](https://github.com/divyashishsingh211-max)
