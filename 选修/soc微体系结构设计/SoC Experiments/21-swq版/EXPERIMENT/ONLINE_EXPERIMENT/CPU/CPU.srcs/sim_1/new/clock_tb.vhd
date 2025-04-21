----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/04/01 21:19:28
-- Design Name: 
-- Module Name: clock_tb - Behavioral
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

entity clock_tb is
--  Port ( );
end clock_tb;

architecture Behavioral of clock_tb is
component clock
    Port(
        clk,rst:in std_logic;
        clk1,nclk1:out std_logic;   --clk
        clk2,nclk2:out std_logic;   --clk二分频
        w0,w1,w2,w3:out std_logic   --节拍信号
    );
end component;

signal clk,rst:std_logic;
signal clk1,nclk1:std_logic;   --clk
signal clk2,nclk2:std_logic;   --clk二分频
signal w0,w1,w2,w3:std_logic;  --节拍信号

begin
clock_inst:clock port map(clk,rst,clk1,nclk1,clk2,nclk2,w0,w1,w2,w3);

clock_gen:process
begin
    clk<='0';
    wait for 10ns;
    clk<='1';
    wait for 10ns;
end process;

reset_gen:process
begin
    rst<='0';
    wait for 25ns;
    rst<='1';
    wait;
end process;

end Behavioral;
