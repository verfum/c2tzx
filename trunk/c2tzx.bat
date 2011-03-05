@ECHO OFF
rem echo %~n1
rem echo %~p1

rem GOTO FINISH

IF "%1"=="" GOTO BAD_PARAM

tskill zxspin
call %~p1\sdcc\bin\sdcc -mz80 --no-std-crt0 --code-loc 32768 --xram-loc 50000 %1

if not EXIST %~n1.ihx GOTO SDCC_ERROR

call %~p1\hex2bin\hex2bin %~n1.ihx
call %~p1\C2TZX\bin\C2TZX.exe %~p1\header\header.bin %~n1.bin %~n1.tzx
del %~n1.bin
del %~n1.ihx
del %~n1.lnk
del %~n1.lst
del %~n1.map
del %~n1.noi
del %~n1.rel
del %~n1.sym
GOTO FINISH

:SDCC_ERROR
echo SDCC Error
GOTO FINISH


:BAD_PARAM
echo *******************
echo *                 *
echo * Usage:          *
echo * c2tzx c_file    *
echo *                 *
echo * Example:        *
echo * c2tzx my_code.c *
echo *                 *
echo *******************

:FINISH
