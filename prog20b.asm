; to print a-z

org 100h

jmp start

start:
    xor cx,cx
    mov cx,26
    mov al,'A'
    
loop_alpha:
    mov dl,al
    mov ah,02h
    int 21h
    inc al
    loop loop_alpha
    
    mov ah,4Ch
    int 21h 
    
    