----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 13:02:24
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_div is
    generic(
        DIV_NUM:integer:=10000
    );
    Port (
        rst:in std_logic;
        clk_in:in std_logic;
        clk_out:out std_logic
    );
end clk_div;

architecture Behavioral of clk_div is

begin

process(rst,clk_in)
variable count:integer:=0;
begin
    if(rst='1')then count:=0; 
    elsif(clk_in='1'and clk_in'event)then 
        count:=count+1;
        if(count<=DIV_NUM/2)then
            clk_out<='1';
        elsif(count>DIV_NUM/2 and count<DIV_NUM)then
            clk_out<='0';
        elsif(count>=DIV_NUM)then
            count:=0;
        end if;
    end if;
end process;

end Behavioral;
