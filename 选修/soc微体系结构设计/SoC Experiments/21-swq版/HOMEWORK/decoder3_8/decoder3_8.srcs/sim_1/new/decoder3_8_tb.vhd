----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/03/31 15:11:11
-- Design Name: 
-- Module Name: decoder3_8_tb - Behavioral
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

entity decoder3_8_tb is
--  Port ( );
end decoder3_8_tb;

architecture structural of decoder3_8_tb is
component decoder3_8
    port(
        OE: in std_logic;
        X: in std_logic_vector(2 downto 0);
        Y: out std_logic_vector(7 downto 0)
    );
end component;
signal oe:std_logic;
signal input:std_logic_vector(2 downto 0);
signal output:std_logic_vector(7 downto 0);
begin
d1:decoder3_8 port map(oe,input,output);

ensure:process
    begin
        oe<='0';
        wait for 50ns;
        oe<='1';
        wait;
end process;

sel:process
    begin
        input<="000";
        wait for 20ns;
        input<="001";
        wait for 20ns;
        input<="010";
        wait for 20ns;
        input<="011";
        wait for 20ns;
        input<="100";
        wait for 20ns;
        input<="101";
        wait for 20ns;
        input<="110";
        wait for 20ns;
        input<="111";
        wait for 20ns;
end process;
end structural;