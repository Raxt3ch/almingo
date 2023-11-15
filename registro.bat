@echo off
chcp 65001 > nul

:: Restringir la instalación de actualizaciones automáticas de Windows mediante cambios en el Registro

:: Establecer el valor del Registro para desactivar las actualizaciones automáticas
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 1 /f

:: Deshabilitar el acceso al Panel de Control
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoControlPanel" /t REG_DWORD /d 1 /f

:: Deshabilitar el acceso a MSCONFIG
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableMsConfig" /t REG_DWORD /d 1 /f

:: Deshabilitar escritura de USB
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" /v "WriteProtect" /t REG_DWORD /d 1 /f

echo Restricciónes aplicadas. Reinicia el sistema para que los cambios surtan efecto.
pause