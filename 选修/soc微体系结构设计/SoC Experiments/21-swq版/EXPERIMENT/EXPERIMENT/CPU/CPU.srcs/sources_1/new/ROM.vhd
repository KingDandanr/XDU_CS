----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 13:02:24
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_textio.ALL;
use std.textio.all;

entity ROM is
    generic(
        depth:positive:=12;
        width:positive:=8
    );
    Port (
        clk_ROM,M_ROM,ROM_EN:in std_logic;
        addr:in std_logic_vector(11 downto 0);
        DATA_BUS:inout std_logic_vector(7 downto 0)
    );
end ROM;

architecture Behavioral of ROM is
type matrix is array (integer range<>)of std_logic_vector(width-1 downto 0);
signal rom:matrix(0 to 2**depth-1);

procedure load_rom (signal data_word:out matrix)is
--file romfile:text open read_mode is "ROM_LED.mem";--（LED程序使用）
file romfile:text open read_mode is "ROM_ADD.mem";--（ADD程序使用）
variable lbuf:line;
variable i:integer:=0;
variable fdata:std_logic_vector(7 downto 0);
begin
    while(not endfile(romfile)and i<2**depth)loop
        readline(romfile,lbuf);
        read(lbuf,fdata);
        data_word(i)<=fdata;
        i:=i+1;
    end loop;
end procedure;

begin
 
load_rom(rom);
process(clk_ROM,ROM_EN,M_ROM)
begin
    if(ROM_EN='0'and M_ROM='1')then
        if(clk_ROM='1'and clk_ROM'event)then
            DATA_BUS<=rom(conv_integer(addr));
        end if;
    else DATA_BUS<=(others=>'Z');
    end if;
end process;        
        
end Behavioral;
