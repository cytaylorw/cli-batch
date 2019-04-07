SET IKEYCMD=C:\Progra~1\IBM\TDI\V7.1\jvm\jre\bin\ikeycmd.exe
SET TESTADMIN=C:\Progra~1\IBM\TDI\V7.1\timsol\serverapi\testadmin.jks



FOR %%i IN (*.cer) DO %IKEYCMD% -cert -add -db %TESTADMIN% -file %%i -pw administrator

NET STOP "ibmdisrv-ISIM Adapters"
NET START "ibmdisrv-ISIM Adapters"

pause