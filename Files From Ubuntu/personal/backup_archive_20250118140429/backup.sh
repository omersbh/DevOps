#!/bin/bash

# Define variables
SOURCE_DIR = "$HOME/my_test_project" # Directory to backup
BACKUP_DIR = "$HOME/personal" # Backup destination
TIMESTAMP = $(date +%Y%m%d%H%M%S) # Generate timestamp
BACKUP_NAME = "backup_archive_${TIMESTAMP}" # Backup folder name
MAX_BACKUPS = 3 # Number of backups to keep

# Create a new backup
cp -r "$SOURCE_DIR" "${BACKUP_DIR}/${BACKUP_NAME}"

# Remove old backups if they exceed MAX_BACKUPS
BACKUP_COUNT = $(ls -dt ${BACKUP_DIR}/backup_archive_* | wx -l)
if [ "$BACKUP_COUNT" -gt "$MAX_BACKUPS" ]; then
    ls -dt ${BACKUP_DIR}/backup_archive_* | tail -n +$((MAX_BACKUPS + 1)) | xargs rm -rf
fi

# Print result
ls -ld ${BACKUP_DIR}/backup_archive_*