# Experiment 5 — String Operations in Shell Script & C

**Aim:** To find the length of a string and extract a substring using a Bash script and an equivalent C program.

## Files

| File | Language | Purpose |
| --- | --- | --- |
| `string_ops.sh` | Bash | Finds length and substring using parameter expansion |
| `string_ops.c` | C | Finds length and substring using arrays and loops |

## Bash Concepts

| Syntax | Meaning | Use |
| --- | --- | --- |
| `${#str}` | String length | Returns the number of characters in the string |
| `${str:start:length}` | Substring | Extracts characters from `start` for `length` characters |
| `read -p` | Read input | Takes the string, start position, and length from the user |

## C Concepts

| Item | Meaning | Use |
| --- | --- | --- |
| `fgets` | File get string | Reads a line of input safely |
| `str[count]` | Character array | Stores the string and accesses each character |
| `while` loop | Length | Counts characters until `\n` or `\0` is reached |
| `scanf` | Scan formatted | Reads the start position and number of characters |
| `for` loop | Substring | Prints characters from `start` to `start + length` |

## How to Run

```bash
chmod +x string_ops.sh
./string_ops.sh

gcc string_ops.c -o string_ops
./string_ops
```

## Sample Output

```text
Enter a String: OperatingSystem
Length of String: 15
Enter starting position: 9
Enter number of characters: 6
Substring: System
```

## Time Comparison

```bash
time ./string_ops.sh
time ./string_ops
```

| Field | Meaning |
| --- | --- |
| `real` | Total elapsed (wall-clock) time |
| `user` | CPU time spent in user space |
| `sys` | CPU time spent in the kernel |

## Note

Bash string positions start from `0`, so in `OperatingSystem` the letter `O` is at position `0` and `S` is at position `9`.
