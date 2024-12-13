#!/bin/bash

# Set source and destination directories
source_dir="/path/to/source"
backup_dir="/path/to/backup"

# Create timestamp for backup folder
timestamp=$(date +"%Y%m%d_%H%M%S")
backup_folder="$backup_dir/backup_$timestamp"

# Create backup folder
mkdir -p "$backup_folder"

# Copy files from source to backup folder
rsync -av "$source_dir/" "$backup_folder/"

# Remove backups older than 30 days
find "$backup_dir" -type d -mtime +30 -exec rm -rf {} +

echo "Backup completed: $backup_folder"
