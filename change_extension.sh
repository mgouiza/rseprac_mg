#!/bin/bash

#######################################
### Script to change file extension ###
#######################################

# Check if the directory, old extension, and new extension are provided as arguments
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: $0 <directory> <old_extension> <new_extension>"
    exit 1
fi

# Directory, old extension, and new extension provided as arguments
dir=$1
old_ext=$2
new_ext=$3

# Check if the directory exists
if [ ! -d "$dir" ]; then
    echo "Directory $dir does not exist."
    exit 1
fi

# Change the old extension for all files in the directory to the new extension
for file in "$dir"/*."$old_ext"; do
    # Extract the base name without extension
    base=$(basename "$file" ."$old_ext")
    # change file extension
    mv "$file" "${dir}/${base}.${new_ext}"
done

echo "Renamed all files with .$old_ext extension in $dir to have a .$new_ext extension."
