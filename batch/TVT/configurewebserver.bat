SET WAS_Home="C:\Progra~1\IBM\WebSphere\AppServer\"
SET HTTP_Home="C:\Progra~1\IBM\HTTPServer\"

copy %HTTP_HOME%\plugins\bin\configurewebserver1.bat %WAS_HOME%\bin
CMD /c %WAS_HOME%\bin\configurewebserver1.bat -profileName AppSrv01 -user wasadmin -password Esso82!

copy %HTTP_HOME%\plugins\bin\configurewebserver2.bat %WAS_HOME%\bin
CMD /c %WAS_HOME%\bin\configurewebserver2.bat -profileName AppSrv02 -user wasadmin -password Esso82!

pause