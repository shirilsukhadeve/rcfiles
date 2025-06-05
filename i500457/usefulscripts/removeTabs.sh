#!/bin/bash

expand_tabs() {
    expand -i -t 4 "$1" | sponge "$1"
    echo "Expanded and modified $1"
}

# Function to process folder
process_folder() {
    local folder="$1"
    # List all files in the folder
    local fileList=$(ls "$folder")
    # Loop through each file
    for file in $fileList
    do
        # Check if it's a file
        if [ -f "$folder/$file" ]; then
            expand_tabs "$folder/$file"
        fi
    done
}


# Accept folder or file path as input
read -p "Enter the path of the folder or file: " inputPath

# Convert the input path to an absolute path
inputPath=$(realpath "$inputPath")

# Check if it's a file
if [ -f "$inputPath" ]; then
    expand_tabs "$inputPath"
elif [ -d "$inputPath" ]; then
    process_folder "$inputPath"
else
    echo "Invalid path. Please enter a valid file or folder path."
    exit 1
fi
