----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/04/01 10:59:05
-- Design Name: 
-- Module Name: FIFO_ring_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIFO_ring_tb is
--  Port ( );
end FIFO_ring_tb;

architecture Behavioral of FIFO_ring_tb is

component FIFO_ring
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
end component;

signal clk:std_logic;
signal rst:std_logic;
signal data_in:std_logic_vector(7 downto 0);
signal wr:std_logic;
signal rd:std_logic;
signal empty:std_logic;
signal full:std_logic;
signal data_out:std_logic_vector(7 downto 0);

begin

FIFO_ring_inst:FIFO_ring generic map(8,8)port map(clk,rst,data_in,wr,rd,empty,full,data_out);

clock:process
begin
    clk<='0';
    wait for 10ns;
    clk<='1';
    wait for 10ns;
end process;

reset:process
begin
    rst<='0';
    wait for 25ns;
    rst<='1';
    wait;
end process;

test:process
begin
    rd<='1';
    wr<='1';
    data_in<="00000000";
    wait for 50ns;
    data_in<="00000001";
    wr<='0';
    wait for 20ns;
    wr<='1';
    wait for 30ns;
    data_in<="00000010";
    wr<='0';
    wait for 20ns;
    wr<='1';
    wait for 30ns;
    data_in<="00000100";
    wr<='0';
    wait for 20ns;
    wr<='1';
    wait for 30ns;
    data_in<="00001000";
    wr<='0';
    wait for 20ns;
    wr<='1';
    wait for 30ns;
    data_in<="00010000";
    wr<='0';
    wait for 20ns;
    wr<='1';
    wait for 30ns;
    data_in<="00100000";
    wr<='0';
    wait for 20ns;
    wr<='1';
    wait for 30ns;
    data_in<="01000000";
    wr<='0';
    wait for 20ns;
    wr<='1';
    wait for 30ns;
    data_in<="10000000";
    wr<='0';
    wait for 20ns;
    wr<='1';
    wait for 50ns;
    
    rd<='0';
    wait for 20ns;
    rd<='1';
    wait for 30ns;
    rd<='0';
    wait for 20ns;
    rd<='1';
    wait for 30ns;
    rd<='0';
    wait for 20ns;
    rd<='1';
    wait for 30ns;
    rd<='0';
    wait for 20ns;
    rd<='1';
    wait for 30ns;
    rd<='0';
    wait for 20ns;
    rd<='1';
    wait for 30ns;
    rd<='0';
    wait for 20ns;
    rd<='1';
    wait for 30ns;
    rd<='0';
    wait for 20ns;
    rd<='1';
    wait for 30ns;
    rd<='0';
    wait for 20ns;
    rd<='1';
    wait for 30ns;
    
    wait;
    
end process;

end Behavioral;
