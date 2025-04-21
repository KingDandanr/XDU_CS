----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/06/02 23:58:02
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
Port (clk, rst : in std_logic;
    seg_sel : out std_logic_vector(15 downto 0);
    seg_data : out std_logic_vector(7 downto 0);
    clk_mc,m_ua,cmrom_cs:in std_logic;
    ir:in std_logic_vector(7 downto 2) );
end test;

architecture Behavioral of test is
signal showw:std_logic_vector(63 downto 0);
component state is
Port (clk, rst : in std_logic;
    key_in:in std_logic_vector(15 downto 0);
    seg_sel : out std_logic_vector(15 downto 0);
    seg_data : out std_logic_vector(7 downto 0);
    show:in std_logic_vector(63 downto 0) );
end component;
component micro_controller is
Port (clk_mc,m_ua,cmrom_cs:in std_logic;
    clkk,test,t1,t2:out std_logic;
    ir:in std_logic_vector(7 downto 2);
    arr:out std_logic_vector(7 downto 0);
    cm:out std_logic_vector(47 downto 8) );
end component;
begin
u1: state port map(clk=>clk,rst=>rst,seg_sel=>seg_sel,seg_data=>seg_data,show=>showw,key_in=>x"ffff");
u2: micro_controller port map(clk_mc=>clk,m_ua=>m_ua,cmrom_cs=>cmrom_cs,ir=>ir,cm=>showw(39 downto 0),clkk=>showw(60),test=>showw(56),t1=>showw(52),t2=>showw(48),arr=>showw(47 downto 40));
end Behavioral;
