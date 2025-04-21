----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/26 08:47:54
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU_tb is

end CPU_tb;

architecture Behavioral of CPU_tb is
component CPU
    generic(
        CLK_FRE:integer:=100000000
    );
    Port(
        clk:in std_logic;
        nreset:in std_logic;
        data_in:in std_logic_vector(7 downto 0);
        
        data_out:out std_logic_vector(7 downto 0)
    );
end component;

signal clk,nreset:std_logic;
signal data_in,data_out:std_logic_vector(7 downto 0);

begin

CPU_inst:CPU generic map(100000000)port map(clk,nreset,data_in,data_out);

clock:process
begin
    clk<='1';
    wait for 5ns;
    clk<='0';
    wait for 5ns;
end process;

reset:process
begin
    nreset<='0';
    wait for 15ns;
    nreset<='1';
    wait;
end process;

test:process
begin
    data_in<=x"FF";
    wait;
end process;

end Behavioral;
