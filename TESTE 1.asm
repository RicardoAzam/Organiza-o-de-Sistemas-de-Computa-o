TITLE TESTE  
.MODEL SMALL
.DATA 
      MATRIZ DB 'A','B','C','D'
             DB 'A',3,2,1
             DB 'B',2,3,4
             DB 'C',3,2,1
.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX

    CALL IMPRIME

    MOV AH,4CH
    INT 21h
MAIN ENDP
IMPRIME PROC                  ;INICIA PROCEDIMENTO IMPRIME
    XOR DX,DX                 ;ZERA DX PARA REALIZAR O PROCEDIMENTO IMPRIME
    MOV DI,4   ;MOVE DI PARA 20 (20 LINHAS)              
L1:            
    MOV CX,4   ;MOVE CX PARA 20 (20 COLUNAS)
    MOV AH,02   ;FUNCAO IMPRIME CARACTER 
    XOR SI,SI   ;ZERA VALOR DA COLUNA                
L2:     
        MOV DL,MATRIZ[BX][SI]    ;MOV VALOR DA MATRIZ DO USUARIO PARA DL
        cmp dl,39h
        ja letra
        OR DL,30H             ;TRANSFORMA VALOR OBTIDO EM NUMERO
        int 21h               ;EXECUTA FUNCAO IMPRIME
        INC SI                ;INCREMENTA SI PARA MUDAR DE COLUNA
        LOOP L2               ;REINICIA LOOP ATE CX=0
    ADD BX,4                  ;ADICIONA BX EM 4 PARA PARTIR PARA A PROXIMA LINHA
    mov ah,02
    mov dl,10
    int 21h                      ;MACRO PULA LINHA
    DEC DI                    ;DECREMENTA DI PARA DESCONTAR LINHA IMPRIMIDA
    JNZ L1                    ;REINICIA ATE DI=0
    jmp fim
    letra:
    
    int 21h
    inc si
    loop L2
    ADD bx,4
    mov ah,02
    mov dl,10
    int 21h
    dec DI
    jnz L1
    fim:
    RET                       ;RETORNA AO PROGRAMA PRINCIPAL
IMPRIME ENDP                  ;FINALIZA PROCEDIMENTO
END MAIN