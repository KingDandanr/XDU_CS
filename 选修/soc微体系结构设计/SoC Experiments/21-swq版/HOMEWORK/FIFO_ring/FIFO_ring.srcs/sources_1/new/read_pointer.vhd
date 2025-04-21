----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/04/01 15:19:20
-- Design Name: 
-- Module Name: read_pointer - Behavioral
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

entity read_pointer is
    generic(
        depth:positive
    );
    Port(
        clk:in std_logic;
        rst:in std_logic;
        rq:in std_logic;
        rd_pt:out std_logic_vector(depth-1 downto 0)
    );
end read_pointer;

architecture Behavioral of read_pointer is

signal rd_pt_t:std_logic_vector(depth-1 downto 0);

begin
process(rst,clk)
begin
    if(rst='0')then
        rd_pt_t<=(others=>'0');
    elsif(clk'event and clk='1')then
        if rq='0'then rd_pt_t<=rd_pt_t+1;end if;
    end if;     
end process;
rd_pt<=rd_pt_t;
end Behavioral;
