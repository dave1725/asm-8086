data segment  
    a db 04
    b db 02

ends


code segment  
    assume cs:code, ds:data
start:     
    mov ax,data
    mov ds,ax
    mov al, a
    mov bl,b
    add al,bl
    mov dl,al
    add dl,48
    mov ah,2h
    int 21h

ends

end start
