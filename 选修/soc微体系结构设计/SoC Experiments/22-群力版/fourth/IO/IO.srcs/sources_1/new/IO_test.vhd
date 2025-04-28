----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/24 14:37:22
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IO_test is
    Port(
        clk:in std_logic;    --IO时钟信号
        nreset:in std_logic;    --IO复位信号
        IO_CS:in std_logic;     --IO选择信号
        IO_IEN:in std_logic;    --IO输入使能
        IO_OEN:in std_logic;    --IO输出使能
        RI_EN:in std_logic;     --IO缓存器输入使能
        RO_EN:in std_logic;     --IO缓存器输出使能
        IO_in:in std_logic_vector(7 downto 0);          --IO输入
        
        seg_dig:out std_logic_vector(15 downto 0);
        seg_data:out std_logic_vector(7 downto 0)--管脚连接顺序：dp,g,f,e,d,c,b,a
    );
end IO_test;

architecture Behavioral of IO_test is

component IO
    Port(
        clk_IO:in std_logic;    --IO时钟信号
        nreset:in std_logic;    --IO复位信号
        IO_CS:in std_logic;     --IO选择信号
        IO_IEN:in std_logic;    --IO输入使能
        IO_OEN:in std_logic;    --IO输出使能
        RI_EN:in std_logic;     --IO缓存器输入使能
        RO_EN:in std_logic;     --IO缓存器输出使能
        IO_in:in std_logic_vector(7 downto 0);          --IO输入
        
        IO_out:out std_logic_vector(7 downto 0);        --IO输出
        DATA_BUS:inout std_logic_vector(7 downto 0)    --数据总线
    );
end component;
component clk_div
    generic(
        DIV_NUM:integer:=10000
    );
    Port (
        rst:in std_logic;
        clk_in:in std_logic;
        clk_out:out std_logic
    );
end component;
component seg_dis
    port(
        rst,clk:in std_logic;
        data_in_A,data_in_B,data_in_C,data_in_D:in std_logic_vector(15 downto 0);
        
        seg_dig:out std_logic_vector(15 downto 0);
        seg_data:out std_logic_vector(7 downto 0)--管脚连接顺序：dp,g,f,e,d,c,b,a
    );
end component;

signal clk_line,rst_seg:std_logic;
signal data_in_A,data_in_B,data_in_C,data_in_D:std_logic_vector(15 downto 0); 
signal IO_out,DATA_BUS:std_logic_vector(7 downto 0);

begin

IO_inst:IO port map(clk,nreset,IO_CS,IO_IEN,IO_OEN,RI_EN,RO_EN,IO_in,IO_out,DATA_BUS);
clk_div_inst:clk_div generic map(10000)port map(nreset,clk,clk_line);
seg_dis_inst:seg_dis port map(nreset,clk_line,data_in_A,data_in_B,data_in_C,data_in_D,seg_dig,seg_data);

process(IO_in,IO_out,DATA_BUS)
begin
    data_in_A<="00000000"&IO_in;
    data_in_B<="00000000"&DATA_BUS;
    data_in_C<="00000000"&IO_out;
    data_in_D<="0000000000000000";
end process;

end Behavioral;
