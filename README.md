# Vite Project Creator for Full Stack Open

A simple script to automatically set up clean Vite+React projects and JSON servers for [Full Stack Open course](https://fullstackopen.com/) exercises.  
It also places executable `.bat` files inside them to instantly run the project and/or the server.

## Setup 

Place `create-project.bat` in your course root folder, where your exercise parts are (or will be) located:
```
fullstack-course/  # Your root folder
├── part1/
├── part2/
└── create-project.bat  <-- Put it here!
```
## Creating a Project 

1. Double-click `create-project.bat`
2. Enter the part number (e.g., `3` for part3)
3. Enter the project name (e.g., `phonebook`)
4. Choose if you need **JSON Server** features (Y/N)
5. Choose if you want to remove the default `.css` files (Y/N)

**After you confirm, the script will:**
- Create the part folder + README if missing
- Set up a clean Vite+React project
- Remove default template assets (always)
- Optionally remove default `.css` files
- Install dependencies automatically
- (Optional) Add a JSON Server setup:
  - Install the `axios` package
  - Create an empty `db.json`
  - Add a `run-json-server.bat` script
 
## Example Project Structure

If you created a project called `phonebook` in `part3`, you will end up with a structure like this:
```
fullstack-course/
├── part2/
├── part3/
│   └── README.md
│   └── phonebook/
│       ├── (...)
│       ├── db.json        (only if JSON Server was requested)
│       ├── run-json-server.bat  (only if JSON Server was requested)
│       └── runweb.bat
│
└── create-project.bat
```
## Running Projects

- **Frontend**  
  Double-click `runweb.bat` in the project folder  
  (Kills existing Vite dev servers on ports 5173 / 5174, then opens the new one in the browser)

- **JSON Server**  
  If JSON Server features were enabled, double-click `run-json-server.bat`  
  (Starts a mock API server on port 3001, watching `db.json`)

## Requirements

- Windows (due to `.bat` scripts)
- Node.js + npm installed and available in your PATH
- Basic understanding of JSON Server (if you choose to enable it)
---
## Common Issues

- **Node not recognized**: Make sure Node.js and npm are installed and properly configured in your system’s PATH.
- **Ports in use**: The script attempts to kill existing processes on ports 5173 and 5174 (used by default by Vite). If you still have conflicts, close any existing Node processes manually or reboot.
---
## License

MIT - Do whatever you want with it!
