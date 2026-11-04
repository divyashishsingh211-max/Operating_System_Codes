# Experiment 4 — User Session Tracking, Line Ranges & Text Processing

**Aim:** To calculate a user's working period, print a range of lines, and delete lines containing a given word using shell scripts.

## Scripts

| File | Purpose |
| --- | --- |
| `working_users.sh` | Shows logged-in users and calculates their total working time |
| `line_range.sh` | Prints lines between a start line and an end line |
| `delete_word.sh` | Deletes lines containing a word from one or more files |

## Commands & Concepts

| Command | Meaning | Use |
| --- | --- | --- |
| `w` | Who | Shows currently logged-in users and their activity |
| `awk` | Text processing | Extracts the login time of the given username |
| `date -d` | Date parse | Converts the login time into a Unix timestamp |
| `date +%s` | Timestamp | Gets the current time in seconds since the epoch |
| `$(( ))` | Arithmetic | Calculates total seconds, hours, and minutes |
| `sed -n 'start,endp'` | Print range | Prints only the requested lines |
| `sed -i "/word/d"` | Delete | Deletes matching lines directly in the file |
| `shift` | Shift arguments | Removes the word, leaving only the filenames |

## How to Run

```bash
chmod +x working_users.sh line_range.sh delete_word.sh

./working_users.sh
./line_range.sh names.txt 3 6
./delete_word.sh Aniket names.txt students.txt
```

## Sample Output

```text
Login time: 10:30
Total working time: 4 hours 15 minutes
```

```text
Aniket
Rohit
Neha
Priya
```

```text
Deleted lines containing 'Aniket' from names.txt
```

## Note

`w`/`who` and `date` must use the same timezone for the working-time calculation to be correct.
