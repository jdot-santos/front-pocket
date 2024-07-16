# Update to use your username
username=testuser


############################
# Append To Journal Configuration
############################

# Path to your Markdown journals, for example /Users/$username/journal-entries/2024/june
append_to_full_dir="/Users/$username/journal-entries/2024/june"

# Define journal content that will be inserted into each journal entry
journal_content="
## TODOs
- [ ] do morning journal
- [ ] do nightly journal

## morning journal
I am grateful for:
1. something
2. something else
3. something awesome

What would make today great?
1. doing
2. going
3. bettering

Say your affirmations

## night journal
3 amazing things that happened today:
1. thing-1
2. thing2
3. thing_3

I took care of myself by:
- thing_1

My challenges taught me:
- thing1

I’m proud of myself for:
- thing-one

How could I have made today better?
"


############################
# Flashcards Configuration
############################

# Root directory to where you want search for flashcards, for example /Users/$username/flashcards
flashcards_root_dir=" /Users/$username/flashcards"


############################
# Create Journal Entries Configuration
############################

YEAR=2025
# Root directory to where you want create your yearly journal entries, for example /Users/$username/journal-entries/$YEAR
# NOTE: The folder must exist or be created prior to running the script
journal_entries_root_dir="/Users/$username/journal-entries/$YEAR"


##############
# Clear Files in Folder
##############
clear_files_directory="/Users/$username/Library/Mobile Documents/iCloud~md~obsidian/Documents/docs/temp/entries"