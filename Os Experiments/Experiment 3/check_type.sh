#!/bin/bash
# Experiment 3 - Task 1
# Check whether the argument is a regular file, a directory, or does not exist.

if [ $# -ne 1 ]; then
  echo "No Argument passed, Try Again with an Argument"
  exit 1
fi

target="$1"

if [ -f "$target" ]; then
  echo "$target is a regular file."
elif [ -d "$target" ]; then
  echo "$target is a directory."
elif [ -e "$target" ]; then
  echo "$target exists, but is neither a regular file nor a directory."
else
  echo "Error: $target does not exist."
fi
