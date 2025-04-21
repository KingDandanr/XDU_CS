----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/05/13 18:03:58
-- Design Name: 
-- Module Name: MyRom - Behavioral
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
use STD.TEXTIO.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MyRom is
  generic(
    wordlength:integer:=8;
    addrlength:integer:=8
  );
  Port (
    addr:in std_logic_vector(addrlength-1 downto 0);
    oe:in std_logic;
    dout:out std_logic_vector(wordlength-1 downto 0)
  );
end MyRom;

architecture Behavioral of MyRom is
type matrix is array(integer range<>) of std_logic_vector(7 downto 0);
signal rom:matrix(2**addrlength-1 downto 0);
procedure load_rom(signal data_word:out matrix) is
    file romfile:text open read_mode is  "C:\Users\akyna\Codes\vivado\rom\romfile.dat";
    --file romfile:text;
    --file_open(romfile,file_in,"romfile.txt",read_mode);
    variable lbuf:line;
    variable i:integer:=0;
    variable fdata:std_logic_vector(7 downto 0);
begin
    while not endfile(romfile) loop
        readline(romfile,lbuf);
        read(lbuf,fdata);
        data_word(i)<=fdata;
        i:=i+1;
        exit when i=256;
    end loop;
end procedure;

begin
    load_rom(rom);
    dout<=rom(conv_integer(addr))when oe='0'
        else "ZZZZZZZZ";
end Behavioral;
