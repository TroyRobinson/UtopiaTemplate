#!/bin/bash

# Create package.json.utopia backup if it doesn't exist
if [ ! -f package.json.utopia ]; then
    echo "Creating Utopia package.json backup..."
    cp package.json package.json.utopia
fi

# Function to restore package.json on script exit
cleanup() {
    echo "Restoring original package.json from Utopia backup..."
    cp package.json.utopia package.json
}

# Set up trap to call cleanup on script exit (including Ctrl+C)
trap cleanup EXIT

# Use local package.json for development
cp package.local.json package.json

# Run npm install
npm install