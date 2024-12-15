#!/bin/bash

# S3 Bucket Operations Script

BUCKET_NAME="techtideunixwork"

# Function to list objects in the bucket
list_objects() {
    echo "Listing objects in $BUCKET_NAME:"
    aws s3 ls s3://$BUCKET_NAME
}

# Function to upload a file to the bucket
upload_file() {
    local file_path=$1
    local file_name=$(basename $file_path)
    echo "Uploading $file_name to $BUCKET_NAME..."
    aws s3 cp $file_path s3://$BUCKET_NAME/$file_name
}

# Function to download a file from the bucket
download_file() {
    local file_name=$1
    local destination=$2
    echo "Downloading $file_name from $BUCKET_NAME..."
    aws s3 cp s3://$BUCKET_NAME/$file_name $destination
}

# Function to delete a file from the bucket
delete_file() {
    local file_name=$1
    echo "Deleting $file_name from $BUCKET_NAME..."
    aws s3 rm s3://$BUCKET_NAME/$file_name
}

# Main menu
while true; do
    echo "
S3 Bucket Operations:
1. List objects
2. Upload file
3. Download file
4. Delete file
5. Exit
"
    read -p "Enter your choice: " choice

    case $choice in
        1) list_objects ;;
        2) read -p "Enter file path to upload: " file_path
           upload_file $file_path ;;
        3) read -p "Enter file name to download: " file_name
           read -p "Enter destination path: " destination
           download_file $file_name $destination ;;
        4) read -p "Enter file name to delete: " file_name
           delete_file $file_name ;;
        5) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done
