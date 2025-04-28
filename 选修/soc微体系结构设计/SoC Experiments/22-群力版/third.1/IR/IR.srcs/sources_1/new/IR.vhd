
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IR is
    Port (
        rst,clk_IR,LD_IR1,LD_IR2,LD_IR3,nARen:in std_logic;
        DATA_BUS:in std_logic_vector(7 downto 0);
        
        IR_out:out std_logic_vector(7 downto 0);--传送指令到指令寄存器，指令寄存器输出
        RS,RD:out std_logic;--传送操作寄存器（寄存器地址）
        PC_out:out std_logic_vector(11 downto 0);--PC地址总线
        AR:out std_logic_vector(6 downto 0)  --7位地址寄存器输出
    );
end IR;

architecture Behavioral of IR is

begin

process(rst,clk_IR,LD_IR1,LD_IR2,LD_IR3,nARen)
begin
    if(rst='1')then
        IR_out<=(others=>'0');
        PC_out<=(others=>'0');
        RS<='0';RD<='0';
    elsif(clk_IR='1' and clk_IR'event)then
        if(LD_IR1='1')then IR_out<=DATA_BUS;end if;
        RS<=DATA_BUS(0);RD<=DATA_BUS(1);
        if(LD_IR2='1')then PC_out(11 downto 8)<=DATA_BUS(3 downto 0);
        elsif(LD_IR3='1')then 
            PC_out(7 downto 0)<=DATA_BUS(7 downto 0);
            if(nARen='0')then AR<=DATA_BUS(6 downto 0);end if;
        end if;
    end if;
end process;

end Behavioral;
