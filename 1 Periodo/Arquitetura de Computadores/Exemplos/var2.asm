include emu8086.inc
org 100h


MAIN PROC
MOV AL, VAR1
MOV BX, VAR2
ADD AL,BL

RET 

VAR1 DB 10
VAR2 DW 12h

