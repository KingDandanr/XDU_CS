----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/24 16:22:50
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity uC_CM is
    generic(
        width:integer := 48;    --位宽
        depth:integer := 8      --深度
    );
    port(
        clk:in std_logic;
        addr:in std_logic_vector(depth-1 downto 0);     ----uC_ROM地址
        CMROM_CS:in std_logic;  --uC_ROM输出使能
        
        data_out:out std_logic_vector(width-1 downto 0) --uC_ROM输出
    );
end uC_CM;

architecture Behavioral of uC_CM is

type matrix is array(integer range<>) of std_logic_vector(width-1 downto 0);
signal uC_ROM : matrix(0 to 2**depth-1);

procedure load_rom(signal data_word:out matrix) is 
    file romfile:text open read_mode is "uC_ROM.txt";
    variable lbuf:line;
    variable i:integer := 0; --循环变量
    variable fdata:std_logic_vector(width-1 downto 0);
begin
    while(not endfile(romfile) and i<2**depth) loop
        readline(romfile,lbuf); -- 逐行读数据
        read(lbuf,fdata); -- 将行数据保存到变量fdata
        data_word(i)<=fdata; -- 将fdata保存到内存信号量中
        i := i+1;
    end loop;
end procedure;

begin

load_rom(uC_ROM);
data_out <= uC_ROM(conv_integer(addr)) when CMROM_CS='1'else(others=>'0');

end Behavioral;
