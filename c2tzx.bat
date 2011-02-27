@ECHO OFF
echo %~n1

IF "%1"=="" GOTO BAD_PARAM

tskill spectaculator
call sdcc\bin\sdcc -mz80 --no-std-crt0 --code-loc 32768 --xram-loc 50000 test.c
call hex2bin\hex2bin %~n1.ihx
call C2TZX\bin\C2TZX.exe header\header.bin %~n1.bin %~n1.tzx
del %~n1.asm
del %~n1.bin
del %~n1.ihx
del %~n1.lnk
del %~n1.lst
del %~n1.map
del %~n1.noi
del %~n1.rel
del %~n1.sym
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
