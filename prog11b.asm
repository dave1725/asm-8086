; to convert upper to lower case letter

org 100h

jmp start

prompt:
    db "Enter a lowercase letter: $"
newline:
    db 0Dh,0Ah  
msg:
    db "Not a lowercase letter!$"


start:                              
    lea dx,prompt
    mov ah,09h
    int 21h
    
    ; read input
    mov ah,01h
    int 21h
    
    ; input stored in al
    cmp al,'a'
    jb not_lower
    cmp al,'z'  
    ja not_lower
    
    sub al,20h      ; we are subtracting 32 to get the upper case
    
not_lower: 
    mov dl,al
    mov ah,02h
    int 21h
    
    mov ah,4Ch
    int 21h
    ret
    
    