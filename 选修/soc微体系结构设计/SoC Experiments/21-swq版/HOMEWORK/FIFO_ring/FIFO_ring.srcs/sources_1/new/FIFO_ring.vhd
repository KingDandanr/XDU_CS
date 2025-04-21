----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/04/01 10:58:43
-- Design Name: 
-- Module Name: FIFO_ring - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIFO_ring is
generic(
    depth:positive :=8;
    width:positive:=8
);
    Port(
        clk:in std_logic;
        rst:in std_logic;
        data_in:in std_logic_vector(7 downto 0);
        wr:in std_logic;
        rd:in std_logic;
--        wr_clr:in std_logic;
--        wr_en:in std_logic;
--        rd_clr:in std_logic;
--        rd_en:in std_logic;
        
        empty:out std_logic;
        full:out std_logic;
        data_out:out std_logic_vector(7 downto 0)
    );
end FIFO_ring;

architecture Behavioral of FIFO_ring is
component duaram
generic(
    depth:positive :=8;
    width:positive:=8
);
Port(
    clka:in std_logic;
    wr:in std_logic;
    addra:in std_logic_vector(depth-1 downto 0);
    datain:in std_logic_vector(width-1 downto 0);
    
    clkb:in std_logic;
    rd:in std_logic;
    addrb:in std_logic_vector(depth-1 downto 0);
    dataout:out std_logic_vector(width-1 downto 0)
); 
end component;
component write_pointer
    generic(
        depth:positive
    );
    Port(
        clk:in std_logic;
        rst:in std_logic;
        wq:in std_logic;
        wr_pt:out std_logic_vector(depth-1 downto 0)
    );
end component;
component read_pointer
    generic(
        depth:positive
    );
    Port(
        clk:in std_logic;
        rst:in std_logic;
        rq:in std_logic;
        rd_pt:out std_logic_vector(depth-1 downto 0)
    );
end component;
component judge_status
    generic(
        depth:positive
    );
    port(
        clk:in std_logic;
        rst:in std_logic;
        wr_pt:in std_logic_vector(depth-1 downto 0);
        rd_pt:in std_logic_vector(depth-1 downto 0);
        empty:out std_logic;
        full:out std_logic
    );
end component;

signal rp_line:std_logic_vector(depth-1 downto 0);
signal wp_line:std_logic_vector(depth-1 downto 0);

begin
duaram_inst:duaram generic map(depth,width)port map(clka=>clk,clkb=>clk,datain=>data_in,dataout=>data_out,addra=>wp_line,addrb=>rp_line,rd=>rd,wr=>wr);
write_pointer_inst:write_pointer generic map(depth)port map(clk=>clk,rst=>rst,wq=>wr,wr_pt=>wp_line);
read_pointer_inst:read_pointer generic map(depth)port map(clk=>clk,rst=>rst,rq=>rd,rd_pt=>rp_line);
judge_status_inst:judge_status generic map(depth)port map(clk=>clk,rst=>rst,wr_pt=>wp_line,rd_pt=>rp_line,full=>full,empty=>empty);


end Behavioral;
