#!/bin/bash

# source config.sh
source config_jdot.sh 

# Check if the provided argument is a directory
if [ ! -d "$prefix_to_full_dir" ]; then
    echo "Error: $prefix_to_full_dir is not a directory."
    exit 1
fi

# Prompt the user for confirmation
read -p "Do you want to proceed with prefixing content to $prefix_to_full_dir? Type 'y' for Yes or 'n' for No: " answer

# Convert input to lowercase
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

if [[ "$answer" == "y" ]]; then
    # Add the front matter to each markdown file in the directory (non-recursive)
    for file in "$prefix_to_full_dir"/*.md; do
        if [ -f "$file" ]; then
            # Use a temporary file to store the new content
            temp_file=$(mktemp)
            # Add the front matter to the beginning of the file
            echo -e "$prefix_content\n$(cat "$file")" > "$temp_file"
            # Move the temporary file back to the original file
            mv "$temp_file" "$file"
            echo "Prefixed journal content to $file"
        fi
    done

    echo "Prefix content added to all markdown files in $prefix_to_full_dir."

elif [[ "$answer" == "n" ]]; then
    echo "You chose NO, stopping the program."
    exit 0

else
    echo "Invalid input. Please runt he script again and type the correct answer"
    exit 1
fi