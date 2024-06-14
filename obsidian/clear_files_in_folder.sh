#!/bin/bash

source config.sh
# source config_jdot.sh 

directory=$clear_files_directory

# Check if the provided argument is a directory
if [ ! -d "$directory" ]; then
    echo "Error: $directory is not a directory."
    exit 1
fi

# Prompt the user for confirmation
read -p "Are you sure you want to clear all markdown files in $directory? (y/n): " confirmation

# Convert to lowercase to handle Y/N inputs
confirmation=$(echo "$confirmation" | tr '[:upper:]' '[:lower:]')

if [ "$confirmation" != "y" ]; then
    echo "Operation cancelled."
    exit 0
fi

# Find and clear all markdown files in the directory
find "$directory" -type f -name "*.md" -exec sh -c '> "$1"' _ {} \;

echo "All markdown files in $directory have been cleared."