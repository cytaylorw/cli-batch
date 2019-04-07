echo off
FOR /F "skip=1 tokens=2,*" %%A IN ('REG.exe query "HKEY_LOCAL_MACHINE\SOFTWARE\Oracle\VirtualBox" /v "InstallDir"') DO set "VBoxHome=%%B"
echo.
echo The VirtualBox directory is %VBoxHome% 
echo.

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

"%VBoxHome%VBoxManage.exe" modifyvm "%VM%" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
"%VBoxHome%VBoxManage.exe" setextradata "%VM%" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
"%VBoxHome%VBoxManage.exe" setextradata "%VM%" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
"%VBoxHome%VBoxManage.exe" setextradata "%VM%" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
"%VBoxHome%VBoxManage.exe" setextradata "%VM%" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
"%VBoxHome%VBoxManage.exe" setextradata "%VM%" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1

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