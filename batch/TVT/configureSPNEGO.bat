SET IMS_HOME="C:\Progra~2\ibm\ISAM ESSO\IMS Server\"

echo off
SET /p wasadmin="Input WAS Username:"
SET /p wasadminPassword="Input WAS Password:"
SET /p domain="Input your domain name (esso.ibm.tw for example):"
SET /p adHostName="Input your AD Server host name (lsc292 for example):"
SET /p imsHostName="Input your IMS Sever host name (lsc748 for example):"
echo on
cd %IMS_HOME%bin\
call configureSpnego.bat %wasadmin% %wasadminPassword% --domainName %domain% --kdcHost %adHostName%.%domain% --keytabPath "C:\%imsHostName%.%domain%.keytab" --imsLocation %imsHostName%.%domain%

pause