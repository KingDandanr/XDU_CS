----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/21 09:20:06
-- Design Name: 
-- Module Name: adder - Behavioral
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

entity adder is
Port ( 
        x: in std_logic;
        y: in std_logic;
        z: in std_logic;
        c_in: in std_logic;
        s: out std_logic;
        c_out: out std_logic
);
end adder;

architecture Behavioral of adder is

begin

s <= x xor y xor z xor c_in;
c_out <= (x and y) or (x and z) or (x and c_in) or (y and z) or (y and c_in) or (z and c_in);

end Behavioral;
