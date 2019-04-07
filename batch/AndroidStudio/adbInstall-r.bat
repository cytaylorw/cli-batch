echo off
SET ADBHome=D:\Softwares\Android\SDK\platform-tools

cd %ADBHome%
adb install -r %1
pause