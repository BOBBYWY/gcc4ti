@ECHO OFF

SET INFOZIPDIR=E:\zip\zip
SET ZIPDIR=.
SET A68KSRCDIR=E:\TI-89\A68k\source
SET PSTARTERSRCDIR=E:\TI-89\pstarter
SET TTPACKSRCDIR=E:\TI-89\Compilers\tigcc\tt\src\pctools

MD a68k
COPY "%A68KSRCDIR%\*.*" a68k
MD pstarter
FOR %%i IN ("%PSTARTERSRCDIR%\LGPL.txt" "%PSTARTERSRCDIR%\pstarter.s" "%PSTARTERSRCDIR%\pstarter.tpr" "%PSTARTERSRCDIR%\pstarter.txt" "%PSTARTERSRCDIR%\pst-ttup.h") DO COPY "%%i" pstarter
MD pstarter\ttunpack
COPY "%PSTARTERSRCDIR%\ttunpack\*.*" pstarter\ttunpack
MD ttpack
FOR %%i IN ("%TTPACKSRCDIR%\..\..\readme.txt" "%TTPACKSRCDIR%\packhead.h" "%TTPACKSRCDIR%\revtools.h" "%TTPACKSRCDIR%\tt.h" "%TTPACKSRCDIR%\ttpack.c" "%TTPACKSRCDIR%\ttversion.h") DO COPY "%%i" ttpack

DEL "%ZIPDIR%\tigccsrc.zip"
"%INFOZIPDIR%\zip.exe" -9 -r "%ZIPDIR%\tigccsrc.zip" ..\Readme.txt ..\License.txt a68k ..\archive ..\components ..\doc ..\gcc ..\general ..\hsf2rc ..\ide ..\ld-tigcc pstarter ..\setup\*.nsi ..\setup\*.ini ..\setup\*.bat ..\setup\makeall.pif ..\tigcc ..\tprbuilder ttpack -x CVS

DELTREE /Y a68k
DELTREE /Y pstarter
DELTREE /Y ttpack

ECHO Finished.
