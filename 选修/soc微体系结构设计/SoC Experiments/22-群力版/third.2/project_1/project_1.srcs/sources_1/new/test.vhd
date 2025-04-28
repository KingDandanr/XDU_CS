----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/05/27 13:02:05
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
    input1,input2:in std_logic_vector(7 downto 0);
    s:in std_logic_vector(4 downto 0);
    f_in:in std_logic_vector(1 downto 0);
    c0:in std_logic;
    cy,zn:out std_logic
    );
end test;

architecture Behavioral of test is
component alu is
Port (m_a,m_b:in std_logic_vector(7 downto 0);
    c0:in std_logic;
    s:in std_logic_vector(4 downto 0);
    f_in:in std_logic_vector(1 downto 0);
    data: out std_logic_vector(7 downto 0);
    cy,zn: out std_logic );
end component;
component state is 
Port (clk, rst : in std_logic;
    seg_sel : out std_logic_vector(15 downto 0);
    seg_data : out std_logic_vector(7 downto 0);
    show:in std_logic_vector(63 downto 0) );
end component;
signal showw: std_logic_vector(63 downto 0);
begin
showw(15 downto 8)<=input2;
showw(23 downto 16)<=input1;
u1:alu port map(m_a=>input1,m_b=>input2,c0=>c0,s=>s,f_in=>f_in,data=>showw(7 downto 0),cy=>cy,zn=>zn);
u2:state port map(clk=>clk,rst=>rst,seg_sel=>seg_sel,seg_data=>seg_data,show=>showw);
end Behavioral;
