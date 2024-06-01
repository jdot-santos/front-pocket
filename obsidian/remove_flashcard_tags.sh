#!/bin/bash
source config.sh 
# source config_jdot.sh 

pattern='<!--SR:![0-9]{4}-[0-9]{2}-[0-9]{2},[0-9]+,[0-9]+-->'

read -p "Do you want to proceed with removing space reptition review tags starting in $flashcards_location? Type 'y' for Yes or 'n' for No: " answer

if [[ "$answer" == "y" ]]; then
    # Check all markdown files recursively starting from the specified directory
    find "$flashcards_root_dir" -type f -name "flashcard*.md" -print0 | while IFS= read -r -d $'\0' file; do
        # Use sed to delete lines containing the specific pattern
        sed -i '' -E "/$pattern/d" "$file"
        echo "Processed $file"
    done

    echo "All markdown files have been processed."

elif [[ "$answer" == "n" ]]; then
    echo "You chose NO, stopping the program."
    exit 0

else
    echo "Invalid input. Please runt he script again and type the correct answer"
    exit 1
fi
