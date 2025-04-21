----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/21 16:07:57
-- Design Name: 
-- Module Name: tb_mul8_c - Behavioral
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

entity tb_mul8_c is
--  Port ( );
end tb_mul8_c;

architecture Behavioral of tb_mul8_c is

component mul8_c is
port(
        a: in std_logic_vector(7 downto 0);
        b: in std_logic_vector(7 downto 0);
        clk_in: in std_logic;
        sum_out: out std_logic_vector(15 downto 0)
);
end component;

signal a: std_logic_vector(7 downto 0) := (others => '0');
signal b: std_logic_vector(7 downto 0) := (others => '0');
signal clk_in: std_logic := '0';
signal sum_out: std_logic_vector(15 downto 0) := (others => '0');

begin
uut: mul8_c port map(a,b,clk_in,sum_out);

clk:process
begin
    clk_in <= clk_in xor '1';
    wait for 10ns;
end process;

main:process
begin
    a <= "11111111";
    b <= "01111111";
    wait for 100ns;
end process;

end Behavioral;
