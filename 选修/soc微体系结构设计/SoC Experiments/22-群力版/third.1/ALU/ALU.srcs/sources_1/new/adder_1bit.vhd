----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 13:02:24
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_1bit is
    Port (
        a,b,c_in:in std_logic;
        s,c_out:out std_logic
     );
end adder_1bit;

architecture Behavioral of adder_1bit is

begin

process(a,b,c_in)
begin
    s<=a xor b xor c_in;
    c_out<=(a and b)or((a xor b)and c_in);
end process;

end Behavioral;
