include emu8086.inc
ORG 100h

.data
CENTENA DW 000
SOMA DW 000
resto dw 000
SAIDA DB 000
RESTIN DB 000
comparadorUm DB ?
comparadorDois DB ?
comparadorTres DB ?
comparadorQuatro DB ?

numUm DW ?
numDois DW ?

.code
INI:
PRINT ' Escolha uma opcao:'
PUTC 10
PUTC 13
PRINT '+ - Somar'
PUTC 10
PUTC 13
PRINT '- - Subtrair'
PUTC 10
PUTC 13
PRINT '/ - Dividir'
PUTC 10
PUTC 13
PRINT '* - Multiplicar'

MOV AH, 1 
PUTC 10
PUTC 13
INT 21h
MOV BL, AL

MOV comparadorUm, BL
MOV comparadorDois, BL
MOV comparadorTres, BL
MOV comparadorQuatro, BL

PUTC 10
PUTC 13 

CMP comparadorUm, 43 
JE Somar

CMP comparadorDois, 45 
JE Subtrair

CMP comparadorTres, 47 
JE Dividir

CMP comparadorQuatro, 42 
JE Multiplicar

PRINT 'Operacao Invalida'

RET

Somar:

PRINT 'Somar - Digite dois numeros (0-999)'
PUTC 10
PUTC 13
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV BL,AL
MOV AX,0
MOV AX,100
MUL BL
MOV CENTENA,AX
;CENTENA
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV BL,AL
MOV AX,0
MOV AX,10
MUL BL
ADD CENTENA,AX
;DEZENA
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV AH,0
ADD CENTENA,AX
MOV AX,CENTENA
;UNIDADE 
;;
;;PRIMEIRA PARTE
;;
ADD SOMA,AX
MOV CENTENA,000
;;SEGUNDA PARTE
PUTC 10
PUTC 13
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV BL,AL
MOV AX,0
MOV AX,100
MUL BL
MOV CENTENA,AX
;CENTENA
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV BL,AL
MOV AX,0
MOV AX,10
MUL BL
ADD CENTENA,AX
;DEZENA
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV AH,0
ADD CENTENA,AX
MOV AX,CENTENA

ADD SOMA,AX
PUTC 10
PUTC 13



MOV AX, numUm
ADD AX, numDois
JMP IMPRESSAO 

RET


Subtrair: 

PRINT 'Subtrair - Digite dois numeros (0-999)'
PUTC 10
PUTC 13
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV BL,AL
MOV AX,0
MOV AX,100
MUL BL
MOV CENTENA,AX

;CENTENA
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV BL,AL
MOV AX,0
MOV AX,10
MUL BL
ADD CENTENA,AX

;DEZENA
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV AH,0
ADD CENTENA,AX
MOV AX,CENTENA
MOV NUMUM,AX

;UNIDADE
 
; ------ PRIMEIRA PARTE
ADD SOMA,AX
MOV CENTENA,000 

; ------ SEGUNDA PARTE
PUTC 10
PUTC 13
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV BL,AL
MOV AX,0
MOV AX,100
MUL BL
MOV CENTENA,AX

;CENTENA
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV BL,AL
MOV AX,0
MOV AX,10
MUL BL
ADD CENTENA,AX

;DEZENA
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV AH,0
ADD CENTENA,AX
MOV AX,CENTENA
MOV NUMDOIS,AX

PUTC 10
PUTC 13

MOV AX, numUm
CMP AX,NUMDOIS
JB TRATSUB
SUB AX, numDois
MOV SOMA,AX
CONTINUA:
JMP IMPRESSAO
 
;Impressao do resultado

INT 21H

RET 

Multiplicar:

PRINT 'Multiplicar - Digite dois numeros (0-999)'

PUTC 10
PUTC 13
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV BL,AL
MOV AX,0
MOV AX,100
MUL BL
MOV CENTENA,AX

;CENTENA
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV BL,AL
MOV AX,0
MOV AX,10
MUL BL
ADD CENTENA,AX

;DEZENA
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV AH,0

ADD CENTENA,AX
MOV AX,CENTENA

;UNIDADE
 
; ------ PRIMEIRA PARTE 

ADD SOMA,AX
MOV AX, SOMA
MOV numUm, AX
mov SOMA,0


MOV CENTENA,000 

; ------ SEGUNDA PARTE

PUTC 10
PUTC 13
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV BL,AL
MOV AX,0
MOV AX,100
MUL BL
MOV CENTENA,AX

;CENTENA
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV BL,AL
MOV AX,0
MOV AX,10
MUL BL
ADD CENTENA,AX

;DEZENA
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV AH,0
ADD CENTENA,AX
MOV AX,CENTENA

ADD SOMA,AX
MOV AX, SOMA
MOV numDois, AX

PUTC 10
PUTC 13

MOV AX, numUm
MUL numDois
MOV SOMA,AX

 
;Impressao do resultado

CMP SOMA,999
JG FALHA

JMP IMPRESSAO
 
ADD DX,AX
MOV AH,2
INT 21H

RET 

Dividir:
PRINT 'Dividir - Digite dois numeros (0-999)'
PUTC 10
PUTC 13
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV BL,AL
MOV AX,0
MOV AX,100
MUL BL
MOV CENTENA,AX

;CENTENA
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV BL,AL
MOV AX,0
MOV AX,10
MUL BL
ADD CENTENA,AX

;DEZENA
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV AH,0
ADD CENTENA,AX
MOV AX,CENTENA
MOV NUMUM,AX

;UNIDADE

; ------ PRIMEIRA PARTE
ADD SOMA,AX
MOV CENTENA,000

; ------ SEGUNDA PARTE
PUTC 10
PUTC 13
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV BL,AL
MOV AX,0
MOV AX,100
MUL BL
MOV CENTENA,AX

;CENTENA
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV BL,AL
MOV AX,0
MOV AX,10
MUL BL
ADD CENTENA,AX

;DEZENA
MOV AH,0
MOV AH,1
INT 21H
SUB AL,48
MOV AH,0
ADD CENTENA,AX
MOV AX,CENTENA
MOV NUMDOIS,AX

PUTC 10
PUTC 13
MOV AX, numUm
JMP IMPRESSAODIV


IMPRESSAO:

PUTC 10
PUTC 13
PRINT 'Resultado:'
PUTC 10
PUTC 13    

CMP SOMA,999
JG FALHA
 
MOV AX,SOMA
    
    MOV CX,100      
	DIV CX
	MOV RESTO,DX
	MOV DL,AL
	ADD DX,48
	
	MOV AH,2
	INT 21H
	
	MOV AX,0
	MOV AX,RESTO
	MOV DL,AL
	MOV CX,0
	MOV CH,10
	DIV CH
	MOV SAIDA,AH
	MOV DL,AL
	ADD DL,48
	MOV AH,0
	MOV AH,2
	
	
	INT 21H
	 
	
	MOV DL,SAIDA
	ADD DL,48
	MOV AH,2		
	INT 21H
 

RET

FALHA:
PRINT 'OVERFLOW'
RET



TRATSUB:
PRINT '-'
SUB NUMDOIS,AX
MOV AX,NUMDOIS
MOV SOMA,AX
JMP CONTINUA

IMPRESSAODIV:

PUTC 10
PUTC 13
PRINT 'Resultado:'
PUTC 10
PUTC 13

MOV CX,0
MOV CX,NUMDOIS
CMP CX,0
JE INVALIDO
DIV CX
MOV SOMA,AX
CMP AX,10
JB IMPRESSAOF

CMP AX,99
JB DOISDIG

CMP AX,256
JB TRESBUG
    
    MOV AX,SOMA
    
    MOV CX,100      
	DIV CL
	MOV RESTO,DX
	MOV DL,AL
	ADD DX,48
	
	MOV AH,2
	INT 21H
	
	MOV AX,0
	MOV AX,RESTO
	MOV DL,AL
	MOV CX,0
	MOV CH,10
	DIV CH
	MOV SAIDA,AH
	MOV DL,AL
	ADD DL,48
	MOV AH,0
	MOV AH,2
	
	
	INT 21H
	 
	
	MOV DL,SAIDA
	ADD DL,48
	MOV AH,2		
	INT 21H
 

RET

IMPRESSAOF:
MOV DL,AL
ADD DL,48
MOV AH,2
INT 21H
 

RET

INVALIDO:
PUTC 10
PUTC 13
PRINT 'OPERACAO INVALIDA, POR FAVOR TENTE NOVAMENTE'
PUTC 10
PUTC 13
JMP INI


DOISDIG:
MOV AX,SOMA
    
    MOV CL,10      
	DIV CL
	MOV RESTO,DX
	MOV BL,AH
	MOV DL,AL
	ADD DX,48
	
	MOV AH,2
	INT 21H
	
	
	MOV AL,BL
	;MOV AX,RESTO
	MOV DL,AL
	;MOV CX,0
	;MOV CH,10
	;DIV CH
	;MOV SAIDA,AH
	;MOV DL,AL
	ADD DL,48
	MOV AH,0
	MOV AH,2
	
	
	INT 21H
	 
	
	RET
	
	
	
TRESBUG:
MOV AX,SOMA

    MOV RESTIN,AH
    MOV CX,100      
	DIV CL
	MOV RESTIN,AH
	MOV DL,AL
	ADD DL,48
	
	MOV AH,2
	INT 21H
	
	MOV AX,0
	MOV AL,RESTIN
	MOV DL,AL
	MOV CX,0
	MOV CH,10
	DIV CH
	MOV SAIDA,AH
	MOV DL,AL
	ADD DL,48
	MOV AH,0
	MOV AH,2
	
	
	INT 21H
	 
	
	MOV DL,SAIDA
	ADD DL,48
	MOV AH,2		
	INT 21H
	
	RET
	

 