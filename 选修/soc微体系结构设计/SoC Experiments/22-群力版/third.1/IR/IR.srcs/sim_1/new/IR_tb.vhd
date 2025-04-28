----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/20 10:29:36
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IR_tb is
--  Port ( );
end IR_tb;

architecture Behavioral of IR_tb is
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

signal rst,clk_IR,LD_IR1,LD_IR2,LD_IR3,nARen,RS,RD: std_logic;
signal DATA_BUS :std_logic_vector(7 downto 0);
signal IR_line       :std_logic_vector(7 downto 0);--传送指令到指令寄存器
signal PC_out   :std_logic_vector(11 downto 0);--PC地址总线
signal AR       :std_logic_vector(6 downto 0);

begin

IR_inst:IR port map(rst=>rst,clk_IR=>clk_IR,LD_IR1=>LD_IR1,LD_IR2=>LD_IR2,LD_IR3=>LD_IR3,nARen=>nARen,DATA_BUS=>DATA_BUS,IR_out=>IR_line,RS=>RS,RD=>RD,PC_out=>PC_out,AR=>AR);

clock:process
begin
    clk_IR<='1';
    wait for 5ns;
    clk_IR<='0';
    wait for 5ns;
end process;

test:process
begin
    rst<='1';
    --DATA_BUS<=x"EE";
    DATA_BUS<="11111111";
    LD_IR1<='1';
    LD_IR2<='0';
    LD_IR3<='0';
    nARen<='1';
    wait for 25ns;
    rst<='0';
    wait for 20ns;
    DATA_BUS<=x"FA";
    LD_IR1<='0';
    LD_IR2<='1';
    LD_IR3<='0';
    nARen<='1';
    wait for 20ns;
    DATA_BUS<=x"BC";
    LD_IR1<='0';
    LD_IR2<='0';
    LD_IR3<='1';
    nARen<='0';   
    wait;
end process;

end Behavioral;
