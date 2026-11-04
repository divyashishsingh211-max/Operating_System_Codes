# Experiment 3 — Bash Scripting: Conditionals & Loops

**Aim:** To write a Bash script that checks multiple arguments and identifies each one as a regular file, a directory, or a non-existent path.

## Script

| File | Purpose |
| --- | --- |
| `check_type.sh` | Checks every argument using the `-f` and `-d` tests |

## Commands & Concepts

| Item | Meaning | Use |
| --- | --- | --- |
| `$#` | Argument count | Checks whether at least one argument was passed |
| `$@` | All arguments | Loops over every file or directory name |
| `for ... in ...` | For loop | Repeats the check for each argument |
| `-f` | File test | True if the path is a regular file |
| `-d` | Directory test | True if the path is a directory |
| `elif` | Else-if | Checks the directory condition when `-f` is false |
| `exit 1` | Exit status | Stops the script with an error when usage is wrong |

## How to Run

```bash
chmod +x check_type.sh
./check_type.sh /etc/passwd /var/log /no/such/path
```

## Sample Output

```text
/etc/passwd is a regular file.
/var/log is a directory.
/no/such/path does not exist.
```

## Conclusion

The script uses positional parameters, a `for` loop, and file-test operators to classify each argument passed on the command line.
