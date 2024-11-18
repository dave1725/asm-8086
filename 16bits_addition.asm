org 100h
       
; Addition of two 8-bit numbers

; Define two 8-bit numbers: 36 and 41
n1 db 24h
n2 db 29h

start:
    mov al,n1
    add al,n2
    ; added value is now in AL
    
    ; then let's save the result for display in a base register bl
    mov bl,al                                                    
    
    ; now let's convert the upper nibble of AL to a character for display
    mov ah,al
    and ah,0F0h ; 240 => mask => 1111 0000
    shr ah,4    ; shift right by 4 to get only the upper nibble
    add ah,48   ; convert it to ASCII                                                  
    cmp ah,39h  ; check if value is in 0-7 range
    jle print_first_digit
    add ah,7    ; if not in 0-7 convert to ASCII(A-F)
    
print_first_digit:
    mov dl, ah  ; move first digit to DL for printing
    mov ah, 02h ; display opcode
    int 21h     ; 21h interrupt to execute op
    
    ; convert lower nibble of AL
    
    mov ah,bl
    and ah,0Fh
    add ah,48
    cmp ah,39h
    jle print_second_digit
    add ah,7
    
print_second_digit:
    mov dl,ah
    mov ah, 02h
    int 21h
    
    ; end of program
    mov ah,4Ch
    int 21h


    
    
    
    
    