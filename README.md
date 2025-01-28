# Vite Project Creator for Full Stack Open

A script I made while doing the [Full Stack Open course](https://fullstackopen.com/) to quickly set up clean Vite+React projects + JSON servers for exercises.
Just run the script, type the 'part' number the exercise belongs to, give the project a name, choose if you want a JSON server… and that's all! 

**One-click setup for:**  
✅ Clean Vite+React projects  
✅ JSON server backend API
✅ And organized exercise structure, following the course's parts

## Setup

Place `create-vite-project.bat` in your course root folder, where your exercise parts are (or will be) located:

```plaintext
fullstack-course/ # Your root folder
├── part1/
├── part2/
└── create-vite-project.bat --> # Put it here!!
```

##  Creating a Project

1. Double-click `create-vite-project.bat`
2. Enter part number (e.g., `3` for part3)
3. Enter project name (e.g., `phonebook`)
4. Choose if you need JSON Server features (Y/N)

And the script will:
- Create part folder + README if missing
- Set up clean Vite+React project
- Remove template bloat (CSS/assets)
- Install dependencies automatically
- Add a JSON Server setup if requested:
   - Installing axios package
   - Creating an empty `db.json`
   - Adding a `run-json-server.bat` starter

## Starting Projects

- **Frontend**: Double-click `runweb.bat` in project folder  
  *(Kills existing dev servers and opens the new one in the browser)*

- **JSON Server** (if added):  
  Double-click `run-json-server.bat`  
  *(Starts API server on port 3001, watching a dummy db.json by default)*

## Requirements

- Windows
- Node.js + npm
- Basic understanding of JSON Server (if used)

## Why?

- ⚡ Skip repetitive setup
- 🧩 Consistent exercise structure
- 🚦 Self-contained project launchers
- 🌐 Fullstack-ready in 2 clicks

## Recent Changes

- [NEW] Optional JSON Server integration
- [NEW] Automatic axios installation
- [NEW] Dual server support (Vite + JSON Server)
- Improved error handling

## License

MIT - Do whatever you want with it!