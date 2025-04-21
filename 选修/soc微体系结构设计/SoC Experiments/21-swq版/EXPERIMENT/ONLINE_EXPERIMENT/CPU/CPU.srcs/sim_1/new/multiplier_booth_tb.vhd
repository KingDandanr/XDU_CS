library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier_booth_tb is
--  Port ( );
end multiplier_booth_tb;

architecture Behavioral of multiplier_booth_tb is
component multiplier_booth
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
multiplier_booth_inst:multiplier_booth port map(clk,start,ain,bin,done,sout);

clock_gen:process
begin  
    clk<='1';
    wait for 10ns;
    clk<='0';
    wait for 10ns;
end process;

test:process
begin
    ain<="00000010";
    bin<="10000010";
    wait for 25ns;
    start<='1';
    wait for 25ns;
    start<='0';    
    wait for 200ns;
end process;

end Behavioral;
