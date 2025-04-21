----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/05/13 11:10:20
-- Design Name: 
-- Module Name: data2seg - Behavioral
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

entity data2seg is
Port (data_in:in std_logic_vector(3 downto 0);
    seg_data:out std_logic_vector(7 downto 0));
end data2seg;

architecture Behavioral of data2seg is

begin
process(data_in)
begin
case data_in is
when x"0"=>seg_data<=x"c0";
when x"1"=>seg_data<=x"f9";
when x"2"=>seg_data<=x"a4";
when x"3"=>seg_data<=x"b0";
when x"4"=>seg_data<=x"99";
when x"5"=>seg_data<=x"92";
when x"6"=>seg_data<=x"82";
when x"7"=>seg_data<=x"f8";
when x"8"=>seg_data<=x"80";
when x"9"=>seg_data<=x"90";
when x"a"=>seg_data<=x"88";
when x"b"=>seg_data<=x"83";
when x"c"=>seg_data<=x"c6";
when x"d"=>seg_data<=x"a1";
when x"e"=>seg_data<=x"86";
when x"f"=>seg_data<=x"8e";
end case;
end process;

end Behavioral;
