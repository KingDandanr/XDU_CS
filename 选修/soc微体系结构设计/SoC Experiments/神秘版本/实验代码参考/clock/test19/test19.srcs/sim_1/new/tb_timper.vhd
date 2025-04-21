----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/27 10:49:21
-- Design Name: 
-- Module Name: tb_timper - Behavioral
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

entity tb_timper is
--  Port ( );
end tb_timper;

architecture Behavioral of tb_timper is
component timper is
Port (
        clk: in std_logic;
        rstn: in std_logic;
        clk1: out std_logic;
        clk2: out std_logic;
        nclk1: out std_logic;
        nclk2: out std_logic;
        w0: out std_logic;
        w1: out std_logic;
        w2: out std_logic;
        w3: out std_logic
        
);
end component;

signal clk,rstn,clk1,clk2,nclk1,nclk2,w0,w1,w2,w3: std_logic :='0';
begin
uut: timper port map(clk,rstn,clk1,clk2,nclk1,nclk2,w0,w1,w2,w3);

process
begin
rstn <= '0';
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';

rstn <= '1';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
clk <= '0';
wait for 10ns;

end process;


end Behavioral;
