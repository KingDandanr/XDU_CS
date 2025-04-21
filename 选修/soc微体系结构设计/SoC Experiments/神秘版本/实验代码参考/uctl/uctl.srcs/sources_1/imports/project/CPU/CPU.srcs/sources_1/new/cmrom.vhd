----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/05/20 09:30:35
-- Design Name: 
-- Module Name: rom - Behavioral
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
use IEEE.STD_LOGIC_TEXTIO.ALL;
use std.textio.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cmrom is
Port (m_rom,nrom_en:in std_logic;
    addr:in std_logic_vector(7 downto 0);
    data:out std_logic_vector(47 downto 0) );
end cmrom;

architecture Behavioral of cmrom is
type matrix is array(integer range<>) of std_logic_vector(47 downto 0);
signal rom:matrix (0 to 2**8-1);
procedure load_rom (signal data_word:out matrix) is
    file romfile:text open read_mode is "C:\Users\akyna\Codes\vivado\uctl\uctl\ucode.txt";
    variable lbuf:line;
    variable i:integer:=0;
    variable fdata:std_logic_vector(47 downto 0);
begin
while not endfile(romfile) loop
    readline(romfile,lbuf);
    read(lbuf,fdata);
    data_word(i)<=fdata;
    i:=i+1;
end loop;
end procedure;

begin
load_rom(rom);
data<=rom(conv_integer(addr));
end Behavioral;
