----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/24 13:29:19
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SP_tb is
--  Port ( );
end SP_tb;

architecture Behavioral of SP_tb is
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

signal clk_SP,nreset,SP_CS,SP_UP,SP_DN,nSP_EN:STD_LOGIC;
signal AR:std_logic_vector(6 downto 0);
signal DATA_BUS:std_logic_vector(7 downto 0);

begin

SP_inst:SP PORT MAP(clk_SP,nreset,SP_CS,SP_UP,SP_DN,nSP_EN,AR,DATA_BUS);

clock:process
begin
    clk_SP<='1';
    wait for 5ns;
    clk_SP<='0';
    wait for 5ns;
end process;

test:process
begin
    nreset<='0';
    SP_CS<='1';
    SP_UP<='0';
    SP_DN<='0';
    nSP_EN<='1';
    DATA_BUS<="ZZZZZZZZ";
    wait for 25ns;
    
    DATA_BUS<=x"0F";
    nreset<='1';
    wait for 25ns;
    
    SP_UP<='1';
    SP_DN<='0';
    nSP_EN<='0';
    wait for 25ns;
    
    SP_UP<='1';
    SP_DN<='0';
    nSP_EN<='0';
    wait for 25ns;
    
    SP_UP<='0';
    SP_DN<='1';
    nSP_EN<='0';
    wait for 25ns;
    
    wait;
    
end process;

end Behavioral;
