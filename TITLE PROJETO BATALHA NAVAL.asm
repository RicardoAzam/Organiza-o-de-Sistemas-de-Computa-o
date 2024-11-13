TITLE PROJETO BATALHA NAVAL
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
    call IMPRIME             ;zera todos os elementos da matriz
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
    CALL ZERAR
    mov cont_Hidro1,0        ;ZERA CONTADORES DOS NAVIOS
    mov cont_Hidro2,0
    mov cont_Encou,0
    mov cont_Fragata,0 
    mov cont_Submarino1,0
    mov cont_Submarino2,0
    mov contador_acertos,0

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
    int 21h  
    PULA                     ; Chama a interrupção do DOS para ler o caractere
    PULA
    PULA

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
    cmp al,53h
    je NEXT
    JMP start2
    
    SEGUEG3:
    CALL G3
    cmp al,53h
    je NEXT
    jmp start2

    NEXT:
    MOV AH,4CH  ;FINALIZA O PROGRAMA           
    INT 21H
MAIN ENDP

G1 PROC

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

    lea dx,MSG7            ;MENSAGEM QUE PERGUNTA SE USUARIO DESEJA DESISTIR OU CONTINUAR
    IMPRI

    mov ah,1               ;REQUISITA CARACTER
    int 21h                ;EXECUTA

    cmp al,53h             ;COMPARA COM 'S'
    je continua            ;SE FOR IGUAL JUMP CONTINUA

    JMP QUASE2             ;QUASE2 =PULA E JUMP --> AGAIN

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

    cmp MWW1[BX][SI], 3  ;SE CORDENADA FOR IGUAL A 3, A FRAGATA FOI ATINGIDA
    je meiotermo1

    cmp MWW1[BX][SI], 4  ;SE CORDENADA FOR IGUAL A 4, O ENCOURACADO FOI ATINGIDO
    je meiotermo2

    cmp MWW1[BX][SI], 5  ;SE CORDENADA FOR IGUAL A 5, O SUBMARINO FOI ATINGIDO
    je submarino_acertado1

    cmp MWW1[BX][SI], 6  ;SE CORDENADA FOR IGUAL A 6, O SUBMARINO2 FOI ATINGIDO
    je submarino_acertado2
    
    
    submarino_acertado1:
    inc cont_Submarino1            ; Incrementa o contador de acertos do submarino 1
    cmp cont_Submarino1, 2          ; Compara o número de acertos com 2 (número total de partes do submarino 1)
    jne jmpl3                       ; Se o número de acertos for diferente de 2, vai para jmpl3 (não completou o naufrágio)
    jmp continu                     ; Se o número de acertos for igual a 2, vai para continu (naufrágio confirmado)
jmpl3:
    jmp fim1                        ; Se o naufrágio não foi completado, vai para fim1 (continua o jogo sem mensagem de naufrágio)
continu:
    lea dx, msgNaufragadoSub        ; Carrega a mensagem de naufrágio do submarino 1
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp fimAcerto                   ; Vai para fimAcerto após o naufrágio ser confirmado

    submarino_acertado2:
    inc cont_Submarino2            ; Incrementa o contador de acertos do submarino 2
    cmp cont_Submarino2, 2          ; Compara o número de acertos com 2 (número total de partes do submarino 2)
    jne fim1                        ; Se o número de acertos for diferente de 2, vai para fim1 (não completou o naufrágio)
    lea dx, msgNaufragadoSub        ; Carrega a mensagem de naufrágio do submarino 2
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp fimAcerto                   ; Vai para fimAcerto após o naufrágio ser confirmado

meiotermo0:
    jmp hidroavião_acertado2        ; Se atingiu a primeira parte do hidroavião, pula para o próximo tratamento

meiotermo1:
    jmp fragata_acertada           ; Se atingiu a primeira parte da fragata, pula para o tratamento da fragata

meiotermo2:
    jmp encouraçado_acertado       ; Se atingiu a primeira parte do encouraçado, pula para o tratamento do encouraçado

    hidroavião_acertado1:
    inc cont_Hidro1                ; Incrementa o contador de acertos do hidroavião 1
    cmp cont_Hidro1, 4              ; Compara o número de acertos com 4 (número total de partes do hidroavião 1)
    jne fim1                        ; Se o número de acertos for diferente de 4, vai para fim1 (não completou o naufrágio)
    lea dx, msgNaufragadoHidro      ; Carrega a mensagem de naufrágio do hidroavião 1
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp fimAcerto                   ; Vai para fimAcerto após o naufrágio ser confirmado

    hidroavião_acertado2:
    inc cont_Hidro2                ; Incrementa o contador de acertos do hidroavião 2
    cmp cont_Hidro2, 4              ; Compara o número de acertos com 4 (número total de partes do hidroavião 2)
    jne fimAcerto                   ; Se o número de acertos for diferente de 4, vai para fimAcerto (não completou o naufrágio)
    lea dx, msgNaufragadoHidro      ; Carrega a mensagem de naufrágio do hidroavião 2
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída

fim1:
    jmp fimAcerto                   ; Vai para fimAcerto para finalização do processo

    fragata_acertada:
    inc cont_Fragata               ; Incrementa o contador de acertos da fragata
    cmp cont_Fragata, 3             ; Compara o número de acertos com 3 (número total de partes da fragata)
    jne fimAcerto                   ; Se o número de acertos for diferente de 3, vai para fimAcerto (não completou o naufrágio)
    lea dx, msgNaufragadoFragata    ; Carrega a mensagem de naufrágio da fragata
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp fimAcerto                   ; Vai para fimAcerto após o naufrágio ser confirmado

    encouraçado_acertado:
    inc cont_Encou                  ; Incrementa o contador de acertos do encouraçado
    cmp cont_Encou, 4               ; Compara o número de acertos com 4 (número total de partes do encouraçado)
    jne fimAcerto                   ; Se o número de acertos for diferente de 4, vai para fimAcerto (não completou o naufrágio)
    lea dx, msgNaufragadoEncou      ; Carrega a mensagem de naufrágio do encouraçado
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp fimAcerto                   ; Vai para fimAcerto após o naufrágio ser confirmado

continua1:
    jmp finalmente                  ; Vai para finalmente, possivelmente finalizando o processo de acerto

fimAcerto:
    coor:
        INC SI                       ; Incrementa o índice de coluna (SI)
        DEC DI                       ; Decrementa o índice de linha (DI)
        JNZ coor                     ; Se DI for diferente de 0, continua o loop para ajustar a coordenada

    ADD BX, 21                      ; Ajusta a coordenada com 21 (possivelmente para mover para a próxima linha)
    MOV AL, contador_acertos        ; Carrega o número de acertos na variável AL
    CMP AL, 19                      ; Compara o número de acertos com 19 (total de partes de todos os navios)
    JNE QUASE1                      ; Se os acertos não forem 19, ainda existem navios para naufragar, então vai para QUASE1

    jmp finalmente                  ; Se todos os navios foram atingidos, vai para finalmente

QUASE1:
    MOV MUS[BX][SI], 31h            ; Marca a coordenada escolhida pelo jogador como acerto (muda para '1')
    CALL IMPRIME                    ; Chama a função para imprimir a matriz atualizada

    lea dx, msga                    ; Carrega a mensagem que avisa que um navio foi atingido
    IMPRI                           ; Exibe a mensagem

    PULA                            ; Chama a macro PULA para formatação de saída

    lea dx, MSG7                    ; Carrega a mensagem que pergunta se o jogador deseja continuar ou desistir
    IMPRI                           ; Exibe a mensagem

    mov ah, 1                       ; Prepara para ler um caractere do teclado
    int 21h                          ; Chama a interrupção 21h para ler o caractere

    cmp al, 53h                     ; Compara o caractere com 'S' (para continuar o jogo)
    je finalmente                   ; Se 'S' for pressionado, vai para finalmente (finaliza o processo de acerto)

QUASE2:
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp AGAIN                       ; Retorna para o início do loop de acerto

finalmente:
    RET                             ; Retorna da função, finalizando o processo de acerto
G1 ENDP

G2 PROC
     PULA
    INICIOO:
    CALL IMPRIME
    AGAINN:
    lea dx,MSG6            ;REQUISITA COORDENADA DA LINHA
    IMPRI

    MOV AH,01              ;REQUISITA CARACTER
    INT 21h

    cmp al,41h             ;COMPARA COM 'A'
    jb INICIOO

    cmp al,54h             ;COMPARA COM 'T'
    ja INICIOO

    xor cx,cx              ;ZERA CONTADOR
    MOV DL, 41h            ;DL<--A
    xor DI,DI              ;ZERA SEGUNDO CONTADOR
    INC DI                 ;INCREMENTA DI
    L111:
    CMP AL,DL              ;COMPARA ELEMENTO DIGITADO COM 'A' 
    JE LINHAA               ;SE FOR IGUAL JUMP LINHA
    INC DI                 ;INCREMENTA DI
    INC DL                 ;DL = A-->B
    ADD CX,20              ;ACRESCENTA 20 EM CONTADOR PARA MOVER PARA PROXIMA LINHA
    JMP L111                ;REINICIA LOOP ATE O ELEMENTA DIGITADOR FOR IGUAL A DL

    LINHAA:                
    mov bx,cx              ;CONTADOR CX --> BX, O REGISTRADOR QUE MANIPULA A LINHA DA MATRIZ
    xor dx,dx              ;ZERA DX
    xor si,si              ;ZERA REGISTRADOR RESPONSAVEL PELAS COLUNAS DA MATRIZ
    PULA                   
    lea dx,MSG9            ;REQUISITA CARACTER EM LETRA PARA A COLUNA DESEJADA
    IMPRI 

    mov ah,01              ;REQUISITA CARACTER
    int 21h                ;EXECUTA

    cmp al,41h             ;COMPARA VALOR DIGITADO COM 'A'
    jb INICIOO

    cmp al,54h             ;COMPARA VALOR DIGITADO COM 'B'
    ja INICIOO

    mov dl,41h             ;DL <-- A
    xor cx,cx              ;ZERA CONTADOR CX

    L222:
    CMP AL,DL              ;COMPARA VALOR DIGITADO COM 'A'
    JE colunaa              ;SE FOR IGUAL JUMP COLUNA
    INC DL                 ;DL= 'A'-->'B'
    inc cx                 ;INCREMENTA CONTADOR CX
    JMP L222                ;REINICIA ATE VALOR DIGITADO PELO USUARIO FOR IGUAL A DL

    colunaa:
    mov si,cx              ;CX-->SI, REGISTRADOR RESPONSAVEL PELA MANIPULACAO DE COLUNAS
    xor dx,dx              ;ZERA DX
    PULA
    PULA
    cmp MWW2 [BX][SI],0    ;COMPARA CORDENADA ESCOLHIDA PELO USUARIO COM 0 (TIRO NA AGUA)
    jne acertoo             ;SE FOR DIFERENTE JUMP ACERTO (NAO EH AGUA,LOGO EH UM NAVIO)
    PULA

    corr:                   ;LOOP PARA OBTER VALOR DA COLUNA DESEJADA DA MATRIZ 21X21        
    INC SI                 ;INCREMENTA REGISTRADOR DE MANIPULACAO DE COLUNA EM 1
    DEC DI                 ;DECREMENTA DI EM 1
    JNZ corr                ;SE DI FOR DIFERENTE DE 0, REINICIAR LOOP 'COR'
    ADD BX,21              ;INCREMENTA EM BX 21, PARA OBTER VALOR DA LINHA DESEJADA DA MATRIZ 21X21
    MOV MUS[BX][SI],'*'    ;COORDENADA OBTIDA ACIMA RECEBE '*' (TIRO NA AGUA)
    CALL IMPRIME           ;IMPRIME MATRIZ 21X21
    lea dx,msge            ;IMPRIME MENSAGEM QUE ALERTA O ERRO AO ALVO PARA O USUARIO
    IMPRI                  
    PULA

    lea dx,MSG7            ;MENSAGEM QUE PERGUNTA SE USUARIO DESEJA DESISTIR OU CONTINUAR
    IMPRI

    mov ah,1               ;REQUISITA CARACTER
    int 21h                ;EXECUTA

    cmp al,53h             ;COMPARA COM 'S'
    je continuaa            ;SE FOR IGUAL JUMP CONTINUA

    JMP QUASE22             ;QUASE2 =PULA E JUMP --> AGAIN

    continuaa:              ;JMP CONTINUA -->CONTINUA11 -->FINALMENTE
    jmp continua11

    acertoo:                ;COORDENA DIGITADA EH DIFERENTE DE 0
    INC contador_acertos   ;INCREMENTA CONTADOR GERAL DOS NAVIOS

     ; Identifique o tipo de navio e incremente o contador correto
    cmp MWW2[BX][SI], 1   ;SE CORDENADA FOR IGUAL A 1, O HIDROAVIAO FOI ATINGIDO
    je jmpl22 
    jmp hidroaviao22
    jmpl22:
    jmp hidroaviãoo_acertado1

    hidroaviao22:
    cmp MWW2[BX][SI], 2  ;SE CORDENADA FOR IGUAL A 2, O HIDROAVIAO2 FOI ATINGIDO
    je meiotermo00

    cmp MWW2[BX][SI], 3  ;SE CORDENADA FOR IGUAL A 3, A FRAGATA FOI ATINGIDA
    je meiotermo11

    cmp MWW2[BX][SI], 4  ;SE CORDENADA FOR IGUAL A 4, O ENCOURACADO FOI ATINGIDO
    je meiotermo22

    cmp MWW2[BX][SI], 5  ;SE CORDENADA FOR IGUAL A 5, O SUBMARINO FOI ATINGIDO
    je submarinoo_acertado1

    cmp MWW2[BX][SI], 6  ;SE CORDENADA FOR IGUAL A 6, O SUBMARINO2 FOI ATINGIDO
    je submarinoo_acertado2
    
    submarinoo_acertado1:
    inc cont_Submarino1            ; Incrementa o contador de acertos do submarino 1
    cmp cont_Submarino1, 2          ; Compara o número de acertos com 2 (número total de partes do submarino 1)
    jne jmpl33                     ; Se o número de acertos for diferente de 2, pula para jmpl33 (não completou o naufrágio)
    jmp continuu                   ; Se o número de acertos for igual a 2, vai para continuu (naufrágio confirmado)
jmpl33:
    jmp fim11                      ; Se o naufrágio não foi completado, vai para fim11, continuando o jogo sem mensagem de naufrágio
continuu:
    lea dx, msgNaufragadoSub        ; Carrega a mensagem de naufrágio do submarino 1
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp fimAcerto1                  ; Vai para fimAcerto1 após o naufrágio ser confirmado

    submarinoo_acertado2:
    inc cont_Submarino2            ; Incrementa o contador de acertos do submarino 2
    cmp cont_Submarino2, 2          ; Compara o número de acertos com 2 (número total de partes do submarino 2)
    jne fim11                      ; Se o número de acertos for diferente de 2, vai para fim11 (não completou o naufrágio)
    lea dx, msgNaufragadoSub        ; Carrega a mensagem de naufrágio do submarino 2
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp fimAcerto1                  ; Vai para fimAcerto1 após o naufrágio ser confirmado

meiotermo00:
    jmp hidroaviãoo_acertado2      ; Se atingiu a primeira parte do hidroavião, pula para o próximo tratamento

meiotermo11:
    jmp fragataa_acertada         ; Se atingiu a primeira parte da fragata, pula para o tratamento da fragata

meiotermo22:
    jmp encouraçadoo_acertado     ; Se atingiu a primeira parte do encouraçado, pula para o tratamento do encouraçado

    hidroaviãoo_acertado1:
    inc cont_Hidro1                ; Incrementa o contador de acertos do hidroavião 1
    cmp cont_Hidro1, 4              ; Compara o número de acertos com 4 (número total de partes do hidroavião 1)
    jne fim11                      ; Se o número de acertos for diferente de 4, vai para fim11 (não completou o naufrágio)
    lea dx, msgNaufragadoHidro      ; Carrega a mensagem de naufrágio do hidroavião 1
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp fimAcerto1                  ; Vai para fimAcerto1 após o naufrágio ser confirmado

    hidroaviãoo_acertado2:
    inc cont_Hidro2                ; Incrementa o contador de acertos do hidroavião 2
    cmp cont_Hidro2, 4              ; Compara o número de acertos com 4 (número total de partes do hidroavião 2)
    jne fimAcerto1                  ; Se o número de acertos for diferente de 4, vai para fimAcerto1 (não completou o naufrágio)
    lea dx, msgNaufragadoHidro      ; Carrega a mensagem de naufrágio do hidroavião 2
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída

fim11:
    jmp fimAcerto1                  ; Vai para fimAcerto1 para finalização do processo

    fragataa_acertada:
    inc cont_Fragata               ; Incrementa o contador de acertos da fragata
    cmp cont_Fragata, 3             ; Compara o número de acertos com 3 (número total de partes da fragata)
    jne fimAcerto1                  ; Se o número de acertos for diferente de 3, vai para fimAcerto1 (não completou o naufrágio)
    lea dx, msgNaufragadoFragata    ; Carrega a mensagem de naufrágio da fragata
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp fimAcerto1                  ; Vai para fimAcerto1 após o naufrágio ser confirmado

    encouraçadoo_acertado:
    inc cont_Encou                  ; Incrementa o contador de acertos do encouraçado
    cmp cont_Encou, 4               ; Compara o número de acertos com 4 (número total de partes do encouraçado)
    jne fimAcerto1                  ; Se o número de acertos for diferente de 4, vai para fimAcerto1 (não completou o naufrágio)
    lea dx, msgNaufragadoEncou      ; Carrega a mensagem de naufrágio do encouraçado
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp fimAcerto1                  ; Vai para fimAcerto1 após o naufrágio ser confirmado

continua11:
    jmp finalmente2                  ; Vai para finalmente2, que pode ser o final do processo de acerto

fimAcerto1:
    coor1:
        INC SI                       ; Incrementa o índice de coluna (SI)
        DEC DI                       ; Decrementa o índice de linha (DI)
        JNZ coor1                   ; Se DI for diferente de 0, continua o loop para ajustar a coordenada

    ADD BX, 21                      ; Ajusta a coordenada com 21 (possivelmente para mover para a próxima linha)
    MOV AL, contador_acertos        ; Carrega o número de acertos na variável AL
    CMP AL, 19                      ; Compara o número de acertos com 19 (total de partes de todos os navios)
    JNE QUASE11                    ; Se os acertos não forem 19, ainda existem navios para naufragar, então vai para QUASE11

    jmp finalmente2                  ; Se todos os navios foram atingidos, vai para finalmente2

QUASE11:
    MOV MUS[BX][SI], 31h            ; Marca a coordenada escolhida pelo jogador como acerto (muda para '1')
    CALL IMPRIME                    ; Chama a função para imprimir a matriz atualizada

    lea dx, msga                    ; Carrega a mensagem que avisa que um navio foi atingido
    IMPRI                           ; Exibe a mensagem

    PULA                            ; Chama a macro PULA para formatação de saída

    lea dx, MSG7                    ; Carrega a mensagem que pergunta se o jogador deseja continuar ou desistir
    IMPRI                           ; Exibe a mensagem

    mov ah, 1                       ; Prepara para ler um caractere do teclado
    int 21h                          ; Chama a interrupção 21h para ler o caractere

    cmp al, 53h                     ; Compara o caractere com 'S' (para continuar o jogo)
    je finalmente2                   ; Se 'S' for pressionado, vai para finalmente2 (finaliza o processo de acerto)

QUASE22:
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp AGAINN                     ; Retorna para o início do loop de acerto

finalmente2:
    RET                             ; Retorna da função, finalizando o processo de acerto
G2 ENDP 
G3 PROC
    PULA
    INICIOOO:
    CALL IMPRIME
    AGAINNN:
    lea dx,MSG6            ;REQUISITA COORDENADA DA LINHA
    IMPRI

    MOV AH,01              ;REQUISITA CARACTER
    INT 21h

    cmp al,41h             ;COMPARA COM 'A'
    jb INICIOOO

    cmp al,54h             ;COMPARA COM 'T'
    ja INICIOOO

    xor cx,cx              ;ZERA CONTADOR
    MOV DL, 41h            ;DL<--A
    xor DI,DI              ;ZERA SEGUNDO CONTADOR
    INC DI                 ;INCREMENTA DI
    L1111:
    CMP AL,DL              ;COMPARA ELEMENTO DIGITADO COM 'A' 
    JE LINHAAA               ;SE FOR IGUAL JUMP LINHA
    INC DI                 ;INCREMENTA DI
    INC DL                 ;DL = A-->B
    ADD CX,20              ;ACRESCENTA 20 EM CONTADOR PARA MOVER PARA PROXIMA LINHA
    JMP L1111                ;REINICIA LOOP ATE O ELEMENTA DIGITADOR FOR IGUAL A DL

    LINHAAA:                
    mov bx,cx              ;CONTADOR CX --> BX, O REGISTRADOR QUE MANIPULA A LINHA DA MATRIZ
    xor dx,dx              ;ZERA DX
    xor si,si              ;ZERA REGISTRADOR RESPONSAVEL PELAS COLUNAS DA MATRIZ
    PULA                   
    lea dx,MSG9            ;REQUISITA CARACTER EM LETRA PARA A COLUNA DESEJADA
    IMPRI 

    mov ah,01              ;REQUISITA CARACTER
    int 21h                ;EXECUTA

    cmp al,41h             ;COMPARA VALOR DIGITADO COM 'A'
    jb INICIOOO

    cmp al,54h             ;COMPARA VALOR DIGITADO COM 'B'
    ja INICIOOO

    mov dl,41h             ;DL <-- A
    xor cx,cx              ;ZERA CONTADOR CX

    L2222:
    CMP AL,DL              ;COMPARA VALOR DIGITADO COM 'A'
    JE colunaaa              ;SE FOR IGUAL JUMP COLUNA
    INC DL                 ;DL= 'A'-->'B'
    inc cx                 ;INCREMENTA CONTADOR CX
    JMP L2222                ;REINICIA ATE VALOR DIGITADO PELO USUARIO FOR IGUAL A DL

    colunaaa:
    mov si,cx              ;CX-->SI, REGISTRADOR RESPONSAVEL PELA MANIPULACAO DE COLUNAS
    xor dx,dx              ;ZERA DX
    PULA
    PULA
    cmp MWW3 [BX][SI],0    ;COMPARA CORDENADA ESCOLHIDA PELO USUARIO COM 0 (TIRO NA AGUA)
    jne acertooo             ;SE FOR DIFERENTE JUMP ACERTO (NAO EH AGUA,LOGO EH UM NAVIO)
    PULA

    corrr:                   ;LOOP PARA OBTER VALOR DA COLUNA DESEJADA DA MATRIZ 21X21        
    INC SI                 ;INCREMENTA REGISTRADOR DE MANIPULACAO DE COLUNA EM 1
    DEC DI                 ;DECREMENTA DI EM 1
    JNZ corrr                ;SE DI FOR DIFERENTE DE 0, REINICIAR LOOP 'COR'
    ADD BX,21              ;INCREMENTA EM BX 21, PARA OBTER VALOR DA LINHA DESEJADA DA MATRIZ 21X21
    MOV MUS[BX][SI],'*'    ;COORDENADA OBTIDA ACIMA RECEBE '*' (TIRO NA AGUA)
    CALL IMPRIME           ;IMPRIME MATRIZ 21X21
    lea dx,msge            ;IMPRIME MENSAGEM QUE ALERTA O ERRO AO ALVO PARA O USUARIO
    IMPRI                  
    PULA

    lea dx,MSG7            ;MENSAGEM QUE PERGUNTA SE USUARIO DESEJA DESISTIR OU CONTINUAR
    IMPRI

    mov ah,1               ;REQUISITA CARACTER
    int 21h                ;EXECUTA

    cmp al,53h             ;COMPARA COM 'S'
    je continuaaa            ;SE FOR IGUAL JUMP CONTINUA

    JMP QUASE222             ;QUASE2 =PULA E JUMP --> AGAIN

    continuaaa:              ;JMP CONTINUA -->CONTINUA11 -->FINALMENTE
    jmp continua111

    acertooo:                ;COORDENA DIGITADA EH DIFERENTE DE 0
    INC contador_acertos   ;INCREMENTA CONTADOR GERAL DOS NAVIOS

     ; Identifique o tipo de navio e incremente o contador correto
    cmp MWW3[BX][SI], 1   ;SE CORDENADA FOR IGUAL A 1, O HIDROAVIAO FOI ATINGIDO
    je jmpl222 
    jmp hidroaviao222
    jmpl222:
    jmp hidroaviãooo_acertado1

    hidroaviao222:
    cmp MWW3[BX][SI], 2  ;SE CORDENADA FOR IGUAL A 2, O HIDROAVIAO2 FOI ATINGIDO
    je meiotermo000

    cmp MWW3[BX][SI], 3  ;SE CORDENADA FOR IGUAL A 3, A FRAGATA FOI ATINGIDA
    je meiotermo111

    cmp MWW3[BX][SI], 4  ;SE CORDENADA FOR IGUAL A 4, O ENCOURACADO FOI ATINGIDO
    je meiotermo222

    cmp MWW3[BX][SI], 5  ;SE CORDENADA FOR IGUAL A 5, O SUBMARINO FOI ATINGIDO
    je submarinooo_acertado1

    cmp MWW3[BX][SI], 6  ;SE CORDENADA FOR IGUAL A 6, O SUBMARINO2 FOI ATINGIDO
    je submarinooo_acertado2
    
    submarinooo_acertado1:
    inc cont_Submarino1            ; Incrementa o contador de acertos do submarino 1
    cmp cont_Submarino1, 2          ; Compara o número de acertos com 2 (número total de partes do submarino 1)
    jne jmpl333                     ; Se o número de acertos for diferente de 2, pula para jmpl333 (não completou o naufrágio)
    jmp continuuu                   ; Se o número de acertos for igual a 2, vai para continuuu (naufrágio confirmado)
jmpl333:
    jmp fim111                      ; Se o naufrágio não foi completado, vai para fim111, continuando o jogo sem mensagem de naufrágio
continuuu:
    lea dx, msgNaufragadoSub        ; Carrega a mensagem de naufrágio do submarino 1
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp fimAcerto2                  ; Vai para fimAcerto2 após o naufrágio ser confirmado

    submarinooo_acertado2:
    inc cont_Submarino2            ; Incrementa o contador de acertos do submarino 2
    cmp cont_Submarino2, 2          ; Compara o número de acertos com 2 (número total de partes do submarino 2)
    jne fim111                      ; Se o número de acertos for diferente de 2, vai para fim111 (não completou o naufrágio)
    lea dx, msgNaufragadoSub        ; Carrega a mensagem de naufrágio do submarino 2
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp fimAcerto2                  ; Vai para fimAcerto2 após o naufrágio ser confirmado

meiotermo000:
    jmp hidroaviãooo_acertado2      ; Se atingiu a primeira parte do hidroavião, pula para o próximo tratamento

meiotermo111:
    jmp fragataaa_acertada         ; Se atingiu a primeira parte da fragata, pula para o tratamento da fragata

meiotermo222:
    jmp encouraçadooo_acertado     ; Se atingiu a primeira parte do encouraçado, pula para o tratamento do encouraçado

    hidroaviãooo_acertado1:
    inc cont_Hidro1                ; Incrementa o contador de acertos do hidroavião 1
    cmp cont_Hidro1, 4              ; Compara o número de acertos com 4 (número total de partes do hidroavião 1)
    jne fim111                      ; Se o número de acertos for diferente de 4, vai para fim111 (não completou o naufrágio)
    lea dx, msgNaufragadoHidro      ; Carrega a mensagem de naufrágio do hidroavião 1
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp fimAcerto2                  ; Vai para fimAcerto2 após o naufrágio ser confirmado

    hidroaviãooo_acertado2:
    inc cont_Hidro2                ; Incrementa o contador de acertos do hidroavião 2
    cmp cont_Hidro2, 4              ; Compara o número de acertos com 4 (número total de partes do hidroavião 2)
    jne fimAcerto2                  ; Se o número de acertos for diferente de 4, vai para fimAcerto2 (não completou o naufrágio)
    lea dx, msgNaufragadoHidro      ; Carrega a mensagem de naufrágio do hidroavião 2
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída

fim111:
    jmp fimAcerto2                  ; Vai para fimAcerto2 para finalização do processo

    fragataaa_acertada:
    inc cont_Fragata               ; Incrementa o contador de acertos da fragata
    cmp cont_Fragata, 3             ; Compara o número de acertos com 3 (número total de partes da fragata)
    jne fimAcerto2                  ; Se o número de acertos for diferente de 3, vai para fimAcerto2 (não completou o naufrágio)
    lea dx, msgNaufragadoFragata    ; Carrega a mensagem de naufrágio da fragata
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp fimAcerto2                  ; Vai para fimAcerto2 após o naufrágio ser confirmado

    encouraçadooo_acertado:
    inc cont_Encou                  ; Incrementa o contador de acertos do encouraçado
    cmp cont_Encou, 4               ; Compara o número de acertos com 4 (número total de partes do encouraçado)
    jne fimAcerto2                  ; Se o número de acertos for diferente de 4, vai para fimAcerto2 (não completou o naufrágio)
    lea dx, msgNaufragadoEncou      ; Carrega a mensagem de naufrágio do encouraçado
    IMPRI                           ; Exibe a mensagem de naufrágio
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp fimAcerto2                  ; Vai para fimAcerto2 após o naufrágio ser confirmado

continua111:
    jmp finalmente3                  ; Vai para finalmente3, que pode ser o final do processo de acerto

fimAcerto2:
    coor11:
        INC SI                       ; Incrementa o índice de coluna (SI)
        DEC DI                       ; Decrementa o índice de linha (DI)
        JNZ coor11                   ; Se DI for diferente de 0, continua o loop para ajustar a coordenada

    ADD BX, 21                      ; Ajusta a coordenada com 21 (possivelmente para mover para a próxima linha)
    MOV AL, contador_acertos        ; Carrega o número de acertos na variável AL
    CMP AL, 19                      ; Compara o número de acertos com 19 (total de partes de todos os navios)
    JNE QUASE111                    ; Se os acertos não forem 19, ainda existem navios para naufragar, então vai para QUASE111

    jmp finalmente3                  ; Se todos os navios foram atingidos, vai para finalmente3

QUASE111:
    MOV MUS[BX][SI], 31h            ; Marca a coordenada escolhida pelo jogador como acerto (muda para '1')
    CALL IMPRIME                    ; Chama a função para imprimir a matriz atualizada

    lea dx, msga                    ; Carrega a mensagem que avisa que um navio foi atingido
    IMPRI                           ; Exibe a mensagem

    PULA                            ; Chama a macro PULA para formatação de saída

    lea dx, MSG7                    ; Carrega a mensagem que pergunta se o jogador deseja continuar ou desistir
    IMPRI                           ; Exibe a mensagem

    mov ah, 1                       ; Prepara para ler um caractere do teclado
    int 21h                          ; Chama a interrupção 21h para ler o caractere

    cmp al, 53h                     ; Compara o caractere com 'S' (para continuar o jogo)
    je finalmente3                   ; Se 'S' for pressionado, vai para finalmente3 (finaliza o processo de acerto)

QUASE222:
    PULA                            ; Chama a macro PULA para formatação de saída
    jmp AGAINNN                     ; Retorna para o início do loop de acerto

finalmente3:
    RET                             ; Retorna da função, finalizando o processo de acerto
G3 ENDP

IMPRIME PROC                  ; INICIA PROCEDIMENTO IMPRIME
    XOR DX,DX                 ; ZERA DX PARA REALIZAR O PROCEDIMENTO IMPRIME
    XOR BX,BX                 ; ZERA BX, usado como índice para a linha
    MOV DI,21                 ; MOVE DI PARA 21 (20 LINHAS, DI controle de linha)
L3:            
    MOV CX,21                 ; MOVE CX PARA 21 (21 COLUNAS, CX controle de coluna)
    MOV AH,02                 ; FUNÇÃO DO DOS PARA IMPRIMIR UM CARACTERE
    MOV DL,' '                ; MOV DL COM ESPAÇO (para imprimir espaço no início da linha)
    INT 21h                   ; Chama a interrupção para imprimir o caractere
    XOR SI,SI                 ; ZERA SI (contagem de colunas, para usar como índice)
L4:     
        MOV DL,MUS[BX][SI]    ; MOV VALOR DA MATRIZ DO USUÁRIO PARA DL (DL recebe o valor da matriz)
        CMP DL,9              ; Compara o valor de DL com 9 (verifica se é um caractere numérico)
        JA letraa             ; Se DL for maior que 9, vai para 'letraa' (caso de caracteres)
        OR DL,30H             ; Transforma o valor em número (conversão para ASCII, por exemplo 1 vira '1')
        INT 21h               ; Imprime o caractere no console
        MOV DL,' '            ; Em seguida, prepara para imprimir um espaço
        INT 21h               ; Imprime o espaço
        INC SI                ; Incrementa SI para passar para a próxima coluna da matriz
        LOOP L4               ; Repeats the loop until CX reaches 0 (imprime todos os valores das colunas)
    ADD BX,21                 ; Adiciona 21 a BX para passar para a próxima linha da matriz
    PULA                       ; Chama uma macro que realiza o salto de linha (aqui uma macro de formatação)
    DEC DI                     ; Decrementa DI para contar as linhas impressas
    JNZ L3                     ; Se DI não for 0, repete o loop (imprime mais linhas)
    JMP fimA                   ; Se todas as linhas foram impressas, vai para o final da função
    letraa:                    ; Rótulo para tratar caracteres que não são numéricos
    INT 21h                    ; Chama a interrupção para imprimir o caractere (se for letra ou outro símbolo)
    MOV DL,' '                 ; Prepara para imprimir um espaço após a letra
    INT 21h                    ; Imprime o espaço
    INC SI                     ; Incrementa SI para a próxima coluna
    LOOP L4                    ; Repete até imprimir todas as colunas
    ADD BX,21                  ; Adiciona 21 a BX para passar para a próxima linha
    PULA                       ; Chama a macro PULA para pular uma linha
    DEC DI                     ; Decrementa DI para contar as linhas
    JNZ L3                     ; Se DI não for 0, repete o processo
    fimA:                       ; Rótulo para finalizar o procedimento IMPRIME
    RET                         ; Retorna para o programa principal
IMPRIME ENDP                   ; Finaliza o procedimento IMPRIME

ZERAR PROC                    ; INICIA O PROCEDIMENTO ZERAR
    XOR DX,DX                 ; ZERA DX PARA INICIAR O PROCEDIMENTO
    XOR BX,BX                 ; ZERA BX (usado como índice de linha)
    MOV DI,21                 ; MOVE DI PARA 21 (21 LINHAS)
Z3:            
    MOV CX,21                 ; MOVE CX PARA 21 (21 COLUNAS)
    XOR SI,SI                 ; ZERA SI (índice da coluna)
    XOR AX,AX                 ; ZERA AX (preparação para manipular dados na matriz)
Z4:     
        MOV DL,MUS[BX][SI]    ; MOV VALOR DA MATRIZ DO USUÁRIO PARA DL
        CMP DL,39H            ; Compara DL com o valor 39h (verifica se DL é maior que 39h, provavelmente um limite)
        JA letraZ             ; Se DL for maior que 39h, vai para 'letraZ'
        MOV MUS[BX][SI],AL    ; Se for dentro do limite, zera a posição da matriz (A = 00h)
        INC SI                ; Incrementa SI para passar para a próxima coluna
        LOOP Z4               ; Repeats until CX reaches 0 (zerar todas as colunas)
    ADD BX,21                 ; Adiciona 21 a BX para passar para a próxima linha
    PULA                       ; Chama a macro PULA para pular para a próxima linha
    DEC DI                     ; Decrementa DI para contar as linhas processadas
    JNZ Z3                     ; Se DI não for 0, repete o processo para a próxima linha
    JMP fimZ                   ; Se todas as linhas foram processadas, vai para o final da função
    letraZ:                    ; Rótulo para tratar a situação onde o valor em DL é maior que 39h
    INC SI                     ; Incrementa SI
    LOOP Z4                    ; Repeats the loop to continue processing the columns
    ADD BX,21                  ; Adiciona 21 a BX para pular para a próxima linha
    PULA                       ; Chama a macro PULA para pular uma linha
    DEC DI                     ; Decrementa DI para contar as linhas
    JNZ Z3                     ; Se DI não for 0, repete o loop de linha
    fimZ:                       ; Rótulo para finalizar o procedimento ZERAR
    RET                         ; Retorna ao programa principal
ZERAR ENDP                     ; Finaliza o procedimento ZERAR
END MAIN                       ; Finaliza o código principal do programa
