----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 13:02:24
-- Module Name: FIFO_ring_test - Behavioral
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FIFO_ring_test is
generic(
    CLK_FRE:integer:=100000000;
    cycle_max:positive:=3;--最大读写圈数
    depth:positive:=3;
    width:positive:=8
);
    Port(
        clk:in std_logic;
        rst:in std_logic;
        key_in:in std_logic;
        data_in:in std_logic_vector(7 downto 0);
        wr:in std_logic;
        rd:in std_logic;
        
        empty:out std_logic;
        full:out std_logic;
        data_out:out std_logic_vector(7 downto 0)
    );
end FIFO_ring_test;

architecture Behavioral of FIFO_ring_test is

component key_stroke
    generic(CLK_FRE:integer:=100000000);
    Port (
        clk:in std_logic;
        reset:in std_logic;
        key_in:in std_logic;
        output:out std_logic           
    );
end component;
component FIFO_ring
generic(
    cycle_max:positive:=3;--最大读写圈数
    depth:positive:=3;
    width:positive:=8
);
    Port(
        clk,clk_rd,clk_wr:in std_logic;
        rst:in std_logic;
        data_in:in std_logic_vector(7 downto 0);
        wr:in std_logic;
        rd:in std_logic;
        
        empty:out std_logic;
        full:out std_logic;
        data_out:out std_logic_vector(7 downto 0)
    );
end component;

signal out_put:std_logic;

begin
key_stroke_inst:key_stroke generic map(CLK_FRE)port map(clk=>clk,reset=>rst,key_in=>key_in,output=>out_put);
FIFO_ring_inst:FIFO_ring generic map(cycle_max,depth,width)port map(rst=>rst,clk=>clk,clk_rd=>out_put,clk_wr=>out_put,wr=>wr,rd=>rd,data_in=>data_in,full=>full,empty=>empty,data_out=>data_out);

end Behavioral;
