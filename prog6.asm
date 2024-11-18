; subtraction of 16-bit numbers

org 100h

jmp start

num1 dw 1500
num2 dw 2566
result dw 0

msg:
    db "Result is: $",0Dh,0Ah,24h
neg_msg:
    db "-$",24h
    
start:
    ; perform subtraction
    mov ax,[num1]        
    sub ax,[num2]        
    
    mov [result],ax
    
    push ax 
    
    ; display msg
    lea dx,msg
    mov ah,09h
    int 21h
    
    pop ax
    
    ; check for negative difference
    ; we will check by seeing the sign flag(MSB)
    test ax,8000h
    jz positive_diff
    
    ; if negative diff  
    ; print the negative symbol
    lea dx,neg_msg
    mov ah,09h
    int 21h
    
    mov ax,[result]
    
    ; extract positive result with 2s complement
    neg ax
    mov [result],ax

positive_diff:
    ; convert result to decimal
    call print_decimal
    
    xor ah,ah
    int 16h
    ret
    
print_decimal:
    push ax
    xor cx,cx
    mov bx,10

convert_loop:    
    xor dx,dx
    ; q stored in ax and r stored in dx
    div bx
    push dx
    inc cx
    ; check if q is zero, loop until q is zero
    test ax,ax 
    jnz convert_loop
    
print_digits:
    pop dx
    add dl,'0'
    mov ah,02h
    int 21h
    loop print_digits 
    
    pop ax
    
    ret
end start
    
    
    
    
    
    
    
    
    