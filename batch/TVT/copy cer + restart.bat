echo off
FOR /F "skip=1 tokens=2,*" %%A IN ('REG.exe query "HKEY_LOCAL_MACHINE\SOFTWARE\IBM\ISAM ESSO" /v "ProgramDir"') DO set "AA_HOME=%%B"
echo The AccessAgent Home directory is %AA_HOME% 
echo.
copy *.cer "%AA_HOME%SessionRecorder"
echo.
echo Close the command prompt if you do not want to restart the computer or Press any key to restart
pause

shutdown /r /t 0