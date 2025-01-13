
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter8 is
      Port (     clk : In    std_logic;
                 rst : In    std_logic;
               count : Out   std_logic_vector (2 downto 0) );
end counter8;

architecture BEHAVIORAL of counter8 is

      signal Q: std_logic_vector(2 downto 0);

begin

   count <= std_logic_vector(Q); -- type conversion

   p_count: process(clk, rst)   -- Counter with Rst as asynchronous reset
      begin
      if (rst = '1') then -- async reset condition
         Q <= "000";
      elsif rising_edge(clk) then -- Edge triggered clock
            Q <= Q + 1;
      end if;
   end process;

end BEHAVIORAL;

