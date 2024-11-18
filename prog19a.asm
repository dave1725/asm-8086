; to print numbers form 0 to 9

org 100h

jmp start

start:
    xor cx,cx
    mov cx,10
    mov al,'0'
    
loop_digits:
    ; counter is handled implicitly
    ; implicit behaviour is to be decreased
    ; so it works
    mov dl,al
    mov ah,02h
    int 21h
    inc al
    loop loop_digits

    

