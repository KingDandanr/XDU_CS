TITLE Count the Character 'A' in Memory

CODE SEGMENT
    ASSUME CS:CODE

main PROC
START:
    MOV dx, 4000H
    MOV ds, dx
    
    ; generate some samples of 'A' 
    MOV si, 0
    MOV cx, 50H
L1:
    MOV [si], 'A'
    ADD si, 2
    LOOP L1

    ; count the number of 'A'
    MOV cx, 4000H
    MOV si, 0
    MOV dx, 0
L2:
    MOV al, [si]
    CMP al, 'A'
    JNE NEXT
    INC dx
NEXT:
    INC si
    LOOP L2
    MOV ah, 4Ch  ; exit program
    INT 21h
main ENDP
CODE ENDS
END START

