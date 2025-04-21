----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/04/01 08:55:12
-- Design Name: 
-- Module Name: key_stroke_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity key_stroke_tb is
--  Port ( );
end key_stroke_tb;

architecture Behavioral of key_stroke_tb is
component key_stroke
    generic(CLK_FRE:integer:=50000000);
    port(
        clk:in std_logic;
        reset:in std_logic;
        key_in:in std_logic;
        output:out std_logic 
    ); 
end component;
signal clk:std_logic;
signal reset:std_logic;
signal key_in:std_logic;
signal output:std_logic;
begin
ks:key_stroke generic map(50000000)port map(clk,reset,key_in,output);

clock:process
begin
    clk<='0';
    wait for 10ns;
    clk<='1';
    wait for 10ns;
end process;

rst:process
begin
    reset<='1';
    wait for 25ns;
    reset<='0';
    wait;
end process;

test:process
begin
    key_in<='1';
    wait for 50ns;
    key_in<='0';
    wait for 70ns;
    key_in<='1';
    wait for 100ns;
    key_in<='0';
    wait for 40ns;
    key_in<='1';
    wait for 120ns;
    key_in<='0';
    wait for 30ns;
    key_in<='1';
    wait for 40ns;
    key_in<='0';
    wait for 70ns;
    key_in<='1';
    wait for 30ns;
    key_in<='0';
    wait for 100ns;
    key_in<='1';
    wait for 50ns;
    key_in<='0';
    wait for 20ns;
    key_in<='1';
    wait for 1000ns;
    key_in<='0';
    wait for 2000ns;
end process;

end Behavioral;
