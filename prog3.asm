; addition of two 8 bit numbers 
; with overflow handling

org 100h ;256  

jmp start

num1 db 25
num2 db 17
result db  0

msg:
    db "The sum is:$",0Ah,0Dh,24h
    
omsg:
    db "overflow occurred $",0Ah,0Dh,24h
    
start:        
    xor ah,ah
    
    ; adding the two 8bit numbers
    mov al, [num1]
    add al, [num2]
    jc overflow
    
    ; if no overflow
    mov [result],al
    
    ; display message
    lea dx,msg
    mov ah,09h          ;DOS function to display string
    int 21h             ;DOS interrupt to print the message
    
    ; display result as two digit decimal   
    ; we are dividing the number by 10 so the q will tens place
    ; and r will be the ones place
    mov al,[result]
    mov ah,0
    mov bl,10
    
    div bl ; divides al by bl
    ; AL will store q and AH will store r 
    push ax
    
    ; Display tens place
    add al,'0'          ;convert to ASCII
    mov dl,al
    mov ah,02h          ;DOS function to display character
    int 21h             ;DOS interrupt to print
    
    ; Display ones place   
    pop ax
    mov al,ah
    add al,'0'
    mov dl,al
    mov ah,02h          ;DOS function to display character
    int 21h
    
    ; Wait for key press before exiting
    mov ah,0
    int 16h             ; BIOS interrupt - Wait for key press
    ret                 ; Return control to DOS
    
    
    
overflow: 
    mov ah,09h
    lea dx,omsg
    int 21h
    
    mov ah,0
    int 16h
    ret  
    
end start



    
    
    
    
    
    
    
    