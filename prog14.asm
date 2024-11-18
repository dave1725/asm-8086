; to take two single-digit numbers from user and print subtraction of it

org 100h

jmp start

msg1:
    db "Enter digit1: $",24h
msg2:
    db 0Dh,0Ah,"Enter digit2: $",24h
opmsg:
    db 0Dh,0Ah,"The result is: $",24h     
neg_symbol:
    db "-$",24h
    
a db 0
b db 0
res db 0

start:
    ; display msg1
    lea dx,msg1
    mov ah,09h
    int 21h
    
    ; take input a
    mov ah,01h
    int 21h
    
    sub al,'0'
              
    ; store res in a
    mov [a],al   
    
    ; dislay msg2
    lea dx,msg2
    mov ah,09h
    int 21h   
    
    ; take input b
    mov ah,01h
    int 21h 
    
    sub al,'0'
    
    ; store res in b
    mov [b],al  
    
    ; disply opmsg
    mov dx,opmsg
    mov ah,09h
    int 21h
         
    ; subtraction
    mov al,[a]
    sub al,[b]
    mov [res],al
    
    test al,80h
    jnz neg_res
    
    
    mov dl,[res]
    add dl,'0'
    mov ah,02h
    int 21h
    
    mov ah,4Ch
    int 21h
    
    
neg_res: 
    neg al 
    push ax
    
    mov dx,neg_symbol
    mov ah,09h
    int 21h
    pop ax
    
    mov dl,al
    add dl,'0'
    mov ah,02h
    int 21h
    
    
    

   
