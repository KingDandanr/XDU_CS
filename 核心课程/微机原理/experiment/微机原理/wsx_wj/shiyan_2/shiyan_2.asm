_STACK SEGMENT PARA STACK'_STACK'
           DB 128 DUP(0)
_STACK ENDS



DATA SEGMENT
    hello    DB 'Input a number or an instruction!!Q OR q: EXIT,s:SEARCH',0AH,0DH,'$'
    wrong    DB 0AH,0DH,'Wrong Input(only numbers!)',0AH,0DH,'$'
    endofhex DB 0AH,0DH,'Binary:',0AH,0DH,'$'
    finish   DB 0AH,0DH,'Finished',0AH,0DH,'$'
    hello2   DB 0AH,0DH,'Search number inyour string. Space to end input',0AH,0DH,'Input string:',0AH,0DH,'$'
    finish2  DB 0AH,0DH,'FINISHED!!!',0AH,0DH,'THERE ARE ','$'
    finish3  DB ' numbers',0AH,0DH,'$'
    got      DB 5 DUP(0)
    huanhang DB 0AH,0DH,'$'
DATA ENDS

CODE SEGMENT
                      assume cs:CODE,ds:DATA,ss:_STACK
    START:            
    beginofread:      
                      mov    ax,DATA
                      mov    ds,ax
                      mov    dx,offset hello
                      mov    ah,09H
                      int    21H
                      mov    bx,0H
                      mov    di,offset got
                      mov    cx,0H
    readchar:         
                      mov    ah,01H
                      mov    al,00h
                      int    21H
                      cmp    bx,0H
                      jne    notfirst
                      cmp    al,'Q'
                      je     exit
                      cmp    al,'q'
                      je     exit
                      cmp    al,'s'
                      je     next
    notfirst:         
                      mov    bx,01H
                      call   legalcheck
                      cmp    bx,02H
                      je     beginofread
                      cmp    bx,04H
                      je     endofinput
                      jmp    loadinmemory
    loadinmemory:     
                      mov    [di],al
                      inc    cx
                      inc    di
                      jmp    readchar
    endofinput:       
                      mov    dx,0H
                      mov    di,offset got
    beginofhandle:    
                      mov    bx,0H
                      mov    bl,[di]
                      sub    bx,30H
                      add    dx,bx
                      cmp    cx,1H
                      je     endofhandle
                      call   mulAHdxtodx
                      dec    cx
                      inc    di
                      jmp    beginofhandle
    next:             
                      jmp    counterofnumber
    endofhandle:      
                      call   binaryoutput
                      jmp    beginofread
    binaryoutput:     
                      mov    bx,dx
                      mov    dx,0H
                      mov    cx,10H
    beginofoutputloop:
                      shl    bx,1
                      jnc    out0
                      mov    dl,'1'
                      jmp    outputdl
    exit:             
                      mov    ah,4CH
                      int    21H
    out0:             
                      mov    dl,'0'
    outputdl:         
                      mov    ah,02H
                      int    21H
                      dec    cx
                      cmp    cx,0H
                      jne    beginofoutputloop
                      mov    dx,offset finish
                      mov    ah,09H
                      int    21H
                      ret
    legalcheck:       
                      cmp    al,00H
                      je     endlegalnextline
                      cmp    al,30H
                      jb     endlegalfalse
                      cmp    al,39H
                      ja     endlegalfalse
    endlegaltrue:     
                      mov    bx,03H
                      ret
    endlegalnextline: 
                      mov    bx,04H
                      mov    dx,offset huanhang
                      mov    ah,09h
                      int    21h
                      ret
    endlegalfalse:    
                      mov    dx,offset wrong
                      mov    ah,09H
                      int    21H
                      mov    bx,02H
                      ret
    mulAHdxtodx:      
                      mov    bx,0H
                      mov    ax,0H
    loopofmul:        
                      add    ax,dx
                      inc    bx
                      cmp    bx,0AH
                      jb     loopofmul
                      mov    dx,ax
                      ret
    counterofnumber:  
                      mov    dx,offset hello2
                      mov    ah,09H
                      int    21H
                      mov    cx,0H
    beginofcount:     
                      mov    ah,01H
                      mov    al,00h
                      int    21H
                      cmp    al,20H
                      je     endofcount
                      cmp    al,30H
                      jb     notnum
                      cmp    al,39H
                      ja     notnum
    isnum:            
                      inc    cx
                      jmp    beginofcount
    notnum:           
                      jmp    beginofcount
    endofcount:       
                      add    cx,30H
                      mov    dx,offset finish2
                      mov    ah,09H
                      int    21H
                      mov    dx,0H
                      mov    dl,cl
                      mov    ah,02H
                      int    21H
                      mov    dx,offset finish3
                      mov    ah,09H
                      int    21H
                      jmp    beginofread
CODE ENDS
END START




