# Experiment 1 — Linux System Administration & Process Management

> **Aim:** To study and practise essential Linux system administration commands used for directory and file management, I/O redirection, pipes, text processing, and process management.

---

## Objectives

After completing this experiment, you should be able to:

- Navigate and manage the Linux directory tree.
- Create, copy, move, inspect, and delete files and directories.
- Redirect standard input, output, and error streams.
- Combine commands using pipes, `tee`, and `xargs`.
- Search file contents with `grep` and locate files with `find`.
- Edit files using the Vi/Vim and Nano text editors.
- Inspect, control, prioritise, and monitor processes.

## Environment

| Requirement | Details |
| --- | --- |
| Operating system | Ubuntu / any Linux distribution |
| Shell | Bash |
| Editors | Vim, Nano |
| User | A normal user account with `sudo` access |

---

## Table of Contents

1. [Directory Operations](#1-directory-operations)
2. [File Operations](#2-file-operations)
3. [I/O Redirection & Pipes](#3-io-redirection--pipes)
4. [Pipes, `tee`, and `xargs`](#4-pipes-tee-and-xargs)
5. [Text Search with `grep`](#5-text-search-with-grep)
6. [File Search with `find`](#6-file-search-with-find)
7. [Text Editors: Vi/Vim & Nano](#7-text-editors-vivim--nano)
8. [Linux Process Management](#8-linux-process-management)
9. [The Complete Process-Management Picture](#9-the-complete-process-management-picture)
10. [Running the Demo](#10-running-the-demo)
11. [Conclusion](#11-conclusion)

---

## 1. Directory Operations

### 1.1 `pwd` — Print Working Directory

Prints the full absolute path from the root directory to the current working location.

```bash
pwd
```

**Sample output:**

```text
/home/ubuntu
```

### 1.2 `cd` — Change Directory

Navigates the terminal session to a different directory.

```bash
cd [DIRECTORY]
```

| Action | Command |
| --- | --- |
| Move up one level | `cd ..` |
| Return to the previous directory | `cd -` |
| Return to the home directory (shortcut) | `cd ~` or simply `cd` |
| Return to the home directory (full path) | `cd /home/ubuntu` or `cd $HOME` |

**Example:**

```bash
cd /etc/netplan
```

### 1.3 `mkdir` — Make Directory

Creates one or more new directories.

```bash
mkdir [OPTION] DIRECTORY...
```

| Option | Purpose | Example |
| --- | --- | --- |
| `-p` | Create intermediate parent directories automatically | `mkdir -p ~/Documents/projects/app/src` |
| `-v` | Print a confirmation for every created directory | `mkdir -v ~/Downloads/iso` |
| `-m` | Set octal permissions at creation time | `mkdir -m 700 ~/.ssh` |

**Without the `~` shortcut:**

```bash
mkdir /home/ubuntu/scripts
mkdir -p /home/ubuntu/Documents/projects/app/src
mkdir -v /home/ubuntu/Downloads/iso
mkdir -m 700 /home/ubuntu/.ssh
```

**Changing permissions of an existing directory:**

```bash
chmod 755 ~/Documents/projects
# or
chmod 755 /home/ubuntu/Documents/projects
```

### 1.4 `rmdir` — Remove Directory

Deletes **empty** directories safely. It refuses to remove a directory that still contains files.

```bash
rmdir [OPTION] DIRECTORY...
```

| Option | Purpose | Example |
| --- | --- | --- |
| `-p` | Remove an empty directory chain (parents included) | `rmdir -p ~/Documents/projects/app/src` |
| `-v` | Confirm each deletion | `rmdir -v ~/Downloads/iso` |

**Examples:**

```bash
rmdir ~/Templates
rmdir -p ~/Documents/projects/app/src
rmdir -v ~/Downloads/iso
```

> **Remember:** `rmdir` only removes empty directories. Use `rm -r` to delete a directory together with its contents.

---

## 2. File Operations

### 2.1 `ls` — List Directory Contents

Lists directory contents and metadata.

```bash
ls [OPTION]... [FILE]...
```

| Option | Purpose |
| --- | --- |
| `-l` | Long format: permissions, owner, group, size, timestamp |
| `-a` | Show all entries, including hidden dotfiles (`.bashrc`, `.profile`) |
| `-h` | Human-readable file sizes (KB, MB, GB) |
| `-t` | Sort by modification time, newest first |
| `-R` | List files recursively through all subdirectories |

**Long listing of the home directory, including hidden files:**

```bash
ls -lah ~
# or
ls -lah /home/ubuntu
```

### 2.2 `touch` — Create an Empty File / Update Timestamps

Creates an empty file, or updates the access and modification timestamps of an existing file.

```bash
touch [OPTION]... FILE...
```

| Option | Purpose | Example |
| --- | --- | --- |
| `-c` | Do not create the file; update the timestamp only if it exists | `touch -c ~/.bashrc` |
| `-t` | Set a custom timestamp in `[[CC]YY]MMDDhhmm[.ss]` form | `touch -t 202601011200 ~/install.log` |
| `-d` | Accept a flexible human-readable date string | `touch -d "2026-04-23" ~/release_notes.txt` |

**Examples:**

```bash
touch ~/.bash_aliases
touch -c ~/.bashrc
touch -t 202601011200 ~/install.log
touch -d "2026-04-23" ~/release_notes.txt
touch -d "09:00" ~/.bash_aliases
```

### 2.3 `cp` — Copy Files and Directories

Copies files or directory trees from a source to a destination.

```bash
cp [OPTION]... SOURCE... DEST
```

| Option | Purpose | Example |
| --- | --- | --- |
| `-r` / `-R` | Copy a full directory tree recursively | `cp -r /etc/netplan ~/backup_netplan` |
| `-i` | Prompt before overwriting an existing file | `cp -i /etc/hosts ~/hosts` |
| `-p` | Preserve modes, ownership, and timestamps | `cp -p /etc/timezone ~/timezone_backup` |

**Example:**

```bash
cp /etc/skel/.bashrc ~/.bashrc.bak
```

### 2.4 `mv` — Move / Rename

Moves files or directories to a new location, or renames them.

```bash
mv [OPTION]... SOURCE... DEST
```

| Option | Purpose | Example |
| --- | --- | --- |
| `-i` | Prompt before overwriting the destination | `mv -i ~/test.conf /etc/netplan/` |
| `-n` | Never overwrite an existing destination file | `mv -n ~/.bashrc.bak ~/.bashrc` |
| `-v` | Print the name of every moved item | `mv -v ~/Downloads/*.deb ~/Packages/` |

**Example — rename a directory:**

```bash
mv ~/Desktop ~/Workspace
```

### 2.5 `rm` — Remove

Permanently deletes files and directories.

```bash
rm [OPTION]... FILE...
```

| Option | Purpose | Example |
| --- | --- | --- |
| `-r` | Delete a directory and its contents recursively | `rm -r ~/Downloads/temp_setup/` |
| `-f` | Force deletion; suppress prompts and missing-file errors | `rm -f /tmp/lockfile` |
| `-i` | Ask for confirmation before each deletion | `rm -i ~/.bash_history` |

> ⚠️ **Warning:** `rm` is irreversible. Never run `rm -rf` on a path you have not verified, and never on `/`, `~`, or a system directory.

### 2.6 `cat` — Concatenate and Display Files

Writes the entire contents of a file to standard output.

```bash
cat [OPTION]... [FILE]...
```

| Option | Purpose | Example |
| --- | --- | --- |
| `-n` | Number every output line | `cat -n /etc/shells` |
| `-b` | Number non-blank lines only | `cat -b /etc/issue` |

**Example:**

```bash
cat /etc/os-release
```

### 2.7 `head` and `tail` — View the Start or End of a File

Displays the beginning or the end of a file or input stream.

```bash
head -n [N] FILE
tail -n [N] FILE
```

**Examples:**

```bash
head -n 10 /etc/passwd      # first 10 user accounts
head -n 5 /etc/fstab        # first 5 filesystem mounts
tail -n 25 /var/log/auth.log # last 25 authentication log entries
tail -n 50 /var/log/dpkg.log # last 50 package installation entries
```

---

## 3. I/O Redirection & Pipes

### 3.1 Combining Multiple Files

```bash
cat data1 data2 > data3
```

Reads `data1` and `data2`, then redirects the combined output into a new file, `data3`. Verify with `ls` and inspect with `cat data3`.

### 3.2 Extracting Relevant Data from Large Logs

```bash
grep "Doctor" users.csv > doctor_data
```

Filters a large CSV, keeping only rows that contain `Doctor`, and saves them to a smaller file for analysis. View the result with `less doctor_data`.

### 3.3 File Descriptors and Standard Streams

Every process started by the shell has three default standard streams:

| Descriptor | Stream | Purpose |
| --- | --- | --- |
| `0` | Standard input (`stdin`) | Input from the keyboard or a redirected file |
| `1` | Standard output (`stdout`) | Normal, successful command output |
| `2` | Standard error (`stderr`) | Error messages when a command fails |

### 3.4 Overwrite (`>`) vs Append (`>>`)

```bash
echo "hello" > myfile     # creates or overwrites myfile
echo "buddy" >> myfile    # appends to myfile
cat myfile
```

**Output:**

```text
hello
buddy
```

- `>` replaces the existing contents.
- `>>` adds to the end without deleting existing contents.

### 3.5 Redirecting Errors (`2>`)

Redirection defaults to stdout (descriptor `1`). To capture errors, explicitly prefix the redirect with `2`.

```bash
cd /root/ > error.txt     # WRONG: "Permission denied" still prints to the terminal
cd /root/ 2> error.txt    # RIGHT: the error is written to error.txt
cat error.txt
```

### 3.6 Combined Redirection of Output and Errors (`&>`)

```bash
command &> error.txt
```

The `&` before the redirect tells the shell to capture both descriptor `1` and descriptor `2`, so every message — success or failure — is recorded in `error.txt`.

### 3.7 Standard Input Redirection (`<`)

```bash
cat < data1
```

Feeds the contents of `data1` to `cat` as standard input instead of reading from the keyboard. The visible result matches `cat data1`, but the data flow is different.

---

## 4. Pipes, `tee`, and `xargs`

### 4.1 Combining and Sorting Datasets

```bash
cat names.txt countries.txt | sort
```

`cat` merges the two files and pipes the result to `sort`, which arranges the lines alphabetically.

### 4.2 Extracting Unique Records

```bash
cat names.txt | sort | uniq
```

`uniq` removes **adjacent** duplicate lines, so `sort` must run first to bring duplicates together.

### 4.3 Viewing a Specific Line Range

```bash
cat data.txt | head -n 37 | tail -n 7
```

Displays lines 31–37 of `data.txt`: `head` keeps the first 37 lines, then `tail` extracts the last 7 of that subset.

### 4.4 `tee` — Split Output

```bash
ls | tee test.txt
```

Copies standard input to both the terminal and a file simultaneously, so output is saved while still being displayed in real time.

### 4.5 `xargs` — Convert stdin into Arguments

```bash
cat file_names.txt | xargs touch
```

`xargs` reads names from the file and passes them to `touch`, batch-creating files. It bridges commands that read arguments rather than streamed input.

---

## 5. Text Search with `grep`

`grep` (Global Regular Expression Print) is a terminal-based search tool, similar to `Ctrl+F`.

| Case | Option | Example | Purpose |
| --- | --- | --- | --- |
| Ignore case | `-i` | `grep -i "error" logs.txt` | Match regardless of letter case |
| Invert match | `-v` | `grep -v "error" logs.txt` | Show lines that do **not** match |
| Count matches | `-c` | `grep -c "Doctor" users.csv` | Print only the number of matching lines |
| Match whole word | `-w` | `grep -w "Carly" users.csv` | Avoid partial-word matches |
| Show line numbers | `-n` | `grep -n "Carly" users.csv` | Prefix each match with its line number |

---

## 6. File Search with `find`

`find` is one of the most powerful Linux tools and is frequently asked about in interviews and exams.

```bash
find [options] [path] [expression]
```

| Part | Meaning |
| --- | --- |
| **Options** | Add extra functionality |
| **Path** | Directory to search; defaults to the current directory |
| **Expression** | Search filters, actions, or patterns |

The dot (`.`) represents the current directory.

| Case | Expression | Example | Notes |
| --- | --- | --- | --- |
| Search by size | `-size` | `find . -size 4M` | Suffixes: `M` (MB), `k` (KB), `G` (GB), `b` (bytes) |
| Search by exact name | `-name` | `find . -name "a123"` | Case-sensitive |
| Case-insensitive name search | `-iname` | `find . -iname "a123"` | Matches `a123`, `A123`, etc. |
| Search by owner | `-user` | `find . -user root` | Useful on multi-user servers |
| Find empty files/directories | `-empty` | `find . -empty` | Lists zero-byte files and empty directories |

> **Observation:** `find . -name "a123"` returns nothing when the file on disk is named `A123`; `-iname` finds it.

---

## 7. Text Editors: Vi/Vim & Nano

### 7.1 Vi / Vim

A modal terminal editor with distinct **Normal**, **Insert**, and **Command** modes.

```bash
vim [FILE]
```

| Operation | Key | Description |
| --- | --- | --- |
| Enter Insert mode | `i` | Start typing text |
| Return to Normal mode | `Esc` | Leave Insert mode |
| Save | `:w` | Write the file |
| Quit | `:q` | Quit |
| Save and quit | `:wq` | Write and exit |
| Force quit without saving | `:q!` | Discard changes |
| Delete (cut) current line | `dd` | Cut the line |
| Copy (yank) current line | `yy` | Copy the line |
| Paste below the cursor | `p` | Paste the buffer |
| Undo | `u` | Undo the last action |
| Search forward | `/[pattern]` | `n` for next match, `N` for previous |

### 7.2 Nano

A modeless terminal editor that displays its shortcut keys on screen.

```bash
nano [FILE]
```

| Shortcut | Action |
| --- | --- |
| `Ctrl + O` | WriteOut (save); press `Enter` to confirm |
| `Ctrl + X` | Exit (prompts to save if modified) |
| `Ctrl + W` | Search ("Where is") |
| `Ctrl + K` | Cut the current line to the buffer |
| `Ctrl + U` | Uncut (paste) the line from the buffer |
| `Ctrl + _` | Jump to a line number |

---

## 8. Linux Process Management

### 8.1 `jobs` — Shell Jobs

Displays the jobs managed by the **current shell**, including background and stopped jobs.

```bash
sleep 100 &
sleep 200 &
jobs
```

**Sample output:**

```text
[1]+ Running    sleep 100 &
[2]+ Running    sleep 200 &
```

- `[1]` — Job ID (used by the shell, e.g. `fg %1`)
- `Running` — Job status
- `sleep 100` — Command

If you run `sleep 100` and press `Ctrl + Z`, `jobs` reports `[1]+ Stopped sleep 100`.

> **Job ID vs PID:** In `[1] 6721`, `1` is the job ID and `6721` is the process ID.
>
> **Remember:** `jobs` shows the jobs managed by *my current shell*.

### 8.2 `bg` — Continue a Stopped Job in the Background

Resumes a stopped job and lets it run in the background while returning the terminal to you.

```bash
sleep 100        # press Ctrl + Z
jobs             # [1]+ Stopped sleep 100
bg               # [1]+ Running sleep 100 &
bg %2            # resume job 2 specifically
```

**Process flow:** `Running → Ctrl + Z → Stopped → bg → Running in background`

> **Remember:** `bg` continues a stopped job in the background.

### 8.3 `fg` — Bring a Job to the Foreground

Brings a background or stopped job to the foreground.

```bash
sleep 100 &
jobs
fg        # bring the most recent job to the foreground
fg %2     # bring job 2 to the foreground
```

**Relationship:** `Background → fg → Foreground`

> **Remember:** `fg` brings a job to the foreground.

### 8.4 `ps` — Process Status

Displays information about processes associated with the current session.

```bash
ps
```

**Sample output:**

```text
  PID TTY          TIME CMD
 5025 pts/0    00:00:00 bash
 6721 pts/0    00:00:00 sleep
 6764 pts/0    00:00:00 ps
```

| Column | Meaning |
| --- | --- |
| `PID` | Process ID |
| `TTY` | Terminal associated with the process |
| `TIME` | CPU time used |
| `CMD` | Command |

> **Observation:** `5025 pts/0 bash` means Bash is running as process `5025` on terminal `pts/0`. The PID lets you manage the process, e.g. `kill 6721`.

### 8.5 `ps -e` — All Processes

Shows every process on the system, not just those in the current session.

```bash
ps -e
```

**Sample output:**

```text
    PID TTY          TIME CMD
      1 ?        00:00:05 systemd
      2 ?        00:00:00 kthreadd
    500 ?        00:00:00 NetworkManager
   5025 pts/0    00:00:00 bash
```

Linux uses processes for system and service management (`systemd`), networking (`NetworkManager`), remote access (`sshd`), shells (`bash`), and applications.

### 8.6 `ps -ef` — Full-Format Process Details

Shows all processes in full format, including the owner, PID, parent PID (PPID), start time, and launching command.

```bash
ps -ef
```

**Sample output:**

```text
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 20:00 ?        00:00:03 /sbin/init
root       500     1  0 20:00 ?        00:00:00 sshd
vboxuser  5025   500  0 21:00 pts/0    00:00:00 bash
vboxuser  6721  5025  0 21:10 pts/0    00:00:00 sleep 100
```

| Column | Meaning |
| --- | --- |
| `UID` | User who owns the process |
| `PID` | Process ID |
| `PPID` | Parent Process ID |
| `C` | CPU scheduling/accounting field |
| `STIME` | Process start time/date |
| `TTY` | Associated terminal (`pts/0`, `pts/1`, `?`) |
| `TIME` | CPU time consumed |
| `CMD` | Command that started the process |

> **Observation:** PID `6721` has PPID `5025`, so `bash` (5025) spawned `sleep` (6721).
>
> **Tip:** Inspect a process's parentage with `ps -p 5025 -f`.

### 8.7 `ps -p PID` — Select a Process by PID

Inspect one specific process, for example before killing it.

```bash
ps -p 6721
ps -p 6721 -f    # detailed form
```

> **Remember:** `ps -p PID` checks a specific process using its PID.

### 8.8 `ps -o` — Choose Columns

Displays exactly the columns you request.

```bash
ps -o pid,ni,cmd
```

**Sample output:**

```text
  PID  NI CMD
 5025   0 bash
 7100   0 sleep 300
 7150  10 sleep 300
```

This makes it easy to compare scheduling priority between a normal process (`NI = 0`) and a `nice`d process (`NI = 10`).

> **Remember:** `ps -o` customises which process information is displayed.

### 8.9 `ps aux` — Resource Usage

Shows processes with information useful for resource monitoring.

```bash
ps aux
```

| Column | Meaning |
| --- | --- |
| `USER` | Process owner |
| `PID` | Process ID |
| `%CPU` | CPU usage |
| `%MEM` | Memory usage |
| `STAT` | Process state |
| `COMMAND` | Command |

**Sample output:**

```text
USER       PID %CPU %MEM STAT COMMAND
vboxuser  5200 95.0  2.0 R    python3
vboxuser  5300  3.0 25.0 S    firefox
```

> **Key distinction:** `ps -ef` is best for detailed process information and parent/child relationships; `ps aux` is best for CPU and memory usage.

### 8.10 `kill` — Send a Signal to a Process

`kill` sends a signal to a process; it does not simply "destroy" it.

```bash
kill PID          # sends SIGTERM (signal 15) by default
kill 6721
```

**Basic flow:** find the process → get its PID → `kill PID` → `SIGTERM` → the process terminates normally.

> **Remember:** `kill` sends a signal to a process.

### 8.11 `kill -15 PID` — SIGTERM (Graceful Termination)

Signal 15 is `SIGTERM`: a request to terminate normally. It gives the application a chance to clean up — close files, save data, release connections, and exit.

```bash
kill -15 6721
```

`kill PID` and `kill -15 PID` are normally equivalent.

> **Remember:** `SIGTERM` is a graceful termination request.

### 8.12 `kill -9 PID` — SIGKILL (Forced Termination)

Signal 9 is `SIGKILL`: immediate termination. It cannot be caught, blocked, or ignored.

```bash
kill -9 6721
```

**Correct workflow:** `kill PID` → if it does not terminate → `kill -9 PID`.

> ⚠️ **Caution:** The application gets no opportunity to clean up. Use `-9` only as a last resort.
>
> **Remember:** `kill -9` forcefully terminates a process.

### 8.13 `kill -l` — List Signals

```bash
kill -l
```

| Signal | Number | Meaning |
| --- | --- | --- |
| `SIGHUP` | 1 | Hangup |
| `SIGINT` | 2 | Interrupt (Ctrl + C) |
| `SIGKILL` | 9 | Force termination |
| `SIGTERM` | 15 | Graceful termination |
| `SIGCONT` | 18 | Continue |
| `SIGSTOP` | 19 | Stop |

> **Remember:** `kill -l` lists the available signals.

### 8.14 `kill -STOP PID` — Suspend a Process

Sends `SIGSTOP` to suspend a running process without terminating it.

```bash
kill -STOP 7000
```

**Flow:** `RUNNING → SIGSTOP → STOPPED` — the process still exists in memory.

> ⚠️ **Lesson learned:** Accidentally running `kill -STOP` on your own Bash shell (e.g. `kill -STOP 4345`) freezes the terminal.
>
> **Remember:** `SIGSTOP` stops/pauses a process.

### 8.15 `kill -CONT PID` — Continue a Stopped Process

Sends `SIGCONT` to resume a stopped process.

```bash
kill -CONT 7000
```

**Flow:** `STOPPED → SIGCONT → RUNNING`

> **Remember:** `SIGCONT` continues a stopped process.

### 8.16 `nice` — Start a Process with a Priority

Starts a process with a specified nice value, influencing its CPU scheduling priority.

```bash
nice -n 10 sleep 300 &
ps -o pid,ni,cmd
```

| Nice value | Meaning |
| --- | --- |
| `-20` | Most favourable scheduling |
| `0` | Default |
| `+19` | Least favourable scheduling |

Lower `NI` → more favourable scheduling; higher `NI` → less favourable scheduling.

> **Misconception:** `nice -n 10` does **not** mean "run at 10% CPU"; it sets a scheduling priority weight.
>
> **Remember:** `nice` starts a process with a chosen nice value.

### 8.17 `renice` — Change the Priority of a Running Process

```bash
renice 10 -p PID
```

| Command | When it applies |
| --- | --- |
| `nice` | Set the nice value when **starting** a process |
| `renice` | Change the nice value of an **already-running** process |

> **Remember:** `renice` changes the nice value of an existing process.

### 8.18 `top` — Live Process Monitoring

`top` provides a continuously updating view of system processes and resource usage.

```bash
top
```

**Why `top` instead of `ps`?** `ps aux` is a photograph (a snapshot); `top` is live video (constant updates).

| Interactive key | Action |
| --- | --- |
| `q` | Exit `top` |
| `k` | Kill a process (prompts for PID and signal) |
| `c` | Toggle short vs full command line |
| `u` | Filter processes by username |
| `f` | Manage displayed fields/columns |
| `z` | Toggle colour display |
| `b` | Toggle highlighting of running processes |

> **Remember:** `top` provides live monitoring of processes and system resources.

---

## 9. The Complete Process-Management Picture

| Area | Commands | Purpose |
| --- | --- | --- |
| **Job control** | `jobs`, `bg`, `fg` | See, background, and foreground shell jobs |
| **Process inspection** | `ps`, `ps -e`, `ps -ef`, `ps -p PID`, `ps aux` | Session, system-wide, detailed, per-PID, and resource views |
| **Process control** | `kill`, `kill -15`, `kill -9`, `kill -STOP`, `kill -CONT`, `kill -l` | Send signals to terminate, stop, or continue processes |
| **Process priority** | `nice`, `renice` | Set priority at launch or change it later |
| **Live monitoring** | `top` | Continuously monitor processes and resources |

---

## 10. Running the Demo

The folder contains a self-contained demonstration script that exercises the commands from this experiment safely inside a temporary sandbox.

```bash
# From the repository root
make exp1

# Or run the script directly
bash experiments/01-linux-system-administration/demo.sh
```

The script:

- Creates a temporary sandbox under `/tmp` and removes it on exit.
- Demonstrates directory and file operations, redirection, pipes, `grep`, and `find`.
- Starts background processes to show `jobs`, `ps`, `nice`, `renice`, `kill`, and `top -b`.
- Never touches your real files or system processes.

A recorded sample run is available in [`output.txt`](./output.txt).

---

## 11. Conclusion

In this experiment, we explored the core Linux system administration commands:

- Directory and file management with `pwd`, `cd`, `mkdir`, `rmdir`, `ls`, `touch`, `cp`, `mv`, `rm`, `cat`, `head`, and `tail`.
- Stream redirection with `>`, `>>`, `2>`, `&>`, and `<`.
- Command composition with pipes, `sort`, `uniq`, `tee`, and `xargs`.
- Content search with `grep` and file search with `find`.
- File editing with Vim and Nano.
- Process management with `jobs`, `bg`, `fg`, `ps`, `kill`, `nice`, `renice`, and `top`.

These commands form the foundation for shell scripting, process control, and system administration tasks in the remaining experiments.
