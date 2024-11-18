; to print multiple characters on screen

org 100h

jmp start

msg:
    db "Enter a string: $",0Dh,0Ah,24h
opmsg:
    db 0Dh,0Ah,"You entered: $",24h
buffer db 50

; buffer[0] stores max no.of characters allowed(50)
; buffer[1] updates no.of characters entered
; actual i/p starts from buffer+2

start:
    ; display msg
    lea dx,msg
    mov ah,09h
    int 21h
    
    ; take input
    mov ah,0Ah      ; dos function to buffer input
    lea dx,buffer
    int 21h         ;i/p fetched to buffer
    
    ; display opmsg
    lea dx,opmsg
    mov ah,09h
    int 21h
    
    ; display input string
    lea si,buffer+2     ; stack pointer points to start of string
    mov cl,[buffer+1]   ; counter(CL) points to no.of chars
    
print_loop:             ; here counter is handled implicitly
    lodsb               ; loads chrs one by one and updates SI
    mov dl,al
    mov ah,02h
    int 21h
    loop print_loop 
    
    mov ah,4Ch
    int 21h
    ret
    