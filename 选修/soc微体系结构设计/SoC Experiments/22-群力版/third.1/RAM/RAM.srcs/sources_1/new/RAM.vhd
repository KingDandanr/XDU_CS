----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/23 21:55:51
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RAM is
    generic(
        depth:integer:=7;
        width:integer:=8
        );
    port( 
        clk_RAM:in STD_LOGIC;       --RAM时钟信号
        n_reset:in STD_LOGIC;       --RAM选择信号
        RAM_CS:in STD_LOGIC;        --RAM片选信号
        nRAM_EN:in STD_LOGIC;       --RAM输出使能
        Wr_nRD :in STD_LOGIC;       --RAM读写信号
        AR:in STD_LOGIC_VECTOR (depth-1 downto 0);  --RAM地址信号
        
        --DATA_BUS: inout STD_LOGIC_VECTOR (width-1 downto 0) --数据总线
        data_in:in STD_LOGIC_VECTOR (width-1 downto 0);
        data_out:out STD_LOGIC_VECTOR (width-1 downto 0)
        );
end RAM;

architecture Behavioral of RAM is

type ram_array is array(0 to 2**depth) of STD_LOGIC_VECTOR (width-1 downto 0);
signal index : integer range 0 to 2**depth;
signal SRAM:ram_array;

begin

process (n_reset,clk_RAM) 
begin
    index<=conv_integer(AR);
    if(n_reset='1')  then 
        --DATA_BUS<=(others=>'Z');
        data_out<=(others=>'Z');
    elsif(clk_RAM'event and clk_RAM='1') then
        if(RAM_CS='1')then
            if(Wr_nRD='1')then
                --SRAM(index)<=DATA_BUS;
                SRAM(index)<=data_in;
            elsif(nRAM_EN='0')then
                --DATA_BUS<=SRAM(index);
                data_out<=SRAM(index);
            else
                --DATA_BUS<=(others=>'Z');
                data_out<=(others=>'Z');
            end if;
        else 
            --DATA_BUS<=(others=>'Z');
            data_out<=(others=>'Z');
        end if;
    end if;
end process;

end Behavioral;
