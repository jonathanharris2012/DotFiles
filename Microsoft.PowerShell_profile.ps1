# To create a Junction Point for the Powershell Profile dir:
# mklink /J "C:\Users\Jonathan\src" "C:\Users\Jonathan\Documents\WindowsPowerShell"


Function Prompt
{
    "" + (Get-Location) + "`n>"
}

Function sudo
{
    if ($args.Count -gt 0)
    {   
       $argList = "& '" + $args + "'"
       Start-Process "$psHome\powershell.exe" -Verb runAs -ArgumentList $argList
    }
    else
    {
       Start-Process "$psHome\powershell.exe" -Verb runAs
    }
}

Function quit {
	Invoke-Expression "exit"
}

Function cds {Set-Location -Path ~\src}
Function cde {Set-Location -Path ~\Exercism}

Function path {($env:Path).Replace(';',"`n")}

Function pupdev {ssh -i ~/.ssh/PuppetNonOpsWorks.pem ec2-user@ec2-13-59-101-124.us-east-2.compute.amazonaws.com}
Function pupprod {ssh -i ~/.ssh/Puppet-Foreman_Production.pem ec2-user@ec2-18-220-79-35.us-east-2.compute.amazonaws.com}

Function Purge-File ($sourceFile, $string) {
    Get-Content $sourceFile | Where-Object {$_ -notmatch "$string"} | Set-Content out.txt
    Copy-Item out.txt $sourceFile
    Remove-Item -Path out.txt
}

Function Update-Apps {
    Set-Location ~\src\bootstrap-windows
    puppet apply .\installs.pp
    Pause
}

# $Shell = $Host.UI.RawUI
New-Item alias:np -value "C:\Program Files\Notepad++\notepad++.exe" | Out-Null
New-Item alias:google -value "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" | Out-Null
New-Item alias:tf -value "C:\ProgramData\chocolatey\bin\terraform.exe" | Out-Null
Set-Alias q quit


# Clear-Host


# Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
