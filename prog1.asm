; org100h 
org 100h

jmp start
           
msg:
    db "Hello,World!",0Dh,0Ah,24h
    ;0Dh is for carriage return  
    ;0Ah is for 
    ;24h is for new line
 
start: 
    mov dx,msg
    mov ah,09h
    int 21h
    mov ah,0
    int 16h

ret