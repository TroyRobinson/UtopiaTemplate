#!/bin/bash

# Use local package.json for development
cp package.local.json package.json

# Run npm start in the background on port 3001
PORT=3005 npm start &

# Wait a moment for the server to start
sleep 2

# Restore original package.json from Utopia backup immediately
cp package.json.utopia package.json

# Wait for the background process to finish
wait