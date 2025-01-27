# Vite Project Creator for Full Stack Open

A batch script I made while doing the [Full Stack Open course](https://fullstackopen.com/) to quickly set up clean Vite+React projects and exercises.
Just run the script, type the 'part' the exercise belongs to, give the project a name… and that's it! 

The script will take care of creating it at the right folder, installing it and (optionally!), running it for you.

## Setup

Place `create-vite-project.bat` in your course root folder, where your exercise parts are (or will be) located:

```plaintext
fullstack-course/ # Your root folder
├── part1/
├── part2/
└── create-vite-project.bat --> # Put it here!!
```

## Creating a Project

1. Double click `create-vite-project.bat`
2. Enter part number (e.g., `3` for part3)
   - Creates the part folder if it doesn't exist
   - Adds a basic README for the part if it doesn't exist
3. Enter project name (e.g., `phonebook` or `notes`)
4. Wait for setup to complete
5. Choose whether to run the project or not.

The script will:
- Create the 'part' folder if it doesn't exist yet.
- Create a README.md file for the part if it doesn't exist yet.
- Create a clean Vite+React project
- Remove template bloat (default CSS, assets, etc.)
- Set up minimal App.jsx and main.jsx
- Create a quick-start script for each project (runweb.bat)
- Automatically install required dependencies
- Give you the option to run the project after install.

## Starting Your Project

Each project gets a `runweb.bat` that:
- Kills any existing processes at the default npm port
- Starts the development server
- Opens your browser automatically

## Requirements

- Windows
- Node.js and npm installed
- Being tired of typing `npm create vite@latest` and `npm run dev`

## Why?

Coming from C#, I wanted a faster way to set up clean projects for exercises. This eliminates repetitive setup and keeps everything organized following the course structure.

## License

MIT - Use it, share it, modify it, blame it… don't care!