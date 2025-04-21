
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity run_led_tb is
end run_led_tb;

architecture Behavioral of run_led_tb is
component run_led
    Port(
        en,dir,sel,clk,con:in std_logic;
        y:out std_logic_vector(7 downto 0)
    );
end component;

SIGNAL en,dir,sel,clk,con: std_logic;
SIGNAL y: std_logic_vector(7 downto 0);

begin
run_led_inst:run_led port map(en=>en,dir=>dir,sel=>sel,clk=>clk,con=>con,y=>y); 

clock:process
begin 
    clk<='1';
    wait for 5ns;
    clk<='0';
    wait for 5ns;
end process;

key:process
begin 
    con<='1';
    wait for 25ns;
    con<='0';
    wait for 25ns;
end process;

test:process
begin
    en<='0';
    sel<='1';
    dir<='1';
    wait for 25ns;
    en<='1';
    wait;

end process;


end Behavioral;
