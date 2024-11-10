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
    MSG7 DB 'DIGITE QUALQUER TECLA PARA CONTINUAR OU S PARA SAIR: $'
    MSG8 DB ' GOSTARIA DE REPETIR A DOSE? QUALQUER TECLA PARA REINICIAR OU S PARA SAIR: $'
    cont_Hidro1 DB 0    ; Contador de acertos para o Hidroavião
    cont_Hidro2 DB 0    ; Contador de acertos para o Hidroavião
    cont_Encou DB 0    ; Contador de acertos para o Encouracado
    cont_Fragata DB 0  ; Contador de acertos para a Fragata
    cont_Submarino1 DB 0 ; Contador de acertos para o Submarino
    cont_Submarino2 DB 0 ; Contador de acertos para o Submarino
    msgNaufragadoHidro db ' Voce naufragou um Hidroaviao! $'
    msgNaufragadoEncou db ' Voce naufragou o Encouracado! $'
    msgNaufragadoFragata db ' Voce naufragou a Fragata! $'
    msgNaufragadoSub db ' Voce naufragou um Submarino! $'
    MSG6 DB 'Digite a coordena em letra da LINHA que deseja atacar (de A a T MAIUSCULO): $'  
    MSG9 DB 'Digite a coordena em letra da COLUNA que deseja atacar (de A ate T MAIUSCULO): $' 
    msga db 'Parabens! Voce acertou um alvo! $' 
    msge db 'Sinto muito, voce nao acertou nenhum alvo $'
    msg_vitoria db ' Voce naufragou todos os navios! Voce venceu! $'
    ; Defina o número total de células ocupadas pelos navios (somando os 1s)
    ;TOTAL_ACERTOS DB 19 
    contador_acertos DB 0  ; Contador para acompanhar os acertos
    

    MWW1 DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0    ;MWW1 = MATRIZ WORLD WAR 1  
         DB   0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0    ;POSICAO DO HIDROAVIAO (1,17 - 1,19 E 2,18)
         DB   0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0    ;POSICAO DO ENCOURACADO (2,5 - 5,2)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,0,0,0,0,0    ;POSICAO DA FRAGATA (8,13 - 8,15)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,0    ;POSICAO DO SUBMARINO (10,18 - 11,17)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,2,2,2,0,0,0,0,0,0,0,0,0    ;POSICAO DO HIDROAVIAO (14,9 - 14,11 E 13,10)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0    ;POSICAO DO SUBMARINO (19,3 - 20,3)
         DB   0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

    MWW2 DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0    ;MWW2 = MATRIZ WORLD WAR 2
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0    ;POSICAO DO SUBMARINO (3,3 - 4,3)
         DB   0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0    ;POSICAO DO ENCOURACADO (4,19 - 7,19)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0
         DB   0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,4,0    ;POSICAO DO SUBMARINO (6,10 - 7,10
         DB   0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,4,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0    ;POSICAO DO HIDROAVIAO (10,6 - 10,8 E 9,7)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,3,3,3,0,0,0,0,0,0,0,0    ;POSICAO DA FRAGATA (15,10 - 15,12)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,0    ;POSICAO DO HIDROAVIAO (19,15 - 19,17 E 20,16)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0

    MWW3 DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0    ;MWW3 = MATRIZ WORLD WAR 3
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0    ;POSICAO DO HIDROAVIAO (4,6 - 6,6 E 5,5)
         DB   0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0    ;POSICAO DO SUBMARINO (8,11 - 8,12)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,0,0    ;POSICAO DO HIDROAVIAO (12,14 - 12,16 E 11,15)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0    ;POSICAO DA FRAGATA (14,15 - 15,16 - 16,17)
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0
         DB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0
         DB   0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0    ;POSICAO DO ENCORACADO (17,8 - 20,8)
         DB   0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,6    ;POSICAO DO SUBMARINO (18,20 - 19,20)
         DB   0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,6
         DB   0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0

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
   
    jmp start1

    start2:
    call ZERAR             ;zera todos os elementos da matriz
    lea dx, msg_vitoria    ;MENSAGEM DE VITORIA CASA AL = 19
    IMPRI

    PULA

    lea dx,MSG8             ;MENSAGEM GOSTARIA DE REPETIR A DOSE
    IMPRI

    mov ah,1                ;REQUISITA CARACTER
    int 21h                 ;EXECUTA

    cmp al,53h              ;COMPARA AL COM 'S'
    je jmpl              ;jump para o fim do programa
    jmp start1
    jmpl:
    jmp next

    start1:
    LEA DX,MSG1 ;CHAMA A STRING DESEJADA
    IMPRI
    PULA        ;MACRO PULA A LINHA
    PULA
    
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

    CALL G1                     ; Caso contrário, chama a sub-rotina de leitura binária
    cmp al,53h
    je NEXT
    jmp start2                    ; Pula para o inicio

    SEGUEG2:
    CALL G2
    JMP start2
    
    SEGUEG3:
    CALL G3
    jmp start2

    NEXT:
    MOV AH,4CH  ;FINALIZA O PROGRAMA           
    INT 21H
MAIN ENDP

G1 PROC
   ;RP2:
    CALL ZERAR             ;ZERA MATRIZ USUARIO

    mov cont_Hidro1,0        ;ZERA CONTADORES DOS NAVIOS
    mov cont_Hidro2,0
    mov cont_Encou,0
    mov cont_Fragata,0 
    mov cont_Submarino1,0
    mov cont_Submarino2,0
    mov contador_acertos,0

    PULA
    INICIO:
    CALL IMPRIME
    AGAIN:
    lea dx,MSG6            ;REQUISITA COORDENADA DA LINHA
    IMPRI

    MOV AH,01              ;REQUISITA CARACTER
    INT 21h

    cmp al,41h             ;COMPARA COM 'A'
    jb INICIO

    cmp al,54h             ;COMPARA COM 'T'
    ja INICIO

    xor cx,cx              ;ZERA CONTADOR
    MOV DL, 41h            ;DL<--A
    xor DI,DI              ;ZERA SEGUNDO CONTADOR
    INC DI                 ;INCREMENTA DI
    L11:
    CMP AL,DL              ;COMPARA ELEMENTO DIGITADO COM 'A' 
    JE LINHA               ;SE FOR IGUAL JUMP LINHA
    INC DI                 ;INCREMENTA DI
    INC DL                 ;DL = A-->B
    ADD CX,20              ;ACRESCENTA 20 EM CONTADOR PARA MOVER PARA PROXIMA LINHA
    JMP L11                ;REINICIA LOOP ATE O ELEMENTA DIGITADOR FOR IGUAL A DL

    LINHA:
    ;PUSH AX                ;SEILA PORQUE ********************************
    mov bx,cx              ;CONTADOR CX --> BX, O REGISTRADOR QUE MANIPULA A LINHA DA MATRIZ
    xor dx,dx              ;ZERA DX
    xor si,si              ;ZERA REGISTRADOR RESPONSAVEL PELAS COLUNAS DA MATRIZ
    PULA                   
    lea dx,MSG9            ;REQUISITA CARACTER EM LETRA PARA A COLUNA DESEJADA
    IMPRI 

    mov ah,01              ;REQUISITA CARACTER
    int 21h                ;EXECUTA

    cmp al,41h             ;COMPARA VALOR DIGITADO COM 'A'
    jb INICIO

    cmp al,54h             ;COMPARA VALOR DIGITADO COM 'B'
    ja INICIO

    mov dl,41h             ;DL <-- A
    xor cx,cx              ;ZERA CONTADOR CX

    L22:
    CMP AL,DL              ;COMPARA VALOR DIGITADO COM 'A'
    JE coluna              ;SE FOR IGUAL JUMP COLUNA
    INC DL                 ;DL= 'A'-->'B'
    inc cx                 ;INCREMENTA CONTADOR CX
    JMP L22                ;REINICIA ATE VALOR DIGITADO PELO USUARIO FOR IGUAL A DL

    coluna:
    mov si,cx              ;CX-->SI, REGISTRADOR RESPONSAVEL PELA MANIPULACAO DE COLUNAS
    xor dx,dx              ;ZERA DX
    PULA
    PULA
    cmp MWW1 [BX][SI],0    ;COMPARA CORDENADA ESCOLHIDA PELO USUARIO COM 0 (TIRO NA AGUA)
    jne acerto             ;SE FOR DIFERENTE JUMP ACERTO (NAO EH AGUA,LOGO EH UM NAVIO)
    PULA

    cor:                   ;LOOP PARA OBTER VALOR DA COLUNA DESEJADA DA MATRIZ 21X21        
    INC SI                 ;INCREMENTA REGISTRADOR DE MANIPULACAO DE COLUNA EM 1
    DEC DI                 ;DECREMENTA DI EM 1
    JNZ cor                ;SE DI FOR DIFERENTE DE 0, REINICIAR LOOP 'COR'
    ADD BX,21              ;INCREMENTA EM BX 21, PARA OBTER VALOR DA LINHA DESEJADA DA MATRIZ 21X21
    MOV MUS[BX][SI],'*'    ;COORDENADA OBTIDA ACIMA RECEBE '*' (TIRO NA AGUA)
    CALL IMPRIME           ;IMPRIME MATRIZ 21X21
    lea dx,msge            ;IMPRIME MENSAGEM QUE ALERTA O ERRO AO ALVO PARA O USUARIO
    IMPRI                  
    PULA

    ;CALL DESISTIR
    lea dx,MSG7            ;MENSAGEM QUE PERGUNTA SE USUARIO DESEJA DESISTIR OU CONTINUAR
    IMPRI

    mov ah,1               ;REQUISITA CARACTER
    int 21h                ;EXECUTA

    cmp al,53h             ;COMPARA COM 'S'
    je continua            ;SE FOR IGUAL JUMP CONTINUA

    JMP QUASE2             ;QUASE2 =PULA E JUMP --> AGAIN

    ;RP1:                   ;ROTULO PARA REINICIAR O PROGRAMA
    ;jmp RP2

    continua:              ;JMP CONTINUA -->CONTINUA1 -->FINALMENTE
    jmp continua1

    acerto:                ;COORDENA DIGITADA EH DIFERENTE DE 0
    INC contador_acertos   ;INCREMENTA CONTADOR GERAL DOS NAVIOS

     ; Identifique o tipo de navio e incremente o contador correto
    cmp MWW1[BX][SI], 1   ;SE CORDENADA FOR IGUAL A 1, O HIDROAVIAO FOI ATINGIDO
    je jmpl2 
    jmp hidroaviao2
    jmpl2:
    jmp hidroavião_acertado1

    hidroaviao2:
    cmp MWW1[BX][SI], 2  ;SE CORDENADA FOR IGUAL A 2, O HIDROAVIAO2 FOI ATINGIDO
    je meiotermo0

    fragata:
    cmp MWW1[BX][SI], 3  ;SE CORDENADA FOR IGUAL A 3, A FRAGATA FOI ATINGIDA
    je meiotermo1

    ;encouracado:
    cmp MWW1[BX][SI], 4  ;SE CORDENADA FOR IGUAL A 4, O ENCOURACADO FOI ATINGIDO
    je meiotermo2

    cmp MWW1[BX][SI], 5  ;SE CORDENADA FOR IGUAL A 5, O SUBMARINO FOI ATINGIDO
    je submarino_acertado1

    cmp MWW1[BX][SI], 6  ;SE CORDENADA FOR IGUAL A 6, O SUBMARINO2 FOI ATINGIDO
    je submarino_acertado2
    
    
    submarino_acertado1:
    inc cont_Submarino1
    cmp cont_Submarino1, 2
    jne jmpl3
    jmp continu 
    jmpl3:
    jmp fim1
    continu:
    lea dx, msgNaufragadoSub
    IMPRI
    PULA
    jmp fimAcerto

    submarino_acertado2:
    inc cont_Submarino2
    cmp cont_Submarino2, 2
    jne fim1
    lea dx, msgNaufragadoSub
    IMPRI
    PULA
    jmp fimAcerto

    meiotermo0:
    jmp hidroavião_acertado2
    meiotermo1:
    jmp fragata_acertada
    meiotermo2:
    jmp encouraçado_acertado
    

    hidroavião_acertado1:
    inc cont_Hidro1
    cmp cont_Hidro1, 4  ; Verifique se todas as partes foram acertadas
    jne fim1
    ; Mensagem de naufrágio
    lea dx, msgNaufragadoHidro
    IMPRI
    PULA
    jmp fimAcerto

    hidroavião_acertado2:
    inc cont_Hidro2
    cmp cont_Hidro2, 4  ; Verifique se todas as partes foram acertadas
    jne fimAcerto
    lea dx, msgNaufragadoHidro
    IMPRI
    PULA

    fim1:
    jmp fimAcerto

    fragata_acertada:
    inc cont_Fragata
    cmp cont_Fragata, 3
    jne fimAcerto
    lea dx, msgNaufragadoFragata
    IMPRI
    PULA
    jmp fimAcerto

    encouraçado_acertado:
    inc cont_Encou
    cmp cont_Encou, 4
    jne fimAcerto
    lea dx, msgNaufragadoEncou
    IMPRI
    PULA
    jmp fimAcerto

    ;RP0:
    ;Jmp RP1

    continua1:
    jmp finalmente

fimAcerto:
     coor:
    INC SI 
    DEC DI
    JNZ coor
    ADD BX,21
    MOV AL, contador_acertos
    CMP AL, 19
    JNE QUASE1  ; SE DIFERENTE DE 19 --> AINDA TEM NAVIOS PARA NAUFRAGAR,LOGO JUMP QUASE 1

    jmp finalmente

    QUASE1:
    MOV MUS[BX][SI],31h    ;move 1 para a coordenada escolhida pelo usuario, indicando acerto
    CALL IMPRIME

    lea dx,msga            ;mensagem avisando o usuario que acertou algum navio
    IMPRI
    PULA

    ;CALL DESISTIR

    lea dx,MSG7
    IMPRI

    mov ah,1
    int 21h

    cmp al,53h
    je finalmente

    QUASE2:
    PULA
    jmp AGAIN
    finalmente:
    RET
G1 ENDP

G2 PROC
RET
G2 ENDP 
G3 PROC
RET
G3 ENDP

IMPRIME PROC                  ;INICIA PROCEDIMENTO IMPRIME
    XOR DX,DX                 ;ZERA DX PARA REALIZAR O PROCEDIMENTO IMPRIME
    XOR BX,BX
    MOV DI,21   ;MOVE DI PARA 20 (20 LINHAS)              
L3:            
    MOV CX,21   ;MOVE CX PARA 20 (20 COLUNAS)
    MOV AH,02   ;FUNCAO IMPRIME CARACTER
    mov dl,' '               
    int 21h 
    XOR SI,SI   ;ZERA VALOR DA COLUNA                
L4:     
        MOV DL,MUS[BX][SI]    ;MOV VALOR DA MATRIZ DO USUARIO PARA DL
        cmp DL,9
        ja letraa
        OR DL,30H             ;TRANSFORMA VALOR OBTIDO EM NUMERO
        int 21h
        mov dl,' '               
        int 21h
        INC SI                ;INCREMENTA SI PARA MUDAR DE COLUNA
        LOOP L4               ;REINICIA LOOP ATE CX=0
    ADD BX,21                  ;ADICIONA BX EM 4 PARA PARTIR PARA A PROXIMA LINHA
    PULA                      ;MACRO PULA LINHA
    DEC DI                    ;DECREMENTA DI PARA DESCONTAR LINHA IMPRIMIDA
    JNZ L3                    ;REINICIA ATE DI=0
    JMP fimA
    letraa:
    int 21h
    mov dl,' '               
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

;DESISTIR PROC
    ;lea dx,MSG7              ;DIGITE QUALQUER TECLA PARA CONTINUAR OU 'S' PARA SAIR
    ;IMPRI
    ;mov ah,1
    ;int 21h
    ;RET
;DESISTIR ENDP
;REPETIR PROC
    ;PULA
    ;lea dx,MSG8
    ;IMPRI
    ;mov ah,1
    ;int 21h
    ;RET
;REPETIR ENDP
ZERAR PROC
    XOR DX,DX                 ;ZERA DX PARA REALIZAR O PROCEDIMENTO IMPRIME
    XOR BX,BX
    MOV DI,21   ;MOVE DI PARA 20 (20 LINHAS)              
Z3:            
    MOV CX,21   ;MOVE CX PARA 20 (20 COLUNAS)
    XOR SI,SI   ;ZERA VALOR DA COLUNA  
    xor AX,AX              
Z4:     
        MOV DL,MUS[BX][SI]    ;MOV VALOR DA MATRIZ DO USUARIO PARA DL
        cmp DL,39h
        ja letraZ
        mov MUS[BX][SI],AL
        INC SI                ;INCREMENTA SI PARA MUDAR DE COLUNA
        LOOP Z4               ;REINICIA LOOP ATE CX=0
    ADD BX,21                  ;ADICIONA BX EM 4 PARA PARTIR PARA A PROXIMA LINHA
    PULA                      ;MACRO PULA LINHA
    DEC DI                    ;DECREMENTA DI PARA DESCONTAR LINHA IMPRIMIDA
    JNZ Z3                    ;REINICIA ATE DI=0
    JMP fimZ
    letraZ:
    INC SI
    LOOP Z4
    ADD BX,21
    PULA
    DEC DI
    JNZ Z3
    fimZ:
    RET  
ZERAR ENDP
END MAIN