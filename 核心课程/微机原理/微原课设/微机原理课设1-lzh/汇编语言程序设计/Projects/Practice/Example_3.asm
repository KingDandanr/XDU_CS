TITLE Check Writing And Reading

CODE SEGMENT
    ASSUME CS:CODE

main PROC
START:
    MOV dx, 4000H
    MOV es, dx
    MOV di, 0
    MOV cx, 0C000H
    MOV al, 55H
    CLD              ; clear direction flag
    REP STOSB        ; write 0x55 from 0x4000 to 0xBFFF
    MOV di, 0
    MOV cx, 0C000H
    REP SCASB        ; compare al with memory from 0x4000 to 0xBFFF
    JNZ ERROR        ; if not equal, jump to ERROR
    MOV al, 7EH
    JMP STOP
ERROR:
    MOV al, 81H
STOP: 
    MOV ah, 4Ch  ; exit program
    INT 21h
main ENDP
CODE ENDS
END START

