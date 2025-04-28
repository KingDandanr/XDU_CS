----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/20 10:29:36
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IR_test is
    port (
        rst,clk_IR,LD_IR1,LD_IR2,LD_IR3,nARen:in std_logic;
        
        RS,RD:out std_logic;--传送操作寄存器（寄存器地址）
        
        data_in:in std_logic_vector(7 downto 0);
        seg_dig:out std_logic_vector(15 downto 0);
        seg_data:out std_logic_vector(7 downto 0)--管脚连接顺序：dp,g,f,e,d,c,b,a
    );
end IR_test;

architecture Behavioral of IR_test is
component IR
    Port (
        rst,clk_IR,LD_IR1,LD_IR2,LD_IR3,nARen:in std_logic;
        DATA_BUS:in std_logic_vector(7 downto 0);
        
        IR_out:out std_logic_vector(7 downto 0);--传送指令到指令寄存器
        RS,RD:out std_logic;--传送操作寄存器（寄存器地址）
        PC_out:out std_logic_vector(11 downto 0);--PC地址总线
        AR:out std_logic_vector(6 downto 0)
    );
end component;
component clk_div  --用于数码管扫描
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
        
        sel_out:out std_logic_vector(15 downto 0);
        seg_data:out std_logic_vector(7 downto 0)--管脚连接顺序：dp,g,f,e,d,c,b,a
    );
end component;

signal clk_line: std_logic;
signal data_in_A,data_in_B,data_in_C,data_in_D:std_logic_vector(15 downto 0);
signal DATA_BUS_line :std_logic_vector(7 downto 0);
signal IR_line_line       :std_logic_vector(7 downto 0);--传送指令到指令寄存器
signal PC_out_line   :std_logic_vector(11 downto 0);--PC地址总线
signal AR_line       :std_logic_vector(6 downto 0);

begin

clk_div_inst:clk_div generic map(10000)port map(rst,clk_IR,clk_line);
sig_dis_inst:seg_dis port map(rst,clk_line,data_in_A,data_in_B,data_in_C,data_in_D,seg_dig,seg_data);
IR_inst:IR port map(rst,clk_IR,LD_IR1,LD_IR2,LD_IR3,nARen,DATA_BUS_line,IR_line_line,RS,RD,PC_out_line,AR_line);

process(data_in,DATA_BUS_line,IR_line_line,PC_out_line,AR_line)
begin
        DATA_BUS_line<=data_in;
        data_in_A<="00000000"&DATA_BUS_line;
        data_in_B<="00000000"&IR_line_line;
        data_in_C<="0000"&PC_out_line;
        data_in_D<="000000000"&AR_line;
end process;

end Behavioral;
