----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 13:02:24
-- Module Name: FIFO_ring_duaram_controller - Behavioral
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FIFO_ring_duaram_controller is
generic(
    cycle_max:positive;--×î´ó¶ÁÐ´È¦Êý
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
end FIFO_ring_duaram_controller;

architecture Behavioral of FIFO_ring_duaram_controller is
signal wr_pt_t:std_logic_vector(depth+cycle_max-1 downto 0);
signal rd_pt_t:std_logic_vector(depth+cycle_max-1 downto 0);
signal full_line:std_logic;
signal empty_line:std_logic;
begin

--write_pointer
process(rst,clka)
begin
    if(rst='0')then
        wr_pt_t<=(others=>'0');
    elsif(clka'event and clka='1')then
        if (wq='0'and full_line='0')then wr_pt_t<=wr_pt_t+1;end if;
    end if;     
end process;

--read_pointer
process(rst,clkb)
begin
    if(rst='0')then
        rd_pt_t<=(others=>'0');
    elsif(clkb'event and clkb='1')then
        if (rq='0'and empty_line='0')then 
rd_pt_t<=rd_pt_t+1;
end if;
    end if;
end process;

--judge_status
process(rst,clk)
begin
    if(rst='0')then empty_line<='1';full_line<='0';
    elsif(clk'event and clk='1')then
        if(wr_pt_t=rd_pt_t)then empty_line<='1';full_line<='0';
        elsif(wr_pt_t=rd_pt_t+2**depth)then empty_line<='0';full_line<='1';
        else empty_line<='0';full_line<='0';
        end if;
    end if;  
end process;

process(wr_pt_t)
begin wr_pt<=wr_pt_t(depth-1 downto 0);
end process;

process(rd_pt_t)
begin rd_pt<=rd_pt_t(depth-1 downto 0);
end process;

process(empty_line)
begin empty<=empty_line;
end process;

process(full_line)
begin full<=full_line;
end process;

end Behavioral;
