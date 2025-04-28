----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 13:02:24
-- Module Name: FIFO_ring - Behavioral
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FIFO_ring is
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
end FIFO_ring;

architecture Behavioral of FIFO_ring is
component duaram
generic(
    depth:positive:=3;
    width:positive:=8
);
Port(
    clka:in std_logic;
    wr:in std_logic;
    wr_en:in std_logic;
    addra:in std_logic_vector(depth-1 downto 0);
    datain:in std_logic_vector(width-1 downto 0);
    
    clkb:in std_logic;
    rd:in std_logic;
    rd_en:in std_logic;
    addrb:in std_logic_vector(depth-1 downto 0);
    dataout:out std_logic_vector(width-1 downto 0)
); 
end component;
component FIFO_ring_duaram_controller
generic(
    cycle_max:positive;--最大读写圈数
    depth:positive
);
Port(
    rst:in std_logic;
    clk,clka,clkb:in std_logic;
    wq:in std_logic;
    rq:in std_logic;
    full:out std_logic;
    empty:out std_logic;
    
    wr_pt:out std_logic_vector(depth-1 downto 0);
    rd_pt:out std_logic_vector(depth-1 downto 0)
);
end component;

signal rp_line:std_logic_vector(depth-1 downto 0);
signal wp_line:std_logic_vector(depth-1 downto 0);
signal empty_line:std_logic;
signal full_line:std_logic;

begin
duaram_inst:duaram generic map(depth,width)port map(clka=>clk_wr,clkb=>clk_rd,datain=>data_in,dataout=>data_out,addra=>wp_line,addrb=>rp_line,rd=>rd,wr=>wr,rd_en=>empty_line,wr_en=>full_line);
FIFO_ring_duaram_controller_inst:FIFO_ring_duaram_controller generic map(cycle_max,depth)port map(rst=>rst,clk=>clk,clkb=>clk_rd,clka=>clk_wr,wq=>wr,rq=>rd,full=>full_line,empty=>empty_line,wr_pt=>wp_line,rd_pt=>rp_line);

process(empty_line,full_line)
begin
    empty<=empty_line;
    full<=full_line;
end process;

end Behavioral;
