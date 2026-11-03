#!/bin/bash
# Experiment 5 - Part A
# Find the length of a string and extract a substring.

read -p "Enter a string: " str

echo "Length of string: ${#str}"

read -p "Enter starting position: " start

read -p "Enter number of characters: " length

echo "Substring: ${str:$start:$length}"
