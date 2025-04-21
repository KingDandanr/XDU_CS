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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mul4_c is
Port ( 
        x: in std_logic_vector(3 downto 0);
        y: in std_logic_vector(3 downto 0);
        sum_out: out std_logic_vector(7 downto 0)
);
end mul4_c;

architecture Behavioral of mul4_c is

component mul_add is
port(
        a: in std_logic;
        b: in std_logic;
        s_in: in std_logic;
        c_in: in std_logic;
        
        s: out std_logic;
        c_out: out std_logic
);

end component;

signal si0: std_logic := '0';
signal ci0: std_logic := '0';
signal s0: std_logic := '0';
signal co0: std_logic := '0';

signal si1: std_logic := '0';
signal ci1: std_logic := '0';
signal s1: std_logic := '0';
signal co1: std_logic := '0';

signal si2: std_logic := '0';
signal ci2: std_logic := '0';
signal s2: std_logic := '0';
signal co2: std_logic := '0';

signal si3: std_logic := '0';
signal ci3: std_logic := '0';
signal s3: std_logic := '0';
signal co3: std_logic := '0';

signal s4: std_logic := '0';
signal co4: std_logic := '0';

signal s5: std_logic := '0';
signal co5: std_logic := '0';

signal s6: std_logic := '0';
signal co6: std_logic := '0';

signal si7:std_logic := '0';
signal s7: std_logic := '0';
signal co7: std_logic := '0';

signal s8: std_logic := '0';
signal co8: std_logic := '0';

signal s9: std_logic := '0';
signal co9: std_logic := '0';

signal s10: std_logic := '0';
signal co10: std_logic := '0';

signal si11:std_logic := '0';
signal s11: std_logic := '0';
signal co11: std_logic := '0';

signal s12: std_logic := '0';
signal co12: std_logic := '0';

signal s13: std_logic := '0';
signal co13: std_logic := '0';

signal s14: std_logic := '0';
signal co14: std_logic := '0';

signal si15: std_logic := '0';
signal s15: std_logic := '0';
signal co15: std_logic := '0';

signal b16: std_logic := '0';
signal s16: std_logic := '0';
signal co16: std_logic := '0';

signal s17: std_logic := '0';
signal co17: std_logic := '0';

signal s18: std_logic := '0';
signal co18: std_logic := '0';

begin

f0: mul_add port map(x(0),y(0),si0,ci0,s0,co0);
f1: mul_add port map(x(0),y(1),si1,ci1,s1,co1);
f2: mul_add port map(x(0),y(2),si2,ci2,s2,co2);
f3: mul_add port map(x(0),y(3),si3,ci3,s3,co3);

f4: mul_add port map(x(1),y(0),s1,co0,s4,co4);
f5: mul_add port map(x(1),y(1),s2,co1,s5,co5);
f6: mul_add port map(x(1),y(2),s3,co2,s6,co6);
f7: mul_add port map(x(1),y(3),si7,si7,s7,co7);

f8: mul_add port map(x(2),y(0),s5,co4,s8,co8);
f9: mul_add port map(x(2),y(1),s6,co5,s9,co9);
f10: mul_add port map(x(2),y(2),s7,co6,s10,co10);
f11: mul_add port map(x(2),y(3),si11,si11,s11,co11);

f12: mul_add port map(x(3),y(0),s9,co8,s12,co12);
f13: mul_add port map(x(3),y(1),s10,co9,s13,co13);
f14: mul_add port map(x(3),y(2),s11,co10,s14,co14);
f15: mul_add port map(x(3),y(3),si15,si15,s15,co15);

f16: mul_add port map(b16,b16,s13,co12,s16,co16);
f17: mul_add port map(co16,co16,s14,co13,s17,co17);
f18: mul_add port map(co17,co17,s15,co14,s18,co18);

sum_out(0) <= s0;
sum_out(1) <= s4;
sum_out(2) <= s8;
sum_out(3) <= s12;
sum_out(4) <= s16;
sum_out(5) <= s17;
sum_out(6) <= s18;
sum_out(7) <= co18;

end Behavioral;
