DATA SEGMENT
    DBuffer DB 30 DUP(0)
    InputInfo DB 0DH, 0AH, '------------------------------------------------', 0DH, 0AH,'Please input the number in decimal format:', 0DH, 0AH, '> 1. The number must be less than or equal to 65535', 0DH, 0AH, '> 2. Enter q or Q to quit', 0DH, 0AH, '> Input number: ', '$'
    ErrorInfo DB 0DH, 0AH, 'Sorry, the character you input has wrong form!', 0DH, 0AH, '$'
    ResultInfo DB 'Decimal format to binary format:', 0DH, 0AH, '> Output number: ', '$'
    ExitInfo DB 0DH, 0AH, 'Congratulations, you have exit successful!', 0DH, 0AH, '$'
    StringInfo DB '------------------------------------------------', 0DH, 0AH, 'Please input the string to be detect:', 0DH, 0AH, '> Input string: ','$'
    SRInfo DB 0DH, 0AH, 'The number of digital characters in the string: ', '$'
    SBuffer DB 98, 99 DUP(0)
DATA ENDS

DSTACK SEGMENT STACK
    DW 500 DUP(?)
DSTACK ENDS

CODE SEGMENT
    ASSUME SS:DSTACK, DS:DATA, CS:CODE

main PROC
START:
    MOV AX, DATA
    MOV DS, AX
    JMP INITIAL

ERROR:
    MOV AH, 09H
    MOV DX, OFFSET ErrorInfo
    INT 21H

INITIAL:
    MOV AH, 09H
    MOV DX, OFFSET InputInfo
    INT 21H
    MOV DI, OFFSET DBuffer      ; initilize the memory
    MOV CX, 0H               ; the length of number

INPUT:
    MOV AH, 01H
    INT 21H

    CMP AL, 0DH        ; detect if it is a carriage return
    JE TRANSFORM
    CMP AL, 'Q'
    JE FINAL
    CMP AL, 'q'
    JE FINAL
    CMP AL,'0'
    JB ERROR
    CMP AL, '9'
    JA ERROR
    CMP CX, 5        ; CX: 0-4
    JAE ERROR

    MOV [DI], AL     ; store the right digital character
    INC DI
    INC CX
    JMP INPUT

TRANSFORM:
    CMP CX, 0       ; if no digital character is input
    JE ERROR

    MOV DI, OFFSET DBuffer     ; initialize
    MOV AX, 0
    MOV BX, 10

LEAP:
    MUL BX
    CLC
    ADD AL, [DI]
    ADC AH, 0
    SUB AX, 30H             ; transform the ascii code to the number
    
    INC DI
    DEC CX
    JNZ LEAP

PUTRESULT:
    PUSH AX
    MOV AH, 09H
    MOV DX, OFFSET ResultInfo
    INT 21H
    POP AX

    MOV CX, 0004H

OUTPUT:
    PUSH CX
    MOV CL, 4
    ROL AX, CL
    POP CX

    MOV DL, AL
    AND DL, 0FH
    ADD DL, 30H

    CMP DL, ':'
    JB NO
    ADD DL, 07H
NO:
    PUSH AX
    MOV AH, 02H
    INT 21h
    POP AX
    LOOP OUTPUT
    MOV DL, 72
    MOV AH, 02H
    INT 21h
    JMP INITIAL

FINAL:
    MOV AH, 09H
    MOV DX, OFFSET ExitInfo
    INT 21H

DetectString:
    MOV AH, 09H
    MOV DX, OFFSET StringInfo
    INT 21H

    MOV AX, 0A00H              ; detect the number of digital characters
    MOV DX, OFFSET SBuffer
    INT 21H

    MOV SI, DX
    MOV CX, 0
    MOV CL, [SI+1]
    ADD SI, 2
    MOV AX, 0
CHECK:
    MOV BL, [SI]
    INC SI
    CMP BL, 30H
    JB  NOTNUM
    CMP BL, 39H
    JA  NOTNUM
    INC AX
NOTNUM:
    LOOP CHECK

    PUSH AX
    MOV AH, 09H
    MOV DX, OFFSET SRInfo
    INT 21H
    POP AX

    MOV CX, 0004H

OUTPUT1:
    PUSH CX
    MOV CL, 4
    ROL AX, CL
    POP CX

    MOV DL, AL
    AND DL, 0FH
    ADD DL, 30H

    CMP DL, ':'
    JB NO1
    ADD DL, 07H
NO1:
    PUSH AX
    MOV AH, 02H
    INT 21h
    POP AX
    LOOP OUTPUT1
    
    MOV DL, 72
    MOV AH, 02H
    INT 21h
    JMP INITIAL

    MOV AX, 4c00h
    INT 21h
main ENDP
CODE ENDS
END START
