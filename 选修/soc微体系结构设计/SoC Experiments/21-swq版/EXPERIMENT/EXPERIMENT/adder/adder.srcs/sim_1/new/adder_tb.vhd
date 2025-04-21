----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 13:02:24
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_tb is
--  Port ( );
end adder_tb;

architecture Behavioral of adder_tb is
component adder
    Port (
        clk,rst:in std_logic;
        a,b:in std_logic_vector(7 downto 0);
        c:in std_logic;
        c_out:out std_logic;
        sel_out:out std_logic_vector(15 downto 0);
        seg_data:out std_logic_vector(7 downto 0)
     );
end component;
signal clk,rst :std_logic;
signal a,b     :std_logic_vector(7 downto 0);
signal c       :std_logic;
signal c_out   : std_logic;
signal sel_out : std_logic_vector(15 downto 0);
signal seg_data: std_logic_vector(7 downto 0);

begin
adder_inst:adder port map(clk,rst,a,b,c,c_out,sel_out,seg_data);

clock:process
begin
    clk<='1';
    wait for 5ns;
    clk<='0';
    wait for 5ns;
end process;

restart:process
begin
    rst<='1';
    wait for 25ns;
    rst<='0';
    wait;
end process;

test:process
begin
    a<="00100010";
    b<="01000100";
    c<='1';
    wait for 100ns;
    
    a<="11111111";
    b<="11111111";
    c<='1';
    wait;
end process;

end Behavioral;
