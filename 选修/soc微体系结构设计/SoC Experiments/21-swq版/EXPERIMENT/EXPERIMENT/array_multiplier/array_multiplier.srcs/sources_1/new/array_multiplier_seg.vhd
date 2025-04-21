----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 13:02:24
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity array_multiplier_seg is
    Port (
        rst,clk:in std_logic;
        a_in,b_in:in std_logic_vector(7 downto 0);
        
        seg_dig:out std_logic_vector(15 downto 0);
        seg_data:out std_logic_vector(7 downto 0)
    );
end array_multiplier_seg;

architecture Behavioral of array_multiplier_seg is

component clk_div
    generic(
        DIV_NUM:integer:=10000
    );
    Port (
        clk_in:in std_logic;
        clk_out:out std_logic
    );
end component;
component array_multiplier
    Port (
        clk:in std_logic;
        a_in,b_in:in std_logic_vector(7 downto 0);
        sum_out:out std_logic_vector(15 downto 0)
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
signal sum_out_line:std_logic_vector(15 downto 0);
signal seg_dig_line:std_logic_vector(3 downto 0);

begin

clk_div_inst:clk_div generic map(10000)port map(clk,clk_out_line);
array_multiplier_inst:array_multiplier port map(clk_out_line,a_in,b_in,sum_out_line);
seg_dis_inst:seg_dis port map(rst,clk_out_line,sum_out_line,"0000000000000000","0000000000000000","0000000000000000",seg_dig_line,seg_data);
decoder4_16_inst:decoder4_16 port map(seg_dig_line,seg_dig);

end Behavioral;
