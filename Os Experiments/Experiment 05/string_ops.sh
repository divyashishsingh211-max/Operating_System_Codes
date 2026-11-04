#!/bin/bash

read -p "Enter a String: " str
echo "Length of String: ${#str}"

read -p "Enter starting position: " start
read -p "Enter number of characters: " length

echo "Substring: ${str:$start:$length}"
