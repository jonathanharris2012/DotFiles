Function Create-IfMissing ($path) {
    if (!(Test-Path $path)) {
        $newFolder = Split-Path -Path $path
        New-Item -ItemType 'Directory' -Path $newFolder
    }
    Copy-Item -Path .\Microsoft.PowerShell_profile.ps1 $path -Force
}

Create-IfMissing "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
Create-IfMissing "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

Copy-Item -Path .\.gitconfig $HOME\.gitconfig -Force
Copy-Item -Path .\.gitbashrc $HOME\.bashrc -Force

#For WSL Linux things
if (Test-Path \\wsl$\Ubuntu-18.04\home\jonathanharris){
    if (!(Test-Path $HOME\wslLinux)){
        New-Item -ItemType SymbolicLink -Path $HOME\wslLinux -Target \\wsl$\Ubuntu-18.04\home\jonathanharris
    }
    Copy-Item -Path .\.gitconfig $HOME\wslLinux\.gitconfig -Force
    Copy-Item -Path .\.bashrc $HOME\wslLinux\.bashrc -Force
}

