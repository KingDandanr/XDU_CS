module ERZP  (CLK, KIN,KOUT);
   input   CLK, KIN;                 //����ʱ�Ӻ������ź�
   output  KOUT;     reg KOUT;
   reg [3:0] KH,KL;                 //����Ըߵ�ƽ�͵͵�ƽ�������֮�Ĵ�����
   always @(posedge CLK)  begin    
       if (!KIN)  KL<=KL+1 ;           //�Լ�����ĵ͵�ƽ�������
          else  KL<=4'b0000;    end    //�����ָߵ�ƽ�����������0
   always @(posedge CLK)  begin   
        if (KIN)  KH<= KH+1;            //ͬʱ�Լ�����ĸߵ�ƽ�������
           else KH<=4'b0000;   end     //�����ָߵ�ƽ�����������0
   always @(posedge CLK)  begin
        if (KH > 4'b1100) KOUT<=1'B1;//�Ըߵ�ƽ�������һ������12�������1 
           else if (KL > 4'b0111)  
KOUT<=1'B0;                             //�Ե͵�ƽ�������������7�������0
    end    endmodule
