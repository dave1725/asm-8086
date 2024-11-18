; to perform 8-bit multiplication

org 100h    

jmp start

num1 db 50
num2 db 200
result db 0

msg:
    db "The result is: $",0Dh,0Ah,24h
omsg:
    db "Overflow Occurred!$",0Dh,0Ah,24h
    
start: 
    ; display message
    lea dx,msg
    mov ah,09h
    int 21h 
    
    ; perform multiplication
    mov al,[num1]
    mov bl,[num2]
    mul bl          ; result stored in AX (unsigned multiplication)
    
    call print_result
    xor ah,ah
    int 16h
    ret
    

print_result:
    push ax
    xor cx,cx
    mov bx,10
    
extract_loop:
    ; we need ax(q) and dx(r)
    xor dx,dx
    div bx
    push dx
    inc cx
    test ax,ax
    jnz extract_loop
    
print_digits:
    pop dx
    add dl,'0'
    mov ah,02h
    int 21h
    loop print_digits
    
    pop ax
    ret
    
end start
    

    
    
