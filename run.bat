@ECHO OFF

echo %~p1zxspin\zxspin %~d1%~p1%~n1.tzx

tskill zxspin

call %~p1zxspin\zxspin %~d1%~p1%~n1.tzx

