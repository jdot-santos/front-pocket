#!/bin/bash

# Load configuration file
#source config.sh
source config_jdot.sh

# Prompt the user for confirmation
read -p "Do you want to proceed with creating journal entries for $YEAR in $journal_entries_root_dir? Type 'y' for Yes or 'n' for No: " answer

# Convert input to lowercase
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

# Check user input
if [[ "$answer" != "y" ]]; then
    if [[ "$answer" == "n" ]]; then
        echo "You chose NO, stopping the program."
        exit 0
    else
        echo "Invalid input. Please run the script again and type the correct answer."
        exit 1
    fi
fi

echo "Proceeding with creating journal entries..."

# Navigate to the journal directory
cd "$journal_entries_root_dir" || { echo "Failed to access directory: $journal_entries_root_dir"; exit 1; }

# List of months
months=("january" "february" "march" "april" "may" "june" "july" "august" "september" "october" "november" "december")

# Determine whether to create entries for the whole year or a specific month
if [[ "$CREATE_FULL_YEAR" == "true" ]]; then
    selected_months=("${months[@]}")
elif [[ -n "$SPECIFIC_MONTH" ]]; then
    # Convert month to lowercase and check if it's valid
    SPECIFIC_MONTH=$(echo "$SPECIFIC_MONTH" | tr '[:upper:]' '[:lower:]')
    if [[ ! " ${months[*]} " =~ " $SPECIFIC_MONTH " ]]; then
        echo "Error: Invalid month specified in config_jdot.sh ($SPECIFIC_MONTH). Please use a valid month name."
        exit 1
    fi
    selected_months=("$SPECIFIC_MONTH")
else
    echo "Error: Neither CREATE_FULL_YEAR nor SPECIFIC_MONTH is set in config_jdot.sh."
    exit 1
fi

# Create month directories and journal entries
for month in "${selected_months[@]}"; do
    # Get the numerical representation of the month (01 for January, 02 for February, etc.)
    month_num=$(printf "%02d" $(($(echo ${months[*]} | tr ' ' '\n' | grep -n "^$month$" | cut -d: -f1))))

    mkdir -p "$month/assets" "$month/entries"

    echo "Creating journal entries for $month ($month_num) in $YEAR..."

    for day in $(seq -w 1 31); do
        file_name="$month_num-$day-$YEAR.md"
        echo "# $month_num-$day-$YEAR" > "$month/entries/$file_name"
    done
done

echo "Journal entry creation completed!"