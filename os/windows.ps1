$OriginalPref = $ProgressPreference # Default is 'Continue'
$ProgressPreference = "SilentlyContinue"
cd $Home
powershell 'mkdir "$Home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"'
Clear-Host
Write-Output "Doing step 1/5, please wait..."
powershell "iwr -useb get.scoop.sh | iex"
scoop install git
Clear-Host
Write-Output "Doing step 2/5, please wait..."
git clone https://codeberg.org/brahma/os $Home\ionos
Push-Location $Home\ionos
Move-Item shell ..
Remove-Item .\* -Recurse
Move-Item ..\shell\* .
Remove-Item ..\shell -Recurse
Pop-Location
Clear-Host
Write-Output "Doing step 3/5, please wait..."
Invoke-WebRequest "https://download-chromium.appspot.com/dl/Win?type=snapshots" -OutFile chromium.zip
Invoke-WebRequest "https://www.nirsoft.net/utils/nircmd.zip" -OutFile nircmd.zip
Clear-Host
Write-Output "Doing step 4/5, please wait..."
Expand-Archive chromium.zip -DestinationPath $Home\ionos
Expand-Archive nircmd.zip -DestinationPath $Home\ionos
Clear-Host
Write-Output "Doing step 5/5, please wait..."
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\ionos.lnk")
$Shortcut.TargetPath = "$Home\ionos\chrome-win\chrome.exe"
$Shortcut.Arguments = "--kiosk $Home\ionos\index.html"
$Shortcut.Save()
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\taskbar.lnk")
$Shortcut.TargetPath = "$Home\ionos\nircmd.exe"
$Shortcut.Arguments = "win hide class Shell_TrayWnd"
$Shortcut.Save()
Remove-Item chromium.zip
Remove-Item nircmd.zip
Write-Output @'
MsgBox "Complete! All you need to do is to sign out and sign back in. Press Start, your user icon, then sign out. Then enter your credentials (if any), then sign in."
'@ > tmp.vbs
wscript tmp.vbs
Start-Sleep -s 1
Remove-Item tmp.vbs
$ProgressPreference = $OriginalPref
cmd /c pause