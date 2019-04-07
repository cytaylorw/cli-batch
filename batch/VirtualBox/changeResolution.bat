echo off

SET R[1]=1280x720
SET R[2]=1920x1080
SET R[3]=2048x1080
SET R[4]=2560x1440
SET R[5]=3840x2160
SET R[6]=1280x800
SET R[7]=1280x1024
SET R[8]=1440x900
SET R[9]=1600x900
SET R[10]=Delete key

FOR /F "skip=1 tokens=2,*" %%A IN ('REG.exe query "HKEY_LOCAL_MACHINE\SOFTWARE\Oracle\VirtualBox" /v "InstallDir"') DO set "VBoxHome=%%B"
echo.
echo The VirtualBox directory is %VBoxHome% 
echo.

:Menu
echo.
set "x=0"
:MenuLoop
set /a "x+=1"
if defined R[%x%] (
    call echo   %x%.	%%R[%x%]%%
    goto MenuLoop
)
echo.

:Prompt
set /a "x-=1"
set "Input="
set /p Input="Select the resolution(1~%x%): "

if not defined R[%Input%] (
	echo Invalid input: %Input%
	goto Menu
) else (
	set "Res="
	if not %x% == %Input% call set "Res=%%R[%Input%]%%"
)

set "Enter=Enter"
set "VM="
:Name
echo.
if [%1] == [] (
	set /p VM="%Enter% the virtual machine name: "
	echo.
) else (
	set VM=%~n1
)

if [%Res%] == [] (
	echo Removing display resolution key for: %VM%
) else (
	echo Updating the display resolution to %Res% for: %VM%
)
echo.

"%VBoxHome%VBoxManage.exe" setextradata "%VM%" VBoxInternal2/EfiGraphicsResolution %Res%

if errorlevel 1 (
	if [%1] == [] (
		set "Enter=Re-enter"
		goto Name
	) else (
		echo.
		echo Exiting with error.
	)
) else (
	echo Succeed.
	echo.
)
pause