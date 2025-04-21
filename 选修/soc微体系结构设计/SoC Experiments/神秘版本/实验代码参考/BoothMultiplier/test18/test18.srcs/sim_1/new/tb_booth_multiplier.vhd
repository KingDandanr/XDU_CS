----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/22 15:15:51
-- Design Name: 
-- Module Name: tb_booth_multiplier - Behavioral
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

entity tb_booth_multiplier is
--  Port ( );
end tb_booth_multiplier;

architecture Behavioral of tb_booth_multiplier is
COMPONENT booth_multiplier IS
PORT(
        multiplicand, multiplier : IN BIT_VECTOR(7 DOWNTO 0);
        clock : IN BIT; 
        product : INOUT BIT_VECTOR((15) DOWNTO 0));
END COMPONENT;

SIGNAL multiplicand, multiplier : BIT_VECTOR(7 DOWNTO 0);
SIGNAL clock: BIT;
SIGNAL product: BIT_VECTOR((15) DOWNTO 0);

begin

uut:booth_multiplier PORT MAP(multiplicand, multiplier,clock,product);

PROCESS
BEGIN
    CLOCK <= '1';
    WAIT FOR 10NS;
    CLOCK <= '0';
    WAIT FOR 10NS;
END PROCESS;

PROCESS
BEGIN
    multiplicand <= "00111000";
    multiplier <= "00000010";
    WAIT FOR 100NS;
END PROCESS;


end Behavioral;
