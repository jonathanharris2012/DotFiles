Copy-Item -Path .\Microsoft.PowerShell_profile.ps1 $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -Force
Copy-Item -Path .\.gitconfig $HOME\.gitconfig -Force

#For WSL Linux things
if (Test-Path \\wsl$\Ubuntu-18.04\home\jonathanharris){
    if (!(Test-Path $HOME\wslLinux)){
        New-Item -ItemType SymbolicLink -Path $HOME\wslLinux -Target \\wsl$\Ubuntu-18.04\home\jonathanharris
    }
    Copy-Item -Path .\.gitconfig $HOME\wslLinux\.gitconfig -Force
    Copy-Item -Path .\.bashrc $HOME\wslLinux\.bashrc -Force
}
