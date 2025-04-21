----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/23 13:34:13
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_tb is
--  Port ( );
end ALU_tb;

architecture Behavioral of ALU_tb is
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
        
        DATA_BUS : inout std_logic_vector(7 downto 0);  --数据总线
        AC : out std_logic;     --半进位标志
        CY : out std_logic;     --进位标志
        ZN : out std_logic;     --零标志
        OV : out std_logic      --溢出标志
    );
end component;

signal clk,nclk2,nreset,m_A,m_B,m_F,nALU_EN,nPSW_EN,C0:std_logic;

signal S :std_logic_vector(4 downto 0);
signal F_in :std_logic_vector(1 downto 0);     
signal DATA_BUS:std_logic_vector(7 downto 0);   
signal AC : std_logic;     --半进位标志
signal CY : std_logic;     --进位标志
signal ZN : std_logic;     --零标志
signal OV : std_logic;      --溢出标志

begin
ALU_inst:ALU port map(clk,nclk2,nreset,m_A,m_B,m_F,nALU_EN,nPSW_EN,C0,S,F_in,DATA_BUS,AC,CY,ZN,OV);

clock:process
begin
    clk<='1';
    wait for 5ns;
    clk<='0';
    wait for 5ns;
end process;

clock_nclk2:process
begin
    nclk2<='0';
    wait for 10ns;
    nclk2<='1';
    wait for 10ns;
end process;

test:process
begin
    nreset<='1';
    M_A<='0';
    M_B<='0';
    M_F<='0';
    nALU_EN<='1';
    nPSW_EN<='1';
    C0<='0';
    S<="10010";
    F_in<="00";
    wait for 25ns;
    
    nreset<='0';
    DATA_BUS<=X"04";
    M_A<='1';
    M_B<='0';
    wait for 25ns;
    DATA_BUS<=X"02";
    M_A<='0';
    M_B<='1';
    wait for 25ns;
--    DATA_BUS<="ZZZZZZZZ";
    M_A<='0';
    M_B<='0';
    nALU_EN<='0';
    wait for 50ns;
    
    nALU_EN<='1';
    nPSW_EN<='0';
    wait;
    
end process;

end Behavioral;
