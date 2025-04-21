library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier_2bit_tb is
--  Port ( );
end multiplier_2bit_tb;

architecture Behavioral of multiplier_2bit_tb is
component multiplier_2bit
    Port(
        clk,start:in std_logic;
        ain,bin:in std_logic_vector(7 downto 0);
        done:out std_logic;
        sout:inout std_logic_vector(15 downto 0)
    );
end component;
signal clk,start: std_logic;
signal ain,bin: std_logic_vector(7 downto 0);
signal done: std_logic;
signal sout: std_logic_vector(15 downto 0);
begin
multiplier_2bit_inst:multiplier_2bit port map(clk,start,ain,bin,done,sout);

clock_gen:process
begin  
    clk<='1';
    wait for 10ns;
    clk<='0';
    wait for 10ns;
end process;

test:process
begin
    ain<="10011010";
    bin<="01100101";
    wait for 25ns;
    start<='1';
    wait for 25ns;
    start<='0';    
    wait for 150ns;
end process;

end Behavioral;
