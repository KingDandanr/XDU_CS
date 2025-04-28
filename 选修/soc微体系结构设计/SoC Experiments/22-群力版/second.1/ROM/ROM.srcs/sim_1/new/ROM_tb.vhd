----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 13:02:24
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM_tb is
--  Port ( );
end ROM_tb;

architecture Behavioral of ROM_tb is
component ROM
    generic(
        depth:positive:=12;
        width:positive:=8
    );
    Port (
        clk_ROM,M_ROM,ROM_EN:in std_logic;
        addr:in std_logic_vector(11 downto 0);
        DATA_BUS:out std_logic_vector(7 downto 0)
    );
end component;

signal rst:std_logic;
signal clk_ROM,M_ROM,ROM_EN:std_logic;
signal addr:std_logic_vector(11 downto 0);
signal DATA_BUS:std_logic_vector(7 downto 0);

begin

ROM_inst:ROM generic map(12,8)port map(clk_ROM,M_ROM,ROM_EN,addr,DATA_BUS);

clock:process
begin
    clk_ROM<='1';
    wait for 5ns;
    clk_ROM<='0';
    wait for 5ns;
end process;

test:process
begin
    M_ROM<='0';
    ROM_EN<='1';
    addr<=(others=>'0');
    wait for 25ns;
    M_ROM<='1';
    wait for 25ns;
    ROM_EN<='0';
    
    wait for 5ns;
    addr<="000000000000";
    wait for 20ns;  
    wait for 5ns;
    addr<="000000000001";
    wait for 20ns;
    wait for 5ns;
    addr<="000000000010";
    wait for 20ns;
    wait for 5ns;
    addr<="000000000011";
    wait for 20ns;
    
    wait;

end process;

end Behavioral;
