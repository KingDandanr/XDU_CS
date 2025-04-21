----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 13:02:24
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity run_led is
    Port(
        en,dir,sel,clk,con:in std_logic;
        y:out std_logic_vector(7 downto 0)
    );
end run_led;

architecture Behavioral of run_led is
signal input:std_logic;
signal clk_div:std_logic;
begin

process(clk)
variable clk_cnt:integer:=0;
variable clk_cnt_2:integer:=0;
begin 
    if(clk='1'and clk'event)then 
        clk_cnt_2:=clk_cnt_2+1;
        if(clk_cnt_2>=10000)then 
        clk_cnt:=clk_cnt+1;
        clk_cnt_2:=0;
        end if;
        if(clk_cnt<5000)then clk_div<='1';
        elsif(clk_cnt>=5000)then clk_div<='0';
        end if;
        if(clk_cnt>=10000)then clk_cnt:=0;
        end if; 
    end if;
end process;

process(clk,en,clk_div,con,sel)
    begin
        if(en='1')then
            if(sel='0')then input<=clk_div;
            elsif(sel='1')then input<=con;
            end if;
        elsif(en='0')then input<='0';
        end if;
end process;

process(input,dir)
variable count:integer:=0;
begin
if(input='1'and input'event)then 
    if(dir='1')then
        count:=count+1;
        if(count>7)then count:=0;end if;
    elsif(dir='0')then 
        count:=count-1;
        if(count<0)then count:=7;end if;
    end if;  
        
    if(count=0)then y<="00000001";
    elsif(count=1)then y<="00000010";
    elsif(count=2)then y<="00000100";
    elsif(count=3)then y<="00001000";
    elsif(count=4)then y<="00010000";
    elsif(count=5)then y<="00100000";
    elsif(count=6)then y<="01000000";
    elsif(count=7)then y<="10000000";
    else y<="11111111";
    end if;
    
end if;       
end process;

end Behavioral;
