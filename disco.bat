@echo off
chcp 65001 > nul

set directorio_verificar=%UserProfile%\Documents
set directorio_destino=%UserProfile%\Documents
set archivo_informe=InformeEspacioDisco.txt
set fecha_hora=%date:~10,4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%

echo Generando informe de espacio en disco en %directorio_verificar%...

:: Utiliza el comando dir para obtener información sobre el espacio en disco
dir %directorio_verificar% /s /a /-c > %directorio_destino%\%archivo_informe%

if errorlevel 1 (
    echo Error al generar el informe. Verifica las rutas y permisos.
    exit /b 1
) else (
    echo Informe generado exitosamente en %directorio_destino%\%archivo_informe%.
)

echo Tarea completada.
pause