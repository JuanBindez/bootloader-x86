[BITS 16]
[ORG 0x7C00]

start:
    ; Inicializa os registradores e a pilha
    cli                    ; Desabilita interrupções
    xor ax, ax             ; Zera o registrador AX
    mov ds, ax             ; Configura o segmento de dados para 0
    mov es, ax             ; Configura o segmento extra para 0
    mov ss, ax             ; Configura o segmento de pilha para 0
    mov sp, 0x7C00         ; Configura o ponteiro de pilha para 0x7C00
    sti                    ; Habilita interrupções

    ; Imprime a mensagem na tela
    mov si, msg            ; Aponta SI para o início da mensagem

print_loop:
    lodsb                  ; Carrega o próximo byte da mensagem em AL
    cmp al, 0              ; Verifica se é o byte nulo (fim da string)
    je hang                ; Se for nulo, pula para o loop infinito

    mov ah, 0x0E           ; Função de teletipo do BIOS (imprimir caractere)
    int 0x10               ; Interrompe para chamar a função do BIOS
    jmp print_loop         ; Repete o loop para o próximo caractere

hang:
    jmp hang               ; Entra em um loop infinito

msg db 'Hello, Bootloader!', 0

times 510-($-$$) db 0      ; Preenche o resto do setor com zeros
dw 0xAA55                  ; Assina de boot (0xAA55)
