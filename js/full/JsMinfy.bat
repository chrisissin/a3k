    @REM ���ɬO�� RunJSMin.bat �I�s�Ϊ�
    @REM �Ĥ@�ӰѼƬO�n���Y�� JavaScript �Ҧb�ؿ�
    @REM �ĤG�ӰѼƬO�n���Y�� JavaScript �ɦW

set DirName=%1

set FileName=%2 

jsmin.exe < %DirName%\%FileName% > %DirName%\compressed.%FileName% "(c)2009 worxup"
del /F %DirName%\%FileName%
ren %DirName%\compressed.%FileName% %FileName% 