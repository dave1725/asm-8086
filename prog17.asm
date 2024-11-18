; to take two single-digit numbers as input 
; and check if they are equal

org 100h

jmp start

msg1:    
    db "Enter digit1: $",24h
msg2:
    db 0Dh,0Ah,"Enter digit2: $",24h
opmsg1:
    db 0Dh,0Ah,"They are equal$",24h 
opmsg2:
    db 0Dh,0Ah,"They are not equal$",24h

    
a db 0
b db 0
res db 0


start:
    ; display msg1
    mov dx,msg1
    mov ah,09h
    int 21h
    
    ; take digit1
    mov ah,01h
    int 21h
    sub al,'0'
    mov [a],al
    
    ; display msg2
    mov dx,msg2
    mov ah,09h
    int 21h
    
    ; take digit2
    mov ah,01h
    int 21h
    sub al,'0'
    mov [b],al
    
    mov al,[a]
    mov bl,[b]
    
    cmp al,bl
    je equal 
    
    ; display opmsg2
    mov dx,opmsg2
    mov ah,09h
    int 21h
    
    mov ah,4Ch
    int 21h
    ret

equal:
    mov dx,opmsg1
    mov ah,09h
    int 21h
    
    mov ah,4Ch
    int 21h
    