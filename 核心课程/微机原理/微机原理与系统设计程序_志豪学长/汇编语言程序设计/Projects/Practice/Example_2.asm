TITLE Sorting the array from DATA

DATA SEGMENT       
    ;  data array taking example of 1-100
    random_data DB 64H, 63H, 62H, 61H, 60H, 5FH, 5EH, 5DH, 5CH, 5BH
               DB 5AH, 59H, 58H, 57H, 56H, 55H, 54H, 53H, 52H, 51H, 50H
               DB 4FH, 4EH, 4DH, 4CH, 4BH, 4AH, 49H, 48H, 47H, 46H, 45H
               DB 44H, 43H, 42H, 41H, 40H, 3FH, 3EH, 3DH, 3CH, 3BH, 3AH
               DB 39H, 38H, 37H, 36H, 35H, 34H, 33H, 32H, 31H, 30H, 2FH
               DB 2EH, 2DH, 2CH, 2BH, 2AH, 29H, 28H, 27H, 26H, 25H, 24H
               DB 23H, 22H, 21H, 20H, 1FH, 1EH, 1DH, 1CH, 1BH, 1AH, 19H
               DB 18H, 17H, 16H, 15H, 14H, 13H, 12H, 11H, 10H, 0FH, 0EH
               DB 0DH, 0CH, 0BH, 0AH, 09H, 08H, 07H, 06H, 05H, 04H, 03H, 02H, 01H

DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA

main PROC
START:
    MOV ax, DATA        ; Intialize DS to Data segment
    MOV ds, ax

    MOV di, OFFSET random_data
    MOV bl, 99
NEXT1:
    MOV si, di
    MOV cl, bl
NEXT2:
    MOV al, [si]     ; get the first number for comparison
    INC si
    CMP al, [si]     ; compare
    JBE NEXT3        ; if the first number is less than or equal to the second, then jump
    XCHG [si], al    ; if the first number is greater than the second, then swap
    MOV [si-1], al

NEXT3:
    DEC cl          ; decided one number
    JNZ NEXT2
    DEC bl
    JNZ NEXT1

    ;  Print the sorted array
    MOV cx, 100
    MOV si, di     ;get the first address
    XOR dx, dx
L1:
    MOV dl, [si]
    INC si

    MOV bh, dl      ; print the four higher bites
    AND dl, 0F0H
    MOV bl, cl
    MOV cl, 4
    SHR dl, cl
    ADD	dl, 30H
    MOV ah, 02H
	INT	21H
    
    MOV dl, bh      ; print the four lower bites
    AND dl, 0FH
    ADD	dl, 30H
    MOV ah, 02H
	INT	21H

    MOV	dl, 20H     ; print the empty character
    MOV ah, 02H
	INT	21H
    MOV cl, bl
    Loop L1

MOV ah, 4Ch  ; exit program
INT 21h

main ENDP
CODE ENDS
END START