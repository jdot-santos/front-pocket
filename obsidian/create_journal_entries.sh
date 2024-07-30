#!/bin/bash
source config.sh  
# source config_jdot.sh 

# Prompt the user for confirmation
read -p "Do you want to proceed with creating $YEAR entries in $journal_entries_root_dir? Type 'y' for Yes or 'n' for No: " answer

# Convert input to lowercase
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

# Check user input
if [[ "$answer" == "y" ]]; then
    echo "Proceeding with appending..."
    cd "$journal_entries_root_dir"
    # create months
    mkdir -p \
        january/{assets,entries} \
        february/{assets,entries} \
        march/{assets,entries} \
        april/{assets,entries} \
        may/{assets,entries} \
        june/{assets,entries} \
        july/{assets,entries} \
        august/{assets,entries} \
        september/{assets,entries} \
        october/{assets,entries} \
        november/{assets,entries} \
        december/{assets,entries}

    echo "Creating entries now.."
    for i in $(seq 1 9);
    do
        echo "# 01-0$i-$YEAR" > january/entries/01-0$i-$YEAR.md
        echo "# 02-0$i-$YEAR" > february/entries/02-0$i-$YEAR.md
        echo "# 03-0$i-$YEAR" > march/entries/03-0$i-$YEAR.md
        echo "# 04-0$i-$YEAR" > april/entries/04-0$i-$YEAR.md
        echo "# 05-0$i-$YEAR" > may/entries/05-0$i-$YEAR.md
        echo "# 06-0$i-$YEAR" > june/entries/06-0$i-$YEAR.md
        echo "# 07-0$i-$YEAR" > july/entries/07-0$i-$YEAR.md
        echo "# 08-0$i-$YEAR" > august/entries/08-0$i-$YEAR.md
        echo "# 09-0$i-$YEAR" > september/entries/09-0$i-$YEAR.md
        echo "# 10-0$i-$YEAR" > october/entries/10-0$i-$YEAR.md
        echo "# 11-0$i-$YEAR" > november/entries/11-0$i-$YEAR.md
        echo "# 12-0$i-$YEAR" > december/entries/12-0$i-$YEAR.md
    done

    for i in $(seq 10 31);
    do
        echo "# 01-$i-$YEAR" > january/entries/01-$i-$YEAR.md
        echo "# 02-$i-$YEAR" > february/entries/02-$i-$YEAR.md
        echo "# 03-$i-$YEAR" > march/entries/03-$i-$YEAR.md
        echo "# 04-$i-$YEAR" > april/entries/04-$i-$YEAR.md
        echo "# 05-$i-$YEAR" > may/entries/05-$i-$YEAR.md
        echo "# 06-$i-$YEAR" > june/entries/06-$i-$YEAR.md
        echo "# 07-$i-$YEAR" > july/entries/07-$i-$YEAR.md
        echo "# 08-$i-$YEAR" > august/entries/08-$i-$YEAR.md
        echo "# 09-$i-$YEAR" > september/entries/09-$i-$YEAR.md
        echo "# 10-$i-$YEAR" > october/entries/10-$i-$YEAR.md
        echo "# 11-$i-$YEAR" > november/entries/11-$i-$YEAR.md
        echo "# 12-$i-$YEAR" > december/entries/12-$i-$YEAR.md
    done

elif [[ "$answer" == "n" ]]; then
    echo "You chose NO, stopping the program."
    exit 0

else
    echo "Invalid input. Please runt he script again and type the correct answer"
    exit 1
fi