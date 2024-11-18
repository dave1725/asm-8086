; to perform subtraction of two 8bit numbers

org 100h

jmp start

num1 db 30
num2 db 50

result db 0

msg:
    db "Result is: $",0Dh,0Ah,24h
neg_msg:
    db "-$",24h

start:
    ; perform subtraction
    mov al,[num1]
    sub al,[num2]
    
    mov [result],al
    
    ; check if result is negative 
    ; we check by seeing the sign bit
    test al,80h         ; test performs bitwise AND, 80h is mask(1000 0000)
    jz positive_result     ; positive result
    
    ; if negative result
    ; display - sign
    lea dx,neg_msg
    mov ah,09h
    int 21h
    
    ; convert to positive
    ; 2s complement
    neg al
    
positive_result:
    ; convert result into decimal
    xor ah,ah
    mov bl,10
    div bl
    ; AL has q and AH has r
    push ax 
    
    ; print tens place
    add al,'0'
    mov dl,al
    mov ah,02h
    int 21h
    
    ; print ones place
    pop ax
    mov al,ah
    add al,'0'
    mov dl,al
    mov ah,02h
    int 21h
    
    xor ah,ah
    int 16h             ;BIOS interrupt
    ret