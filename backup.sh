#!/bin/bash

# This script backs up a specified directory to a specified backup location

# Function to display usage information
usage() {
    echo "Usage: $0 [source_directory] [backup_directory]"
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    usage
fi

SOURCE_DIR=$1
BACKUP_DIR=$2

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory does not exist."
    exit 1
fi

# Create the backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

# Perform the backup using rsync
rsync -av --delete "$SOURCE_DIR" "$BACKUP_DIR"

# Print completion message
echo "Backup of $SOURCE_DIR completed successfully to $BACKUP_DIR"

exit 0
