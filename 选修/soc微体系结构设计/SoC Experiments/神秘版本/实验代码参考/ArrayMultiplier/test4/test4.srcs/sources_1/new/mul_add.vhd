----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/21 09:39:16
-- Design Name: 
-- Module Name: mul_add - Behavioral
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

entity mul_add is
Port ( 
        a: in std_logic;
        b: in std_logic;
        s_in: in std_logic;
        c_in: in std_logic;
        
        s: out std_logic;
        c_out: out std_logic
);
end mul_add;

architecture Behavioral of mul_add is

signal z: std_logic;

begin

z <= a and b;
s <= s_in xor z xor c_in;
c_out <= (s_in and z) or (s_in and c_in) or (z and c_in);

end Behavioral;
