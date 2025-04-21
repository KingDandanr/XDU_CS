library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity multiplier_2bit_ctrl is
    Port (
        clk,start:in std_logic;
        clkout,rstall,done:out std_logic
     );
end multiplier_2bit_ctrl;

architecture Behavioral of multiplier_2bit_ctrl is

signal cnt3b:std_logic_vector(2 downto 0);

begin

process(clk,start)
begin
    rstall<=start;
    if(start='1')then cnt3b<="000";
    elsif clk'event and clk='1'then if cnt3b<=4 then cnt3b<=cnt3b+1;end if;
    end if;
end process;

process(clk,cnt3b,start)
begin
    if (start='1')then
        clkout<='0';done<='0'; 
    elsif(start='0')then    
        if cnt3b<=4 then clkout<=clk;
        else clkout<='0';done<='1';
        end if; 
    end if;
end process;

end Behavioral;
