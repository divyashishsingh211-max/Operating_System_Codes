#!/bin/bash
# Experiment 3 - Task 2
# Rename every file passed as an argument to uppercase.

for file in "$@"
do
  mv "$file" "$(echo "$file" | tr '[:lower:]' '[:upper:]')"
done
