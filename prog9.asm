; perform 8-bit division
; display quotient and remainder in decimals

org 100h 

jmp start

num1 db 20
num2 db 5 

q db 0
r db 0

q_msg:
    db "The quotient is: $",0Dh,0Ah,24h
r_msg:
    db "The remainder is: $",24h
    
start:   
    xor ax,ax
    ; perform division
    mov al,[num1]
    mov bl,[num2]
    div bl            ; al will have q and ah will have r
    
    mov [q],al
    mov [r],ah 
    
    ; display quotient  
    lea dx,q_msg
    mov ah,09h
    int 21h
    
    mov al,[q]
    call print_decimal  
    
    ; display remainder
    lea dx,r_msg
    mov ah,09h
    int 21h 
    
    mov al,[r]
    call print_decimal
    
    xor ah,ah
    int 16h
    ret 
    
print_decimal:
    push ax
    xor cx,cx
    mov bx,10
    
extract_digits: 
    xor dx,dx
    div bx
    push dx
    inc cx
    test al,al
    jnz extract_digits
    
print_digits:
    pop dx
    add dl,'0'
    mov ah,02h
    int 21h
    loop print_digits
    
    pop ax
    ret
    
    
    
    
