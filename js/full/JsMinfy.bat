    @REM 此檔是給 RunJSMin.bat 呼叫用的
    @REM 第一個參數是要壓縮的 JavaScript 所在目錄
    @REM 第二個參數是要壓縮的 JavaScript 檔名

set DirName=%1

set FileName=%2 

jsmin.exe < %DirName%\%FileName% > %DirName%\compressed.%FileName% "(c)2009 worxup"
del /F %DirName%\%FileName%
ren %DirName%\compressed.%FileName% %FileName% 