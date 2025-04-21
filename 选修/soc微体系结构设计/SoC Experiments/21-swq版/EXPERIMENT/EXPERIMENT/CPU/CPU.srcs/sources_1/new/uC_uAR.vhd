----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/24 16:22:50
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uC_uAR is
    Port(
        clk:in std_logic;
        nreset: in std_logic;
        uAR_in:in std_logic_vector(7 downto 0);  --uA传送的微地址
        
        uAR_out:out std_logic_vector(7 downto 0) --送至uCM的地址
    );
end uC_uAR;

architecture Behavioral of uC_uAR is

begin
uAR_out<=uAR_in;
--process(clk,nreset)
--begin
--    if(nreset='0')then uAR_out<=(others=>'0');
--    elsif(clk='1'and clk'event)then uAR_out<=uAR_in;
--    end if;
--end process;

end Behavioral;
