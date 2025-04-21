library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity multiplier_booth_ctrl is
    Port (
        clk,start:in std_logic;
        clkout,rstall,done:out std_logic
     );
end multiplier_booth_ctrl;

architecture Behavioral of multiplier_booth_ctrl is

signal cnt4b:std_logic_vector(3 downto 0);

begin

process(clk,start)
begin
    rstall<=start;
    if(start='1')then cnt4b<="0000";
    elsif clk'event and clk='1'then if cnt4b<=8 then cnt4b<=cnt4b+1;end if;
    end if;
end process;

process(clk,cnt4b,start)
begin
    if (start='1')then
        clkout<='0';done<='0'; 
    elsif(start='0')then    
        if cnt4b<=8 then clkout<=clk;
        else clkout<='0';done<='1';
        end if; 
    end if;
end process;

end Behavioral;
