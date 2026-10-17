# NeuroScope3D GitHub upload helper (Windows PowerShell)
# Extract NeuroScope3D_GitHub_Upload_Package.zip, then run this script from the extracted folder.
$ErrorActionPreference = "Stop"

$repoUrl = "https://github.com/PrajyotXDev/NeuroScope3D.git"
$projectRoot = (Get-Location).Path

if (-not (Test-Path (Join-Path $projectRoot "frontend/package.json"))) {
    throw "Run this script from the extracted NeuroScope3D project root."
}

git --version | Out-Null
if ($LASTEXITCODE -ne 0) { throw "Git is not installed. Install Git for Windows first." }

if (Test-Path (Join-Path $projectRoot ".git")) {
    Write-Host "This folder already has .git metadata; no nested clone will be created."
    git remote -v
    $origin = git remote get-url origin 2>$null
    if ($origin -and ($origin -ne $repoUrl)) {
        throw "Existing origin is '$origin', not '$repoUrl'. Review it before proceeding."
    }
    if (-not $origin) { git remote add origin $repoUrl }
} else {
    git init -b main
    git remote add origin $repoUrl
}

git add -A
git status --short
git commit -m "Add complete NeuroScope3D project"
if ($LASTEXITCODE -ne 0) {
    Write-Host "Commit did not create a new commit (there may be nothing to commit)."
    git status --short
    exit 1
}
git push -u origin main
if ($LASTEXITCODE -ne 0) {
    throw "Push failed. Check GitHub authentication and branch status; do not force-push."
}
Write-Host "Upload complete: $repoUrl"
