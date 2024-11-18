; print a character on screen

org 100h

jmp start

start:
    mov dl,'A'
    mov ah,02h
    int 21h
    
    mov ah,4Ch
    int 21h
    ret