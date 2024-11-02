#!/bin/bash

source config.sh
# source config_jdot.sh 

# Check if the provided argument is a directory
if [ ! -d "$append_to_full_dir" ]; then
    echo "Error: $append_to_full_dir is not a directory or does not exist. Please check directory location and try again"
    exit 1
fi

# Prompt the user for confirmation
read -p "Do you want to proceed with appending journal content and TODOs to $append_to_full_dir? Type 'y' for Yes or 'n' for No: " answer

# Convert input to lowercase
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

# Check user input
if [[ "$answer" == "y" ]]; then
    echo "Proceeding with appending..."
    cd "$append_to_full_dir"

    # Loop through all markdown files in the current directory
    for file in "$append_to_full_dir"/*.md; do
        # Check if the file exists to prevent errors in case there are no .md files
        if [ -f "$file" ]; then
            # Append the journal content to each file
            echo -e "$journal_content" >> "$file"
            echo "Added journal content to $file"
        fi
    done

elif [[ "$answer" == "n" ]]; then
    echo "You chose NO, stopping the program."
    exit 0

else
    echo "Invalid input. Please runt he script again and type the correct answer"
    exit 1
fi