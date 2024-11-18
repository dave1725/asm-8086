; to take a single-digit integer and print on-screen

org 100h

jmp start

msg:
    db "Enter digit: $",24h
opmsg:
    db 0Dh,0Ah,"You entered: $",24h
    
; no need for buffer input
; ip directly stored in al

start:
    ; display msg
    lea dx,msg
    mov ah,09h
    int 21h
    
    ; take input
    mov ah,01h
    int 21h
    
    push ax
    
    ; display opmsg
    lea dx,opmsg
    mov ah,09h
    int 21h
    
    pop ax
    
    ; display result
    mov dl,al
    mov ah,02h
    int 21h
    
    mov ah,4Ch
    int 21h
    ret
