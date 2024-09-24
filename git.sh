#!/bin/bash

# Check if a directory is provided as an argument
if [ -z "$1" ]; then
    echo "Please provide the directory of the Git repository."
    exit 1
fi

# Navigate to the specified directory
repo_path="$1"

if [ ! -d "$repo_path" ]; then
    echo "Directory $repo_path does not exist."
    exit 1
fi

cd "$repo_path" || exit

# Check if it's a valid git repository
if [ ! -d ".git" ]; then
    echo "The directory $repo_path is not a Git repository."
    exit 1
fi

# Commit deleted files
git status --porcelain | grep '^ D' | while read -r line; do
    file=$(echo $line | awk '{print $2}')
    git rm "$file"
    git commit -m "Deleted: $file"
done

# Commit modified files
git status --porcelain | grep '^ M' | while read -r line; do
    file=$(echo $line | awk '{print $2}')
    git add "$file"
    git commit -m "Modified: $file"
done

# Commit untracked files
git status --porcelain | grep '^??' | while read -r line; do
    file=$(echo $line | awk '{print $2}')
    git add "$file"
    git commit -m "Added new file: $file"
done

git push

echo "All changes committed in $repo_path"

