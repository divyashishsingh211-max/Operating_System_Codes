#!/bin/bash
# Experiment 4 - Task 1
# Calculate how long a currently logged-in user has been working.

read -p "Enter username: " user

# Note: who and date must use the same timezone for this calculation.
login_time=$(who | awk -v u="$user" '$1 == u {print $3, $4; exit}')

if [ -z "$login_time" ]
then
    echo "User is not currently logged in."
else
    echo "Login time: $login_time"
    login_seconds=$(date -d "$login_time" +%s)
    current_seconds=$(date +%s)
    total_seconds=$((current_seconds - login_seconds))
    hours=$((total_seconds / 3600))
    minutes=$(((total_seconds % 3600) / 60))
    echo "Total working time: $hours hours $minutes minutes"
fi
