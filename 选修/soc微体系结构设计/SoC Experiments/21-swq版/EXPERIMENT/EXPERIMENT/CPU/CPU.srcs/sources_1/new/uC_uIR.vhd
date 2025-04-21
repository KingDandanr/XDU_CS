----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/24 16:22:50
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uC_uIR is
  Port (
    clk:in std_logic;
    CM:in std_logic_vector(47 downto 0);
    
    uA:out std_logic_vector(7 downto 0);
    uI:out std_logic_vector(47 downto 8)
  );
end uC_uIR;

architecture Behavioral of uC_uIR is

begin

uA<=CM(7 downto 0);
uI<=CM(47 downto 8);

end Behavioral;
