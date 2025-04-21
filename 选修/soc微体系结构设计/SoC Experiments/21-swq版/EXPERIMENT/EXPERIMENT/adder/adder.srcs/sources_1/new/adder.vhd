----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 13:02:24
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity adder is
    Port (
        clk,rst:in std_logic;
        a,b:in std_logic_vector(7 downto 0);
        c:in std_logic;
        
        c_out:out std_logic;
        sel_out:out std_logic_vector(15 downto 0);
        seg_data:out std_logic_vector(7 downto 0)
     );
end adder;

architecture Behavioral of adder is

component clk_div
    generic(
        DIV_NUM:integer:=10000
    );
    Port (
        clk_in:in std_logic;
        clk_out:out std_logic
    );
end component;
component seg_dis
    port(
        rst,clk:in std_logic;
        data_in_A,data_in_B,data_in_C,data_in_D:in std_logic_vector(15 downto 0);
        seg_sel:out std_logic_vector(3 downto 0);
        seg_data:out std_logic_vector(7 downto 0)
    );
end component;
component decoder4_16
    Port (
        sel_in:in std_logic_vector(3 downto 0);
        sel_out:out std_logic_vector(15 downto 0)
     );
end component;

signal clk_out_line:std_logic;
signal sum_line:std_logic_vector(16 downto 0);
signal data_line:std_logic_vector(15 downto 0);
signal c_line:std_logic;
signal sel_out_line:std_logic_vector(3 downto 0);

begin

clk_div_inst:clk_div generic map(10000)port map(clk,clk_out_line);
seg_dis_inst:seg_dis port map(rst,clk_out_line,data_line,"0000000000000000","0000000000000000","0000000000000000",sel_out_line,seg_data);
decoder4_16_inst:decoder4_16 port map(sel_out_line,sel_out);

process(a,b,c)
begin  
    sum_line<=("00000000"&a)+("00000000"&b)+("0000000000000000"&c);
    data_line<=sum_line(15 downto 0);
    c_out<=sum_line(16);
end process;
    

end Behavioral;
