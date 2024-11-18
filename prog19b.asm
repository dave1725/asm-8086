; to print a-z in reverse order

org 100h

jmp start

start:
    xor cx,cx
    mov cx,26
    mov al,'Z'
    
loop_alpha:  
    mov dl,al
    mov ah,02h
    int 21h
    dec al
    loop loop_alpha
    
    mov ah,4Ch
    int 21h
    