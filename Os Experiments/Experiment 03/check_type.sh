#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <file/directory> ..."
    exit 1
fi

for item in "$@"
do
    if [ -f "$item" ]
    then
        echo "$item is a regular file."
    elif [ -d "$item" ]
    then
        echo "$item is a directory."
    else
        echo "$item does not exist."
    fi
done
