#!/bin/env bash

# Check if there are any untracked files
if git status --porcelain | grep -q "^??"; then
    echo "New files found. Adding and pushing to GitHub..."
    
    # Add all untracked files
    git add .

    # Commit the changes
    git commit -m "Add new files"

    # Push changes to the remote repository
    git push origin main
    
    echo "Push successful!"
else
    echo "No new files found. Nothing to push."
fi
