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

REM Rutas y nombres de archivos
set PPKFilePath="%UserProfile%\Documents\almingo\Keys\vockey.ppk"
set SourceDirectory="%UserProfile%\Documents\Backup.zip"
set RemoteUsername="ubuntu"
set RemoteHostName="ec2-54-234-238-194.compute-1.amazonaws.com"
set RemoteDirectory="/home/ubuntu/backups"
set PSCPPath="%UserProfile%\Documents\almingo\Keys\pscp.exe"

REM Comando PuTTY SCP para la transferencia
echo Iniciando la copia de seguridad...
"%PSCPPath%" -i "%PPKFilePath%" -r "%SourceDirectory%" "%RemoteUsername%@%RemoteHostName%:%RemoteDirectory%"

REM Verificar el estado de la copia de seguridad
if %errorlevel% equ 0 (
  echo Copia de seguridad completada con éxito.
) else (
  echo Error al realizar la copia de seguridad.
)
pause
endlocal