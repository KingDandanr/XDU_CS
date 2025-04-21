----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 13:02:24
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity array_multiplier_top is
    Port (
        a_in:in std_logic;
        b_in:in std_logic_vector(7 downto 0);
        s:out std_logic_vector(7 downto 0)
     );
end array_multiplier_top;

architecture Behavioral of array_multiplier_top is

begin

process(a_in,b_in)
begin
    for i in 0 to 7 loop
       s(i)<=a_in and b_in(i); 
    end loop;
end process;

end Behavioral;
