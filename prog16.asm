; to take two single digits
; perform addition of them

org 100h

jmp start

msg1:
    db "Enter digit1: $",24h
msg2:
    db 0Dh,0Ah,"Enter digit2: $",24h
opmsg:
    db 0Dh,0Ah,"The result is: $",24h
    
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
    
    ; display opmsg
    mov dx,opmsg
    mov ah,09h
    int 21h
    
    ; addition
    mov al,[a]
    add al,[b]
    mov [res],al 
    
    mov dl,al
    add dl,'0'
    mov ah,02h
    int 21h
    ret
    
    


