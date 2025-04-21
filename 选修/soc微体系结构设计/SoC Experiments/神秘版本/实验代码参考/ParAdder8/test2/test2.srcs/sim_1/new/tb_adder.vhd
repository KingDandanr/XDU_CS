----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/20 09:00:19
-- Design Name: 
-- Module Name: tb_adder - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_adder is
--  Port ( );
end tb_adder;

architecture Behavioral of tb_adder is

component parellel_adder is
    port( 
            a: in std_logic_vector(7 downto 0);
            b: in std_logic_vector(7 downto 0);
            sel_in: in std_logic_vector(3 downto 0);
            c_in: in std_logic;
            sel_out: out std_logic_vector(3 downto 0);
            c_out: out std_logic;
            sum_out: out std_logic_vector(15 downto 0)
    );
end component;

signal a: std_logic_vector(7 downto 0) := (others => '0');
signal b: std_logic_vector(7 downto 0) := (others => '0');
signal sel_in: std_logic_vector(3 downto 0) := (others => '0');
signal c_in: std_logic := '0';
signal sel_out: std_logic_vector(3 downto 0) := (others => '0');
signal c_out: std_logic := '0';
signal sum_out: std_logic_vector(15 downto 0) := (others => '0');

begin

    uut:parellel_adder
        port map(
                    a => a,
                    b => b,
                    sel_in => sel_in,
                    c_in => c_in,
                    sel_out => sel_out,
                    c_out => c_out,
                    sum_out => sum_out
        );

main:process
begin

sel_in <= "0000";
c_in <= '1';
a <= "11111111";
b <= "00000001";
wait for 20ns;

sel_in <= "0000";
c_in <= '1';
a <= "11111111";
b <= "00000010";
wait for 20ns;

sel_in <= "0000";
c_in <= '1';
a <= "11111111";
b <= "00000100";
wait for 20ns;

sel_in <= "0000";
c_in <= '1';
a <= "11111111";
b <= "00001000";
wait for 20ns;

sel_in <= "0000";
c_in <= '1';
a <= "11111111";
b <= "01011010";
wait for 20ns;

end process;
end Behavioral;
