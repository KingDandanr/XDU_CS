----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/21 16:17:18
-- Design Name: 
-- Module Name: tb_mul4_c - Behavioral
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

entity tb_mul4_c is
--  Port ( );
end tb_mul4_c;

architecture Behavioral of tb_mul4_c is

component mul4_c is
port(
        x: in std_logic_vector(3 downto 0);
        y: in std_logic_vector(3 downto 0);
        sum_out: out std_logic_vector(7 downto 0)
);
end component;
signal x: std_logic_vector(3 downto 0) := (others => '0');
signal y: std_logic_vector(3 downto 0) := (others => '0');
signal sum_out: std_logic_vector(7 downto 0) := (others => '0');
begin

uut: mul4_c port map(x,y,sum_out);
process
begin
    x <= "1111";
    y <= "1111";
    wait for 100ns;
end process;

end Behavioral;
