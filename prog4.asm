; addition of two 16-bit numbers

org 100h

jmp start

num1 dw 500
num2 dw 40
result dw 0

msg:
    db "The result is: $",0Ah,0Dh,24h
omsg:
    db "Overflow Occurred!$",0Ah,0Dh,24h
    
start:    
    ; adding two numbers
    mov ax,[num1]
    add ax,[num2]
    jc overflow
    
    ; if no overflow
    mov [result],ax
    
    ; Display message
    lea dx,msg
    mov ah,09h
    int 21h
    
    mov ax,[result]
    call print_decimal      ;subroutine to print AX in decimal
    
    xor ah,ah
    int 16h
    ret
    
overflow:
    ; display message
    lea dx,omsg
    mov ah,09h
    int 21h
    
    xor ah,ah
    int 16h
    ret

print_decimal:
    push ax
    xor cx,cx
    
print_loop:
    ;extract each digit from the most significant place
    mov bx,10
    xor dx,dx
    div bx      ; it divides AX/BX
    ; ax stores q and dx stores r
    push dx 
    inc cx
    test ax,ax
    jnz print_loop

print_digits:
    ; once each digit is extracted throug division
    ; we will pop them out to display
    pop dx
    add dl,'0'
    mov ah,02h
    int 21h
    loop print_digits
    
    pop ax
    ret
end start   
    