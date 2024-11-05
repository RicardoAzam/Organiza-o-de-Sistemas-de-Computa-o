TITLE PROJETO FINAL
.MODEL SMALL
.STACK 100H
PULA MACRO ;MACRO PARA PULAR LINHA
    PUSH AX ;PARA EVITAR PERDA DE VALORES EM AX
    PUSH DX ;PARA EVITAR PERDA DE VALORES EM DX
    MOV AH,02  ;FUNCAO PARA IMPRIMIR CARACTER
    MOV DL,10  
    INT 21H    ;EXECUTA A FUNCAO
    POP DX ;RETORNAR VALORES DESEJADOS PARA DX
    POP AX ;RETORNAR VALORES DESEJADOS PARA AX
endm
.DATA
    MSG1 DB 'Bem-Vindo ao jogo Batalha Naval!! $'    
    MSG2 DB 'Digite a posicao que deseja atacar: $'  
    MSG3 DB 'Parabens! Voce acertou um alvo! $' 
    MSG4 DB 'Sinto muito, voce nao acertou nenhum alvo $'
    MWW1 DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0    ;MWW1 = MATRIZ WORLD WAR 1  
         DB   0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0    ;POSICAO DO HIDROAVIAO (1,17 - 1,19 E 2,18)
         DB   0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0    ;POSICAO DO ENCOURACADO (2,5 - 5,2)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0    ;POSICAO DA FRAGATA (8,13 - 8,15)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0    ;POSICAO DO SUBMARINO (10,18 - 11,17
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0    ;POSICAO DO HIDROAVIAO (14,9 - 14,11 E 13,10)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0    ;POSICAO DO SUBMARINO (19,3 - 20,3)
         DB   0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

    MWW2 DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0    ;MWW2 = MATRIZ WORLD WAR 2
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0    ;POSICAO DO SUBMARINO (3,3 - 4,3)
         DB   0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0    ;POSICAO DO ENCOURACADO (4,19 - 7,19)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0
         DB   0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0    ;POSICAO DO SUBMARINO (6,10 - 7,10
         DB   0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0    ;POSICAO DO HIDROAVIAO (10,6 - 10,8 E 9,7)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0    ;POSICAO DA FRAGATA (15,10 - 15,12)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0    ;POSICAO DO HIDROAVIAO (19,15 - 19,17 E 20,16)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0

    MWW3 DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0    ;MWW3 = MATRIZ WORLD WAR 3
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0    ;POSICAO DO HIDROAVIAO (4,6 - 6,6 E 5,5)
         DB   0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0    ;POSICAO DO SUBMARINO (8,11 - 8,12)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0    ;POSICAO DO HIDROAVIAO (12,14 - 12,16 E 11,15)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0    ;POSICAO DA FRAGATA (14,15 - 15,16 - 16,17)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0
         DB   0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0    ;POSICAO DO ENCORACADO (17,8 - 20,8)
         DB   0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1    ;POSICAO DO SUBMARINO (18,20 - 19,20)
         DB   0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1
         DB   0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0

    MUS  DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0    ;MUS = MATRIZ DO USUARIO
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AH,09   ;FUNCAO IMPRIME STRING
    LEA DX,MSG1 ;CHAMA A STRING DESEJADA
    INT 21H     ;EXECUTA A FUNCAO
    pula        ;MACRO PULA A LINHA

    CALL IMPRIME  ;CHAMA O PROCEDIMENTO IMPRIME

    MOV AH,09   ;FUNCAO IMPRIME STRING
    LEA DX,MSG2 ;CHAMA A STRING DESEJADA
    INT 21H     ;EXECUTA A FUNCAO
    pula        ;MACRO PULA A LINHA

    MOV AH,4CH  ;FINALIZA O PROGRAMA           
    INT 21H
MAIN ENDP
IMPRIME PROC                  ;INICIA PROCEDIMENTO IMPRIME
    XOR DX,DX                 ;ZERA DX PARA REALIZAR O PROCEDIMENTO IMPRIME
    MOV DI,20   ;MOVE DI PARA 20 (20 LINHAS)              
L1:            
    MOV CX,20   ;MOVE CX PARA 20 (20 COLUNAS)
    MOV AH,02   ;FUNCAO IMPRIME CARACTER                 
L2:     
        MOV DL,MUS[BX][SI]    ;MOV VALOR DA MATRIZ DO USUARIO PARA DL
        OR DL,30H             ;TRANSFORMA VALOR OBTIDO EM NUMERO
        int 21h               ;EXECUTA FUNCAO IMPRIME
        INC SI                ;INCREMENTA SI PARA MUDAR DE COLUNA
        LOOP L2               ;REINICIA LOOP ATE CX=0
    ADD BX,4                  ;ADICIONA BX EM 4 PARA PARTIR PARA A PROXIMA LINHA
    PULA                      ;MACRO PULA LINHA
    DEC DI                    ;DECREMENTA DI PARA DESCONTAR LINHA IMPRIMIDA
    JNZ L1                    ;REINICIA ATE DI=0
    RET                       ;RETORNA AO PROGRAMA PRINCIPAL
IMPRIME ENDP                  ;FINALIZA PROCEDIMENTO
END MAIN
