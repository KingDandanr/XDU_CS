----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 19:49:35
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity divider_origin_ctrl is
    Port (
        clk,start:in std_logic;
        clkout,rstall,done:out std_logic
     );
end divider_origin_ctrl;

architecture Behavioral of divider_origin_ctrl is

signal cnt4b:std_logic_vector(3 downto 0);

begin

process(clk,start)
begin
    rstall<=start;
    if(start='1')then cnt4b<="0000";
    elsif clk'event and clk='1'then if cnt4b<=7 then cnt4b<=cnt4b+1;end if;
    end if;
end process;

process(clk,cnt4b,start)
begin
    if (start='1')then
        clkout<='0';done<='0'; 
    elsif(start='0')then    
        if cnt4b<=7 then clkout<=clk;
        else clkout<='0';done<='1';
        end if; 
    end if;
end process;

end Behavioral;
