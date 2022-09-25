#######################################################
#Script para solucionar el problema:                  #
#El administrador TI ha limitado el acceso Windows 10 #
#Comando IT - www.comandoit.com		              #
#######################################################

echo off
cls
 
echo Ejecutando Script - El administrador TI ha limitado el acceso a Windows 10.

echo Restableciendo opciones de seguridad en directiva local
secedit /configure /cfg %windir%\inf\defltbase.inf /db defltbase.sdb /verbose

echo ELiminamos directorios 1/2
RD /S /Q "%WinDir%\System32\GroupPolicyUsers"

echo ELiminamos directorios 2/2
RD /S /Q "%WinDir%\System32\GroupPolicy"

echo Actualizamos politicas 
gpupdate /force

echo Añadiendo al registro 1/1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V EnableLUA /T REG_DWORD /D 0 /F

echo Eliminamos registros 1/3
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center" /F

echo Eliminamos registros 2/3
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Advanced Thread Protection" /F

echo ELiminamos registros 3/3
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /F

echo Si ha ocurrido un error, por favor escribeme en www.comandoit.com
