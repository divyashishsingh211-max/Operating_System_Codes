#!/usr/bin/env bash
#
# Experiment 1 - Linux System Administration & Process Management
# ---------------------------------------------------------------
# A safe, self-contained demonstration of the commands covered in this
# experiment. Everything happens inside a temporary sandbox under /tmp,
# which is removed automatically when the script exits.
#
# Usage:
#   bash demo.sh
#
# The script never modifies your real files and never signals processes
# that it did not start itself.

set -u

SANDBOX="$(mktemp -d "${TMPDIR:-/tmp}/os-lab1.XXXXXX")"
BACKGROUND_PIDS=()

cleanup() {
    local pid
    for pid in "${BACKGROUND_PIDS[@]:-}"; do
        kill -9 "$pid" 2>/dev/null || true
    done
    rm -rf "$SANDBOX"
}
trap cleanup EXIT

section() {
    printf '\n\n============================================================\n'
    printf ' %s\n' "$1"
    printf '============================================================\n'
}

show() {
    printf '\n$ %s\n' "$1"
    eval "$1"
}

cd "$SANDBOX" || exit 1

printf '============================================================\n'
printf ' Experiment 1 - Linux System Administration & Process Mgmt\n'
printf ' Demo run : %s\n' "$(date)"
printf ' Host     : %s\n' "$(uname -srm)"
printf ' Sandbox  : %s\n' "$SANDBOX"
printf '============================================================\n'

# ---------------------------------------------------------------
section "1. DIRECTORY OPERATIONS"
# ---------------------------------------------------------------

show 'pwd'
show 'mkdir -pv project/src/include'
show 'ls -ld project project/src project/src/include'
show 'mkdir -m 700 private_dir'
show 'ls -ld private_dir'
show 'rmdir -pv project/src/include'
show 'ls -d project 2>/dev/null || echo "project removed (rmdir -p removes empty parents)"'

# ---------------------------------------------------------------
section "2. FILE OPERATIONS"
# ---------------------------------------------------------------

show 'touch empty.txt'
show 'echo "Linux system administration demo" > notes.txt'
show 'cp notes.txt notes.bak'
show 'mv notes.bak notes_copy.txt'
show 'cat -n notes.txt'
show 'head -n 1 notes.txt'
show 'tail -n 1 notes.txt'
show 'ls -lah'

# ---------------------------------------------------------------
section "3. I/O REDIRECTION & PIPES"
# ---------------------------------------------------------------

show 'printf "line one\nline two\n" > data1'
show 'printf "line three\nline four\n" > data2'
show 'cat data1 data2 > data3'
show 'cat data3'

show 'echo "hello" > myfile'
show 'echo "buddy" >> myfile'
show 'cat myfile'

show 'printf "ID,Name,Profession\n1,Carly,Doctor\n2,John,Engineer\n3,Carly,Doctor\n4,Maya,Teacher\n5,Carly,Engineer\n" > users.csv'
show 'grep "Doctor" users.csv > doctor_data'
show 'cat doctor_data'

show '(cd /root/) 2> error.txt || true'
show 'cat error.txt'
show '(cd /root/) &> both.txt || true'
show 'cat both.txt'
show 'cat < data1'

# ---------------------------------------------------------------
section "4. PIPES, TEE, AND XARGS"
# ---------------------------------------------------------------

show 'printf "Zara\nAmit\nJohn\n" > names.txt'
show 'printf "India\nAustralia\nCanada\n" > countries.txt'
show 'cat names.txt countries.txt | sort'

show 'printf "Amit\nAmit\nZara\nJohn\nZara\n" > duplicates.txt'
show 'cat duplicates.txt | sort | uniq'

show 'seq 1 100 > data.txt'
show 'cat data.txt | head -n 37 | tail -n 7'

show 'ls | tee listing.txt'
show 'wc -l < listing.txt'

show 'printf "alpha.txt\nbeta.txt\ngamma.txt\n" > file_names.txt'
show 'cat file_names.txt | xargs touch'
show 'ls -1 alpha.txt beta.txt gamma.txt'

# ---------------------------------------------------------------
section "5. TEXT SEARCH WITH GREP"
# ---------------------------------------------------------------

show 'grep -i "doctor" users.csv'
show 'grep -v "Doctor" users.csv'
show 'grep -c "Doctor" users.csv'
show 'grep -w "Carly" users.csv'
show 'grep -n "Carly" users.csv'

# ---------------------------------------------------------------
section "6. FILE SEARCH WITH FIND"
# ---------------------------------------------------------------

show 'touch a123 A123 zero.txt'
show 'mkdir -p empty_dir'
show 'truncate -s 4M big.bin'
show 'find . -name "a123"'
show 'find . -iname "a123"'
show 'find . -empty'
show 'find . -size 4M'
show 'find . -maxdepth 1 -user "$(id -un)" | head -n 5'

# ---------------------------------------------------------------
section "7. TEXT EDITORS (VERSIONS)"
# ---------------------------------------------------------------

if command -v vim >/dev/null 2>&1; then
    show 'vim --version | head -n 1'
else
    printf '\n[vim is not installed on this host]\n'
fi

if command -v nano >/dev/null 2>&1; then
    show 'nano --version | head -n 1'
else
    printf '\n[nano is not installed on this host]\n'
fi

printf '\nInteractive editor shortcuts are documented in README.md (section 7).\n'

# ---------------------------------------------------------------
section "8. PROCESS MANAGEMENT"
# ---------------------------------------------------------------

show 'sleep 300 &'
JOB1=$!
BACKGROUND_PIDS+=("$JOB1")
show 'sleep 300 &'
JOB2=$!
BACKGROUND_PIDS+=("$JOB2")
sleep 0.2  # allow the shell to finish launching the background jobs

show 'jobs'
show "ps -p $JOB1 -o pid,ppid,stat,cmd"
show 'ps -e | head -n 5'
show 'ps -ef | head -n 5'
show 'ps aux | head -n 5'

show "kill -15 $JOB1"
wait "$JOB1" 2>/dev/null || true
show "ps -p $JOB1 -o pid=,stat=,cmd= || echo 'process $JOB1 terminated'"

show 'kill -l | head -n 4'

show 'nice -n 10 sleep 300 &'
NICE_PID=$!
BACKGROUND_PIDS+=("$NICE_PID")
sleep 0.2  # allow nice to apply the priority and exec sleep
show "ps -o pid,ni,cmd -p $NICE_PID"
show "renice 15 -p $NICE_PID"
show "ps -o pid,ni,cmd -p $NICE_PID"
show "kill -STOP $NICE_PID"
show "ps -o pid,stat,cmd -p $NICE_PID"
show "kill -CONT $NICE_PID"
show "ps -o pid,stat,cmd -p $NICE_PID"
show "kill -9 $NICE_PID"
wait "$NICE_PID" 2>/dev/null || true

show "kill -9 $JOB2"
wait "$JOB2" 2>/dev/null || true

show 'top -b -n 1 | head -n 12'

# ---------------------------------------------------------------
section "9. DEMO COMPLETE"
# ---------------------------------------------------------------

printf '\nAll commands executed successfully inside: %s\n' "$SANDBOX"
printf 'The sandbox will now be removed automatically.\n'
