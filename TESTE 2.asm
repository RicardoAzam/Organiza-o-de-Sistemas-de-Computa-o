TITLE TESTE 2
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
    msga db 'acertou $'
    msge db 'errou $'
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
         MUS DB   'X','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T'
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

    ;msg para pedir linha - pula
    MOV AH,01
    INT 21h
    xor cx,cx
    MOV DL, 41h

    L1:
    CMP AL,DL
    JE LINHA
    INC DL
    ADD CX,20
    JMP L1
    LINHA:
    mov bx,cx
    xor dx,dx
    xor si,si
    
    ;mov ah,02
    ;mov dl, MWW1[bx][si]
    ;or dl, 30h
    ;int 21h
    PULA
    ;msg para pedi coluna - pula
    mov ah,01
    int 21h
    mov dl,41h
    xor cx,cx
    L2:
    CMP AL,DL
    JE coluna
    INC DL
    inc cx
    JMP L2
    coluna:
    mov si,cx
    xor dx,dx
    ;xor bx,bx
    
    ;mov ah,02
    ;mov dl, MWW1[bx][si]
    ;or dl, 30h
    ;Int 21h
    PULA
    cmp MWW1 [BX][SI],1
    je acerto
    mov ah,09
    lea dx,msge
    int 21h
    JMP FIM

    acerto:
    mov ah,09
    lea dx,msga
    int 21h
    PULA

    FIM:
    INC SI
    ADD BX,21
    MOV MUS[BX][SI],31H
    CALL IMPRIME
    mov ah,4CH
    int 21h
main ENDP
IMPRIME PROC                  ;INICIA PROCEDIMENTO IMPRIME
    XOR DX,DX                 ;ZERA DX PARA REALIZAR O PROCEDIMENTO IMPRIME
    XOR BX,BX
    MOV DI,21   ;MOVE DI PARA 20 (20 LINHAS)              
L3:            
    MOV CX,21   ;MOVE CX PARA 20 (20 COLUNAS)
    MOV AH,02   ;FUNCAO IMPRIME CARACTER 
    XOR SI,SI   ;ZERA VALOR DA COLUNA                
L4:     
        MOV DL,MUS[BX][SI]    ;MOV VALOR DA MATRIZ DO USUARIO PARA DL
        cmp DL,39h
        ja letra
        OR DL,30H             ;TRANSFORMA VALOR OBTIDO EM NUMERO
        int 21h               ;EXECUTA FUNCAO IMPRIME
        INC SI                ;INCREMENTA SI PARA MUDAR DE COLUNA
        LOOP L4               ;REINICIA LOOP ATE CX=0
    ADD BX,21                  ;ADICIONA BX EM 4 PARA PARTIR PARA A PROXIMA LINHA
    PULA                      ;MACRO PULA LINHA
    DEC DI                    ;DECREMENTA DI PARA DESCONTAR LINHA IMPRIMIDA
    JNZ L3                    ;REINICIA ATE DI=0
    JMP fimA
    letra:
    int 21h
    INC SI
    LOOP L4
    ADD BX,21
    PULA
    DEC DI
    JNZ L3
    fimA:
    RET                       ;RETORNA AO PROGRAMA PRINCIPAL
IMPRIME ENDP                  ;FINALIZA PROCEDIMENTO
end main
