----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/25 16:09:02
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uC_test is
    Port(
        clk:in std_logic;    --微程序控制器时钟信号
        nreset:in std_logic;    --复位信号
        M_uA:in std_logic;      --微地址控制信号
        IR:in std_logic_vector(7 downto 2); --IR操作码信息
        CMROM_CS:in std_logic;  --控制存储器选通信号
        
        seg_dig : out std_logic_vector(15 downto 0);
        seg_data : out std_logic_vector(7 downto 0)
    );
end uC_test;

architecture Behavioral of uC_test is
component uC
    Port(
        clk_uC:in std_logic;    --微程序控制器时钟信号
        nreset:in std_logic;    --复位信号
        M_uA:in std_logic;      --微地址控制信号
        IR:in std_logic_vector(7 downto 2); --IR操作码信息
        CMROM_CS:in std_logic;  --控制存储器选通信号
        
        CM:out std_logic_vector(47 downto 8)    --控制信号输出
    );
end component;
component clock
    Port(
        clk,rst:in std_logic;
        clk1,nclk1:out std_logic;   --clk
        clk2,nclk2:out std_logic;   --clk二分频
        w0,w1,w2,w3:out std_logic   --节拍信号
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

signal clk_line,clk_line2,clk_uC,clk2,w0:std_logic;
signal data_in_A,data_in_B,data_in_C,data_in_D:std_logic_vector(15 downto 0); 
signal CM_line:std_logic_vector(47 downto 8);

begin

uC_inst:uC port map(clk_uC,nreset,M_uA,IR,CMROM_CS,CM_line);
clock_inst:clock port map(clk=>clk_line2,rst=>nreset,clk2=>clk2,w0=>w0);
clk_div_inst:clk_div generic map(10000)port map(nreset,clk,clk_line);
clk_div_inst2:clk_div generic map(10000000)port map(nreset,clk,clk_line2);
seg_dis_inst:seg_dis port map(nreset,clk_line,data_in_A,data_in_B,data_in_C,data_in_D,seg_dig,seg_data);

process(clk2,w0)
begin
    clk_uC<=clk2 and w0;
end process;

process(IR,CM_line)
begin
    data_in_A<="0000000000"&IR;
    data_in_B<=CM_line(15 downto 8)&"00000000";
    data_in_C<=CM_line(31 downto 16);
    data_in_D<=CM_line(47 downto 32);
end process;

end Behavioral;

