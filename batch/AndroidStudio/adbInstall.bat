echo off
SET ADBHome=D:\Softwares\Android\SDK\platform-tools

cd %ADBHome%
adb install %1
pause