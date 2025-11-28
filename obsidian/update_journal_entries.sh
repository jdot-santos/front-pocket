#!/bin/bash
#
# This script runs two other scripts in sequence: prefix_to_journals.sh and append_to_journals.sh.
# These scripts handle adding a prefix and appending content to journal files.
# The script ensures both are executed successfully and provides error handling.

# Get the directory of the current script
script_dir="$(dirname "$0")"

# Call the prefix_to_journals.sh script
echo "Running prefix_to_journals.sh..."
"$script_dir/prefix_to_journals.sh"

# Check if the prefix_to_journals.sh script executed successfully
if [ $? -ne 0 ]; then
    echo "Error: prefix_to_journals.sh failed to execute."
    exit 1
fi

# Call the append_to_journals.sh script
echo "Running append_to_journals.sh..."
"$script_dir/append_to_journals.sh"

# Check if the append_to_journals.sh script executed successfully
if [ $? -ne 0 ]; then
    echo "Error: append_to_journals.sh failed to execute."
    exit 1
fi

echo "Both scripts ran successfully."