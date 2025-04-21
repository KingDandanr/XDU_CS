----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/20 22:29:17
-- Design Name: 
-- Module Name: digitalLED_decode - Behavioral
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

entity digitalLED_decode is
    Port 
    ( 
        num: in std_logic_vector(3 downto 0);
        seg_data: out std_logic_vector(7 downto 0)
    );
end digitalLED_decode;

architecture Behavioral of digitalLED_decode is
    
begin
    process(num)
        begin
            case num is             --a,b,c,d,e,f,g,dp
                when x"0" => seg_data <= "00000011";
                when x"1" => seg_data <= "10011111";
                when x"2" => seg_data <= "00100101";
                when x"3" => seg_data <= "00001101";
                when x"4" => seg_data <= "10011001";
                when x"5" => seg_data <= "01001001"; 
                when x"6" => seg_data <= "01000001"; 
                when x"7" => seg_data <= "00011111"; 
                when x"8" => seg_data <= "00000001"; 
                when x"9" => seg_data <= "00001001"; 
                when x"A" => seg_data <= "00010001"; 
                when x"B" => seg_data <= "11000001"; 
                when x"C" => seg_data <= "11100101"; 
                when x"D" => seg_data <= "10000101"; 
                when x"E" => seg_data <= "01100001"; 
                when x"F" => seg_data <= "01110001"; 
                when others=>seg_data <= x"11";
            end case;
        end process;
end Behavioral;
