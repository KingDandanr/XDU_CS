----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/03/31 14:12:16
-- Design Name: 
-- Module Name: decoder3_8 - Behavioral
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

entity decoder3_8 is
    Port (  
        OE: in std_logic;
        X: in std_logic_vector(2 downto 0);
        Y: out std_logic_vector(7 downto 0)
    );
end decoder3_8;

architecture Behavioral of decoder3_8 is
begin
process(OE,X)
begin
    if OE='0' then Y<="00000000";
    elsif OE='1'then
        Case X is
            When "000" =>Y<="11111110";
            When "001" =>Y<="11111101";
            When "010" =>Y<="11111011";
            When "011" =>Y<="11110111";
            When "100" =>Y<="11101111";
            When "101" =>Y<="11011111";
            When "110" =>Y<="10111111";
            When "111" =>Y<="01111111";
            When others =>Y<="11111111";
        END CASE;    
   end if;
end process;
end Behavioral;
