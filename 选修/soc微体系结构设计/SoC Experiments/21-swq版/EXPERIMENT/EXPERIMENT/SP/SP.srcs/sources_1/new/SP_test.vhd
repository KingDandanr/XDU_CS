----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/24 13:45:37
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SP_test is
    Port(
        clk:in std_logic;       --时钟信号
        nreset:in std_logic;    --复位信号                
        SP_CS:in std_logic;     --SP选择信号
        SP_UP:in std_logic;     --SP+1控制
        SP_DN:in std_logic;     --SP-1控制
        nSP_EN:in std_logic;    --SP输出使能
        key_in:in std_logic;    --按键时钟
        
        AR:out std_logic_vector(6 downto 0);--SP指向RAM地址
        --data_in:in std_logic_vector(7 downto 0);
        --data_out:out std_logic_vector(7 downto 0)
        DATA_BUS:inout std_logic_vector(7 downto 0)   --数据总线
    );
end SP_test;

architecture Behavioral of SP_test is
component SP
    Port(
        clk_SP:in std_logic;    --SP时钟信号
        nreset:in std_logic;    --复位信号                
        SP_CS:in std_logic;     --SP选择信号
        SP_UP:in std_logic;     --SP+1控制
        SP_DN:in std_logic;     --SP-1控制
        nSP_EN:in std_logic;    --SP输出使能
        
        AR:out std_logic_vector(6 downto 0);--SP指向RAM地址
        --data_in:in std_logic_vector(7 downto 0);
        --data_out:out std_logic_vector(7 downto 0)
        DATA_BUS:inout std_logic_vector(7 downto 0)   --数据总线
    );
end component;
component key_stroke
    generic(CLK_FRE:integer:=100000000);
    Port (
        clk:in std_logic;
        reset:in std_logic;
        key_in:in std_logic;
        output:out std_logic           
    );
end component;

signal clk_line:STD_LOGIC;

begin

key_stroke_inst:key_stroke generic map(100000000)port map(clk,nreset,key_in,clk_line);
SP_inst:SP PORT MAP(clk_line,nreset,SP_CS,SP_UP,SP_DN,nSP_EN,AR,DATA_BUS);


end Behavioral;
