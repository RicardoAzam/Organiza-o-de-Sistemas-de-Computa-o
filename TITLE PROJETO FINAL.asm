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
    msga db 'acertou $'
    msge db 'errou $'
    MWW1 DB   0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0    ;MWW1 = MATRIZ WORLD WAR 1  
         DB   5,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0    ;POSICAO DO HIDROAVIAO (1,17 - 1,19 E 2,18)
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
    
    mov ah,02
    mov dl, MWW1[bx][si]
    or dl, 30h
    int 21h
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
    xor bx,bx
    
    mov ah,02
    mov dl, MWW1[bx][si]
    or dl, 30h
    int 21h
    ;PULA
    ;cmp MWW1 [BX][SI],1
    ;je acerto
    ;mov ah,09
    ;lea dx,msge
    ;int 21h
    ;JMP FIM

    ;acerto:
    ;mov ah,09
    ;lea dx,msga
   ; int 21h

    FIM:
    mov ah,4CH
    int 21h
main ENDP
end main
