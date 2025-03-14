# Local Development Setup

[Utopia.app](https://utopia.app/), the incredible, way ahead of its time, web react IDE allows pushing your project code to GitHub. This MacOS guide explains how to clone and run this Utopia React app locally without affecting the Utopia online environment, i.e. for your local development IDE (e.g. Cursor) to then sync with design efforts on Utopia.

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

Create a .gitignore file to exclude any/every local files (example below) if using git.
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

## Future Considerations
- Creating a tighter loop with Utopia as sometimes syncing with Github is slow and error prone. E.g. modifying utopia to run locally with local files. If running locally, also could modify to incorporate LLMs.
- Testing different responsive design techniques in Utopia. Utopia's design tools only modify the main breakpoint, whether desktop or mobile first. To add responsive breakpoints:
    1. Modify globals.css to include media queries for max or min width, depending on whether you want desktop first or mobile first.
    2. Add !important to the media query styles to override the main breakpoint.
    3. Go back to the main file (e.g. app.js) and save again to preview the results (even though the file may already say "saved")
- Also i ntegrating Onlook or TempoLabs (similar to Uptopia) into the development-design process, where Onlook is already local and allows for quick navigation to local code by clicking on elements and allows for selecting sections of the app to run modification inferrence. 



# Example Git Ignore

/.DS_Store
node_modules

# Local development files
local-start.sh
local-install.sh
package.local.json
package.json.utopia

# Build outputs
/build
/dist

# Environment files
.env.local
.env.development.local
.env.test.local
.env.production.local

# Debug logs
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Editor directories and files
.idea
.vscode
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?