@ECHO ON

SET SourceDir=%~dp0xml
SET DestDir=%~dp0

CD /D %~dp0

FOR /F "TOKENS=*" %%F IN ('DIR /B /A-D "%SourceDir%"') DO (
    7z.exe a "%DestDir%\%%~NF.zip" "%SourceDir%\%%~NXF"
)

DEL mkzip.zip

PAUSE
