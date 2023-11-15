@echo off
chcp 65001 > nul

REM Ruta de la carpeta de documentos
set "carpeta_documentos=%UserProfile%\Documents"

REM Ruta de WinRAR (Ajusta la ruta según tu instalación)
set "winrar=%UserProfile%\Documents\almingo\Keys\WinRAR\WinRAR.exe"

REM Ruta de destino para el archivo comprimido
set "archivo_destino=%UserProfile%\Documents\Backup"

cd /d "%carpeta_documentos%"

REM Comprimir archivos en la carpeta de documentos
"%winrar%" a -r -ep1 -afzip "%archivo_destino%" *

echo Archivos comprimidos exitosamente.
pause
endlocal