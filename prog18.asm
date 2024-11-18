; to check whether a single-digit number is odd or even

org 100h

jmp start

msg:
    db "Enter a digit: $",24h
opmsg1:
    db 0Dh,0Ah,"It's even$",24h
opmsg2:
    db 0Dh,0Ah,"It's odd$",24h
    

    
start:
    ; display msg
    mov dx,msg
    mov ah,09h
    int 21h
    
    ; take input
    mov ah,01h
    int 21h
    sub al,'0'
    
    and al,1
    jz even
    
odd:
    mov dx,opmsg2
    mov ah,09h
    int 21h
    mov ah,4Ch
    int 21h

even:
    mov dx,opmsg1
    mov ah,09h
    int 21h
    
    mov ah,4Ch
    int 21h
    ret
    
    
    
    
    
    