; to convert lower-case to upper-case

org 100h

jmp start

msg:
    db "Enter a letter: $",0Dh,0Ah,24h
opmsg:
    db 0Dh,0Ah,"Lower to Upper: $",24h
               
; since it's a character we don't need buffer input
; we can directly store it in AL register

    
start:
    ; display msg
    lea dx,msg
    mov ah,09h
    int 21h
    
    ; take input
    mov ah,01h
    int 21h
    
    push ax         ; preserving ax
    
    ; display opmsg
    lea dx,opmsg
    mov ah,09h
    int 21h
                    ; retrieving ax again
    pop ax
    
    ; check for lower-case
    cmp al,'a'
    jb not_lower
    cmp al,'z'
    ja not_lower
    
    sub al,20h       ; 32 is the ASCII difference
    
not_lower:
    mov dl,al
    mov ah,02h
    int 21h
    
    mov ah,4Ch
    int 21h
    ret
                     
    
    