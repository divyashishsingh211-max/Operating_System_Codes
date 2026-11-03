#!/bin/bash
# Experiment 4 - Task 2
# Print lines between a start line and an end line.

if [ "$#" -ne 3 ]
then
    echo "Usage: $0 filename start_line end_line"
    exit 1
fi

file="$1"
start="$2"
end="$3"

sed -n "${start},${end}p" "$file"
