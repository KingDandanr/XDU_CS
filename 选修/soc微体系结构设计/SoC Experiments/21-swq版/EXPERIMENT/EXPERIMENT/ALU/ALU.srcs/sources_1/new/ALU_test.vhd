----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/23 12:35:51
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU_test is
    port(
        clk : in std_logic; --全局时钟和ALU时钟
        nreset : in std_logic;      --全局复位信号
        M_A,M_B : in std_logic;     --暂存器控制信号
        M_F : in std_logic;         --程序状态字控制信号
        nALU_EN : in std_logic;     --alu运算结果输出使能
        nPSW_EN : in std_logic;     --psw输出使能
        C0 : in std_logic;          --进位输入
        S : in std_logic_vector(4 downto 0);        --运算类型和操作选择，M为最高位S(4),其余在低四位
        F_in : in std_logic_vector(1 downto 0);     --移位功能选择
        DATA_BUS : inout std_logic_vector(7 downto 0);  --数据总线
        
        seg_dig:out std_logic_vector(15 downto 0);
        seg_data:out std_logic_vector(7 downto 0)--管脚连接顺序：dp,g,f,e,d,c,b,a
    );
end ALU_test;

architecture Behavioral of ALU_test is
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
component ALU 
    port(
        clk,clk_ALU : in std_logic; --全局时钟和ALU时钟
        nreset : in std_logic;      --全局复位信号
        M_A,M_B : in std_logic;     --暂存器控制信号
        M_F : in std_logic;         --程序状态字控制信号
        nALU_EN : in std_logic;     --alu运算结果输出使能
        nPSW_EN : in std_logic;     --psw输出使能
        C0 : in std_logic;          --进位输入
        S : in std_logic_vector(4 downto 0);        --运算类型和操作选择，M为最高位S(4),其余在低四位
        F_in : in std_logic_vector(1 downto 0);     --移位功能选择
        
        regA_out,regB_out,result_out:out std_logic_vector(7 downto 0);
        DATA_BUS : inout std_logic_vector(7 downto 0);  --数据总线
        AC : out std_logic;     --半进位标志
        CY : out std_logic;     --进位标志
        ZN : out std_logic;     --零标志
        OV : out std_logic      --溢出标志
    );
end component;

signal nclk2,clk_line:std_logic;
signal data_in_A,data_in_B,data_in_C,data_in_D:std_logic_vector(15 downto 0);
signal regA_out,regB_out,result_out:std_logic_vector(7 downto 0);

signal AC : std_logic;     --半进位标志
signal CY : std_logic;     --进位标志
signal ZN : std_logic;     --零标志
signal OV : std_logic;      --溢出标志

begin
clock_inst:clock port map(clk=>clk,rst=>nreset,nclk2=>nclk2);
clk_div_inst:clk_div generic map(10000)port map(nreset,clk,clk_line);
seg_dis_inst:seg_dis port map(nreset,clk_line,data_in_A,data_in_B,data_in_C,data_in_D,seg_dig,seg_data);
ALU_inst:ALU port map(clk,nclk2,nreset,m_A,m_B,m_F,nALU_EN,nPSW_EN,C0,S,F_in,regA_out,regB_out,result_out,DATA_BUS,AC,CY,ZN,OV);

process(DATA_BUS,AC,CY,ZN,OV,regA_out,regB_out,result_out)
begin
    data_in_A<="00000000"&DATA_BUS;
    data_in_B<="000"& AC & "000" & CY & "000" & ZN & "000" & OV;
    data_in_C<=regA_out&regB_out;
    data_in_D<=result_out&"00000000";
end process;

end Behavioral;
