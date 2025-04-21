library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity array_multiplier_tb is
--  Port ( );
end array_multiplier_tb;

architecture Behavioral of array_multiplier_tb is
component array_multiplier_seg
    Port (
        rst,clk:in std_logic;
        a_in,b_in:in std_logic_vector(7 downto 0);
        
        seg_dig:out std_logic_vector(15 downto 0);
        seg_data:out std_logic_vector(7 downto 0)
    );
end component;

signal rst,clk:std_logic;
signal a_in,b_in:std_logic_vector(7 downto 0);
signal seg_dig:std_logic_vector(15 downto 0);
signal seg_data:std_logic_vector(7 downto 0);


begin

array_multiplier_seg_inst:array_multiplier_seg port map(rst,clk,a_in,b_in,seg_dig,seg_data);

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
    a_in<="10111101";
    b_in<="11001010";
    wait;
end process;

end Behavioral;
