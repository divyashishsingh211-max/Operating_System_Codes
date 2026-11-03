# Operating System Codes

> A structured collection of Operating Systems laboratory experiments — commands, programs, and verified sample outputs.

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Experiments](https://img.shields.io/badge/Experiments-1%20%2F%2010-blue)
![Platform](https://img.shields.io/badge/Platform-Linux-lightgrey)
![Shell](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)

---

## Overview

This repository documents the Operating Systems lab work completed as part of the college curriculum. Each experiment lives in its own folder and contains:

- A **README** explaining the aim, concepts, commands/algorithms, and observations.
- The **source code or demonstration script** used in the experiment.
- A **recorded sample output** so results can be verified without rerunning everything.

The goal is to keep every experiment self-contained, reproducible, and easy to revise before exams or practicals.

---

## Repository Structure

```text
Operating_System_Codes/
├── README.md                  # This file
├── LICENSE                    # MIT license
├── Makefile                   # Convenience targets for running experiments
├── .gitignore
└── experiments/
    └── 01-linux-system-administration/
        ├── README.md          # Experiment manual (aim, commands, observations)
        ├── demo.sh            # Safe, self-contained demonstration script
        └── output.txt         # Verified sample run
```

Each new experiment follows the same layout:

```text
experiments/NN-experiment-name/
├── README.md      # Aim, theory, procedure, result
├── <source>       # .c / .sh / .py program or script
└── output.txt     # Sample output
```

---

## Experiments

| # | Experiment | Key Topics | Status |
| --- | --- | --- | --- |
| 01 | [Linux System Administration & Process Management](./experiments/01-linux-system-administration/) | Directories, files, redirection, pipes, `grep`, `find`, Vim/Nano, `ps`, signals, `nice`, `top` | ✅ Complete |
| 02 | To be added | — | ⏳ Planned |
| 03 | To be added | — | ⏳ Planned |
| 04 | To be added | — | ⏳ Planned |
| 05 | To be added | — | ⏳ Planned |
| 06 | To be added | — | ⏳ Planned |
| 07 | To be added | — | ⏳ Planned |
| 08 | To be added | — | ⏳ Planned |
| 09 | To be added | — | ⏳ Planned |
| 10 | To be added | — | ⏳ Planned |

---

## Getting Started

### Prerequisites

- A Linux system (Ubuntu or any distribution with Bash and GNU coreutils)
- `bash`, `make`
- Optional: `vim` and `nano` for the editor section
- For upcoming C experiments: `gcc`

### Clone the repository

```bash
git clone https://github.com/divyashishsingh211-max/Operating_System_Codes.git
cd Operating_System_Codes
```

### Run an experiment

```bash
# Run Experiment 1 through the Makefile
make exp1

# Or execute the script directly
bash experiments/01-linux-system-administration/demo.sh
```

The Experiment 1 demo creates a temporary sandbox under `/tmp`, runs the commands safely, prints the results, and removes the sandbox on exit.

### Regenerate the sample output

```bash
make output1
```

---

## Notes on Sample Output

- `output.txt` files are genuine runs recorded on a Linux machine.
- Paths, usernames, process IDs, timestamps, and load averages will differ on your system.
- Commands that require `sudo` or affect the wider system are described in the experiment README but are **not** executed by the demo scripts.

---

## Roadmap

- [x] Experiment 1 — Linux System Administration & Process Management
- [ ] Experiment 2 — To be added
- [ ] Experiment 3 — To be added
- [ ] Experiment 4 — To be added
- [ ] Experiment 5 — To be added
- [ ] Experiment 6 — To be added
- [ ] Experiment 7 — To be added
- [ ] Experiment 8 — To be added
- [ ] Experiment 9 — To be added
- [ ] Experiment 10 — To be added

---

## Author

**Divyashish Singh**

- GitHub: [@divyashishsingh211-max](https://github.com/divyashishsingh211-max)

---

## License

This project is licensed under the MIT License — see the [LICENSE](./LICENSE) file for details.
