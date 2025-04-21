----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/21 09:16:32
-- Design Name: 
-- Module Name: mul8_c - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mul8_c is
Port ( 
        a: in std_logic_vector(7 downto 0);
        b: in std_logic_vector(7 downto 0);
        clk_in: in std_logic;
        sum_out: out std_logic_vector(15 downto 0)
);
end mul8_c;

architecture Behavioral of mul8_c is

component mul4_c is
port(
        x: in std_logic_vector(3 downto 0);
        y: in std_logic_vector(3 downto 0);
        sum_out: out std_logic_vector(7 downto 0)
);
end component;

component adder is
port(
        x: in std_logic;
        y: in std_logic;
        z: in std_logic;
        c_in: in std_logic;
        s: out std_logic;
        c_out: out std_logic
);
end component;

signal x:std_logic_vector(7 downto 0) := (others => '0');
signal y:std_logic_vector(7 downto 0) := (others => '0');
signal count: std_logic_vector(1 downto 0) := "00";

signal s0: std_logic_vector(7 downto 0) := (others => '0');
signal s1: std_logic_vector(7 downto 0) := (others => '0');
signal s2: std_logic_vector(7 downto 0) := (others => '0');
signal s3: std_logic_vector(7 downto 0) := (others => '0');

signal ss: std_logic := '0';

signal ci4: std_logic := '0';
signal co4: std_logic := '0';
signal co5: std_logic := '0';
signal co6: std_logic := '0';
signal co7: std_logic := '0';
signal co8: std_logic := '0';
signal co9: std_logic := '0';
signal co10: std_logic := '0';
signal co11: std_logic := '0';

begin

f0: mul4_c port map (x(3 downto 0),y(3 downto 0),s0);
f1: mul4_c port map (x(3 downto 0),y(7 downto 4),s1);
f2: mul4_c port map (x(7 downto 4),y(3 downto 0),s2);
f3: mul4_c port map (x(7 downto 4),y(7 downto 4),s3);

sum_out(0) <= s0(0);
sum_out(1) <= s0(1);
sum_out(2) <= s0(2);
sum_out(3) <= s0(3);

a4: adder port map(s0(4),s1(0),s2(0),ci4,sum_out(4),co4);
a5: adder port map(s0(5),s1(1),s2(1),co4,sum_out(5),co5);
a6: adder port map(s0(6),s1(2),s2(2),co5,sum_out(6),co6);
a7: adder port map(s0(7),s1(3),s2(3),co6,sum_out(7),co7);
a8: adder port map(s3(0),s1(4),s2(4),co7,sum_out(8),co8);
a9: adder port map(s3(1),s1(5),s2(5),co8,sum_out(9),co9);
a10: adder port map(s3(2),s1(6),s2(6),co9,sum_out(10),co10);
a11: adder port map(s3(3),s1(7),s2(7),co10,sum_out(11),co11);

sum_out(12) <= s3(4);
sum_out(13) <= s3(5);
sum_out(14) <= s3(6);
sum_out(15) <= a(7) xor b(7);

process(clk_in)
begin
    if(clk_in'event and clk_in = '1') then
        if(count = "00") then
            x <= a;
            x(7) <= '0';
        elsif(count = "01") then
            y <= b;
            y(7) <= '0';
        elsif(count = "11") then
            count <= "00";
        end if;
        count <= count + 1;
    end if;
end process;
end Behavioral;
