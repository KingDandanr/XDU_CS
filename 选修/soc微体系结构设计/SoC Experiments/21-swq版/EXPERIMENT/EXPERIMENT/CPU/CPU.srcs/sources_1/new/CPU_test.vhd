----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/27 20:08:24
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU_test is
    generic(
        CLK_FRE:integer:=100000000
    );
    Port(
        clk:in std_logic;
        nreset:in std_logic;
        data_in:in std_logic_vector(7 downto 0);
        
        seg_dig:out std_logic_vector(15 downto 0);
        seg_data:out std_logic_vector(7 downto 0)--管脚连接顺序：dp,g,f,e,d,c,b,a
    );
end CPU_test;

architecture Behavioral of CPU_test is
component CPU
    generic(
        CLK_FRE:integer:=100000000
    );
    Port(
        clk:in std_logic;
        nreset:in std_logic;
        data_in:in std_logic_vector(7 downto 0);
        
        regA_out,regB_out,result_out:out std_logic_vector(7 downto 0);
        data_out:out std_logic_vector(7 downto 0)
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
signal clk_line:std_logic;
signal data_in_A,data_in_B,data_in_C,data_in_D:std_logic_vector(15 downto 0);
signal regA_out,regB_out,result_out,data_out:std_logic_vector(7 downto 0);
begin
clk_div_inst:clk_div generic map(1000000)port map(nreset,clk,clk_line);
seg_dis_inst:seg_dis port map(nreset,clk_line,data_in_A,data_in_B,data_in_C,data_in_D,seg_dig,seg_data);
CPU_inst:CPU generic map(100000000)port map(clk_line,nreset,data_in,regA_out,regB_out,result_out,data_out);

process(regA_out,regB_out,result_out,data_out)
begin
    data_in_A<="00000000"&result_out;
    data_in_B<="00000000"&regB_out;
    data_in_C<="00000000"&regA_out;
    data_in_D<="00000000"&data_out;
end process;

end Behavioral;
