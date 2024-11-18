; to print numbers 0 to 9 in reverse order

org 100h

jmp start

start:
    xor cx,cx
    mov cx,10
    mov al,'9'
    
loop_digits:
    mov dl,al
    mov ah,02h
    int 21h
    dec al
    loop loop_digits
    
    mov ah,4Ch
    int 21h
    