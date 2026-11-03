# Experiment 2 — Shell Redirection & the `sed` Stream Editor

**Aim:** To learn shell redirection and basic text processing with the `sed` stream editor.

## Basic Commands

| Command | Meaning | Use |
| --- | --- | --- |
| `date` | Date | Shows the current date and time |
| `who` | Who | Lists users currently logged in |
| `cat > file` | Concatenate redirect | Creates a file from keyboard input; press `Ctrl+D` to save |
| `cat file` | Concatenate | Displays the contents of a file |

## Redirection Operators

| Operator | Meaning | Use |
| --- | --- | --- |
| `>` | Overwrite | Sends command output to a file, replacing old content |
| `>>` | Append | Adds command output to the end of a file |
| `2>` | Error redirect | Sends error messages to a file |
| `&>` | All output | Sends both normal output and errors to a file |
| `<` | Input redirect | Takes input from a file instead of the keyboard |

## `sed` Commands

| Command | Meaning | Use |
| --- | --- | --- |
| `sed -n 'p' file` | Print | Prints every line of the file |
| `sed -n '2p' file` | Print line 2 | Prints only line number 2 |
| `sed -n '2,4p' file` | Print range | Prints lines 2 through 4 |
| `sed -n '$p' file` | Print last line | Prints the last line |
| `sed '2d' file` | Delete | Removes line 2 from the output |
| `sed '1d' file` | Delete first line | Removes the first line |
| `sed '$d' file` | Delete last line | Removes the last line |
| `sed 's/old/new/' file` | Substitute | Replaces the first match on each line |
| `sed 's/old/new/g' file` | Global substitute | Replaces every match on each line |
| `sed -i 's/old/new/g' file` | In-place edit | Saves the change into the original file |
| `sed -i.bak 's/old/new/g' file` | Edit with backup | Saves the change and keeps a `.bak` copy |

## Special Symbols

| Symbol | Meaning |
| --- | --- |
| `^` | Beginning of a line |
| `$` | End of a line |
| `.` | Any single character |
| `*` | Zero or more occurrences |
| `[^ ]` | Any character except a space |
| `\(...\)` | Capture a group |
| `\1`, `\2` | First and second captured groups |

## Screenshots

- [Date and sed print commands](./experiment-2-1-date-and-sed-print.png)
- [sed delete and substitute](./experiment-2-2-sed-delete-and-substitute.png)
