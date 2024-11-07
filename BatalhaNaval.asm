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
IMPRI macro
    PUSHAL                        ; Armazena os registradores para preservar seus valores
    mov ah,9                      ; Função de exibição de string (DOS)
    int 21h                       ; Chama a interrupção do DOS para exibir a string
    POPAL                         ; Restaura os registradores para os valores originais
endm

PUSHAL macro                     ; Armazena todos os registradores
    PUSH ax
    PUSH bx
    PUSH cx
    PUSH dx
    PUSH di
    PUSH si
endm

POPAL macro                      ; Restaura todos os registradores
    POP si
    POP di
    POP dx
    POP cx
    POP bx
    POP ax
endm
.DATA
    MSG1 DB 'Bem-Vindo ao jogo Batalha Naval!! $'  
    MSG2 DB 'Qual mapa deseja jogar? $'
    MSG3 DB '1.Primeira Guerra Mundial $'
    MSG4 DB '2.Segunda Guerra Mundial $'
    MSG5 DB '3.Guerra Moderna $'
    MSG6 DB 'Digite a coordena em letra da LINHA que deseja atacar: $'  
    MSG7 DB 'Parabens! Voce acertou um alvo! $' 
    MSG8 DB 'Sinto muito, voce nao acertou nenhum alvo $'
    MSG9 DB 'Digite a coordena em letra da COLUNA que deseja atacar: $'
    MWW1 DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0    ;MWW1 = MATRIZ WORLD WAR 1  
         DB   0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0    ;POSICAO DO HIDROAVIAO (1,17 - 1,19 E 2,18)
         DB   0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0    ;POSICAO DO ENCOURACADO (2,5 - 5,2)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0    ;POSICAO DA FRAGATA (8,13 - 8,15)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0    ;POSICAO DO SUBMARINO (10,18 - 11,17)
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

    MUS  DB   'X','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T'
         DB   'A',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0    ;MUS = MATRIZ DO USUARIO
         DB   'B',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'C',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'D',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'E',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'F',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'G',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'H',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'I',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'J',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'K',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'L',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'M',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'N',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'O',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'P',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'Q',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'R',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'S',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   'T',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    LEA DX,MSG1 ;CHAMA A STRING DESEJADA
    IMPRI
    PULA        ;MACRO PULA A LINHA

    LEA DX,MSG2 ;CHAMA A STRING DESEJADA
    IMPRI
    PULA
    LEA DX,MSG3 ;CHAMA A STRING DESEJADA
    IMPRI
    PULA
    LEA DX,MSG4 ;CHAMA A STRING DESEJADA
    IMPRI
    PULA
    LEA DX,MSG5 ;CHAMA A STRING DESEJADA
    IMPRI
    PULA
    
    mov ah,1                     ; Função de entrada para ler um caractere do teclado
    int 21h                       ; Chama a interrupção do DOS para ler o caractere
    cmp al,'2'                   ; Compara a entrada com '2' (Hexadecimal)
    je SEGUEG2                   ; Se for '2', pula para a sub-rotina de leitura hexadecimal
    cmp al,'3'                   ; Compara a entrada com '3' (Decimal)
    je SEGUEG3                   ; Se for '3', pula para a sub-rotina de leitura decimal
    CALL G1                  ; Caso contrário, chama a sub-rotina de leitura binária
    JMP NEXT                     ; Pula para a seção de exibição de resultados

    SEGUEG2:
    CALL G2
    JMP NEXT
    
    SEGUEG3:
    CALL G3

    NEXT:

    ;CALL IMPRIME  ;CHAMA O PROCEDIMENTO IMPRIME

    MOV AH,4CH  ;FINALIZA O PROGRAMA           
    INT 21H
MAIN ENDP
IMPRIME PROC                  ;INICIA PROCEDIMENTO IMPRIME
    XOR DX,DX                 ;ZERA DX PARA REALIZAR O PROCEDIMENTO IMPRIME
    MOV DI,21   ;MOVE DI PARA 20 (20 LINHAS)              
L1:            
    MOV CX,21   ;MOVE CX PARA 20 (20 COLUNAS)
    MOV AH,02   ;FUNCAO IMPRIME CARACTER 
    XOR SI,SI   ;ZERA VALOR DA COLUNA                
L2:     
        MOV DL,MUS[BX][SI]    ;MOV VALOR DA MATRIZ DO USUARIO PARA DL
        cmp DL,39h
        ja letra
        OR DL,30H             ;TRANSFORMA VALOR OBTIDO EM NUMERO
        int 21h               ;EXECUTA FUNCAO IMPRIME
        INC SI                ;INCREMENTA SI PARA MUDAR DE COLUNA
        LOOP L2               ;REINICIA LOOP ATE CX=0
    ADD BX,21                  ;ADICIONA BX EM 4 PARA PARTIR PARA A PROXIMA LINHA
    PULA                      ;MACRO PULA LINHA
    DEC DI                    ;DECREMENTA DI PARA DESCONTAR LINHA IMPRIMIDA
    JNZ L1                    ;REINICIA ATE DI=0
    JMP fim
    letra:
    int 21h
    INC SI
    LOOP L2
    ADD BX,21
    PULA
    DEC DI
    JNZ L1
    fim:
    RET                       ;RETORNA AO PROGRAMA PRINCIPAL
IMPRIME ENDP                  ;FINALIZA PROCEDIMENTO
G1 PROC
    PULA
    CALL IMPRIME
    LEA DX,MSG6
    IMPRI
    MOV AH,01
    INT 21H
    PULA

    LEA DX,MSG9
    IMPRI
    MOV AH,01
    INT 21H

RET
G1 ENDP
G2 PROC
RET
G2 ENDP 
G3 PROC
RET
G3 ENDP
END MAIN