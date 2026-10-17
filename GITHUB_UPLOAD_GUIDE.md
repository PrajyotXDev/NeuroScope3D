# Upload to GitHub (Windows)

1. Extract this ZIP to a normal folder.
2. Open PowerShell in that extracted folder.
3. Run `powershell -ExecutionPolicy Bypass -File .\upload_to_GitHub.ps1`.
4. Complete GitHub authentication if prompted.

The script commits the extracted project to `main` and pushes to `https://github.com/PrajyotXDev/NeuroScope3D`. It will not force-push and stops if an existing origin points to a different repository.

Large root model checkpoints and generated MRI outputs excluded by the project's `.gitignore` are not included. See `MODEL_FILES_NOTE.md`.
