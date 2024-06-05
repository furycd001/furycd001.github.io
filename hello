#!/bin/env bash

# Check if there are any changes (untracked, modified, deleted)
if git status --porcelain | grep -q "^[MADRCU?!]"; then
    echo "Changes found. Adding and pushing to GitHub..."
    
    # Add all changes (tracked and untracked files)
    git add .

    # Commit the changes
    git commit -m "Add new files and update existing ones"

    # Push changes to the remote repository
    git push origin main
    
    echo "Push successful!"
else
    echo "No changes found. Nothing to push."
fi