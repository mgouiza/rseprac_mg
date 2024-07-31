#!/bin/bash

########################################################################
### Script to identify files that have fewer or more than 100 values ###
########################################################################

# Directory where sample files are stored
directory="problem_2"

# Lists to store information about files with fewer than 100 values
fewer_than_100_files=()

# Lists to store information about files with more than 100 values
more_than_100_files=()

# Iterate through all files in the directory
for filepath in "$directory"/*; do
    if [ -f "$filepath" ]; then
        # Count the number of numerical values in the file
        value_count=$(tr -s '[:space:]' '\n' < "$filepath" | grep -E '^[0-9]+(\.[0-9]+)?$' | wc -l)
        
        # Check if the number of values is less than 100
        if [ "$value_count" -lt 100 ]; then
            fewer_than_100_files+=("$filepath: $value_count values")
        # Check if the number of values is more than 100
        elif [ "$value_count" -gt 100 ]; then
            more_than_100_files+=("$filepath: $value_count values")
        fi
    fi
done

# Print the results
if [ ${#fewer_than_100_files[@]} -eq 0 ] && [ ${#more_than_100_files[@]} -eq 0 ]; then
    echo "All files have exactly 100 values."
else
    if [ ${#fewer_than_100_files[@]} -ne 0 ]; then
        echo "Files with fewer than 100 values:"
        for file in "${fewer_than_100_files[@]}"; do
            echo "$file"
        done
    fi

    if [ ${#more_than_100_files[@]} -ne 0 ]; then
        echo "Files with more than 100 values:"
        for file in "${more_than_100_files[@]}"; do
            echo "$file"
        done
    fi
fi
