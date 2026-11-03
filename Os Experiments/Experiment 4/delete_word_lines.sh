#!/bin/bash
# Experiment 4 - Task 3
# Delete every line containing a given word from one or more files.

if [ "$#" -lt 2 ]
then
    echo "Usage: $0 word file1 [file2 ...]"
    exit 1
fi

word="$1"
shift

for file in "$@"
do
    sed -i "/$word/d" "$file"
done
