[org 0x7C00]  ; O bootloader é carregado na memória em 0x7C00

start:
    cli             ; Desabilita interrupções
    xor ax, ax      ; Zera o registrador AX
    mov ds, ax      ; Zera o registrador DS (Data Segment)
    mov es, ax      ; Zera o registrador ES (Extra Segment)

    ; Configura o modo de vídeo para texto 80x25
    mov ah, 0x00    ; Função para definir modo de vídeo
    mov al, 0x03    ; Modo de texto 80x25
    int 0x10        ; Interrupção de vídeo

    ; Imprime uma mensagem na tela
    mov si, msg     ; Carrega o endereço da mensagem em SI
    call print_string

    ; Loop infinito
    hlt
    jmp $

print_string:
    lodsb           ; Carrega o próximo caractere de SI em AL
    or al, al       ; Verifica se AL é zero (fim da string)
    jz done         ; Se for zero, termina a impressão
    mov ah, 0x0E    ; Função para imprimir caractere na tela
    int 0x10        ; Interrupção de vídeo
    jmp print_string ; Repete para o próximo caractere
done:
    ret

msg db 'Hello, World!', 0  ; Mensagem a ser impressa

times 510-($-$$) db 0  ; Preenche o restante do setor com zeros
dw 0xAA55              ; Assinatura de boot (magic number)