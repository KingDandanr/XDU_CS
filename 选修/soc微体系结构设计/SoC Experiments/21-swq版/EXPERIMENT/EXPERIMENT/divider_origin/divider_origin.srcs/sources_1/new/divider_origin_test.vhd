----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 19:49:35
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider_origin_test is
    Port(
        rst,clk,start:in std_logic;
        ain:in std_logic_vector(15 downto 0);--除数(要求除数大于被除数！)
        bin:in std_logic_vector(7 downto 0);--被除数
        done:out std_logic;

        seg_dig:out std_logic_vector(15 downto 0);
        seg_data:out std_logic_vector(7 downto 0)--管脚连接顺序：dp,g,f,e,d,c,b,a
    );
end divider_origin_test;

architecture Behavioral of divider_origin_test is
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
        
        sel_out:out std_logic_vector(15 downto 0);
        seg_data:out std_logic_vector(7 downto 0)--管脚连接顺序：dp,g,f,e,d,c,b,a
    );
end component;
component divider_origin
    Port(
        clk,start:in std_logic;
        ain:in std_logic_vector(15 downto 0);--除数(要求除数大于被除数！)
        bin:in std_logic_vector(7 downto 0);--被除数
        done:out std_logic;

        s,r:out std_logic_vector(7 downto 0)
    );
end component;

signal clk_line:std_logic;
signal s,r:std_logic_vector(7 downto 0);
signal data_in_A,data_in_B,data_in_C,data_in_D:std_logic_vector(15 downto 0);

begin

clk_div_inst:clk_div generic map(10000)port map(rst,clk,clk_line);
seg_dis_inst:seg_dis port map(rst,clk_line,data_in_A,data_in_B,data_in_C,data_in_D,seg_dig,seg_data);
divider_origin_inst:divider_origin port map(clk,start,ain,bin,done,s,r);

process(s,r,ain,bin)
begin
    data_in_A<="00000000"&s;
    data_in_B<="00000000"&r;
    data_in_C<="00000000"&bin;
    data_in_D<=ain;
end process;

end Behavioral;
