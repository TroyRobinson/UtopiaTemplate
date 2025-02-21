# Local Development Setup

Utopia.app web react IDE allows pushing to GitHub. This MacOS guide explains how to clone and run this Utopia React app locally without affecting the Utopia online environment, for local development IDE (e.g. Cursor) to then sync with design efforts on Utopia.

## Quick Start

First, create a .gitignore file with the following lines:
node_modules
package-lock.json
.DS_Store
package.local.json
craco.config.js
local-install.sh
local-start.sh
package.json.utopia
README.md

Then use the following commands to set up the project locally and run:

```bash
# One-time setup
sh local-install.sh

# Start development server
sh local-start.sh
```

## How it Works

This project is designed to work both in Utopia's online environment and locally. The setup process:

1. Uses `package.local.json` to install development dependencies without modifying Utopia's configuration 
    TODO-MAYBE: you may need to check the package.local.json file to ensure the correct dependencies and versions are getting installed per your application's needs.
2. Uses `local-start.sh` to temporarily swap configurations when running the development server.
    TODO-MAYBE:ensure the port in the start script is open or select a different port (currently :3005)
3. The original `package.json` stays clean for Utopia compatibility
4. If everything went correctly, you should see a red line around the Utopia logo in the development server.

## Files for Local Development Only

These files are used for local development and are not committed to git:
- `package.local.json` - Local npm configuration
- `craco.config.js` - Webpack configuration overrides
- `local-install.sh` - One-time installation script
- `local-start.sh` - Script to run the development server
- This README file

## Notes

- Only run `sh local-install.sh` once to set up local development
- Use `./local-start.sh` to run the development server
- The app will run on http://localhost:3005 or available port when started
- The trailing comma was removed from the jsconfig.json file, which causes problems locally but doesn't effect the Utopia app either way.

## Troubleshooting

If you encounter issues:
1. Make sure you have Node.js installed
2. Try removing `node_modules` and running `sh local-install.sh` again
3. Ensure all local development files are present
4. If `local-start.sh` isn't executable, run `chmod +x local-start.sh`
