echo off
FOR /F "skip=1 tokens=2,*" %%A IN ('REG.exe query "HKEY_LOCAL_MACHINE\SOFTWARE\Oracle\VirtualBox" /v "InstallDir"') DO set "VBoxHome=%%B"
echo.
echo The VirtualBox directory is %VBoxHome% 
echo.
"%VBoxHome%VBoxManage.exe" internalcommands sethduuid %1
pause