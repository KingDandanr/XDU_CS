----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/05/22 13:00:19
-- Design Name: 
-- Module Name: TestAddSubDiv - Behavioral
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
--除数：拨动开关sw8 ，3-0
--被除数：拨动开关sw24，23-16
--load：sw15
--done：led16
--sign：led14
--余数/商绝对值：led10-5/4-0

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TestAddSubDiv is
--  Port ( );
end TestAddSubDiv;

architecture Behavioral of TestAddSubDiv is

	signal da1:std_logic_vector(10 downto 0):="00000000000";	--
	--signal result1:std_logic_vector(9 downto 0):="0000000000";
    signal dividend1:std_logic_vector(8 downto 0):="000000000";     --
    signal divisor1:std_logic_vector(4 downto 0):="00000";     --
    signal clk1:std_logic:='0';
	signal load1:std_logic:='0';
	signal done1:std_logic:='0';
    constant per:time:=10ns;
	
	--signal dividend_value1: std_logic_vector(9 downto 0);
	--signal dividend_value94: std_logic_vector(5 downto 0);
    --signal divisor_value1: std_logic_vector(5 downto 0);
    ---signal divisor_complement1: std_logic_vector(5 downto 0);
    signal sign1: std_logic := '0';

component Divider is
--  Port ( );
	port(dividend:in std_logic_vector(8 downto 0);
		divisor:in std_logic_vector(4 downto 0);
		clk:in std_logic;
		load:in std_logic;
		done:out std_logic;
		--dividend_value2:out std_logic_vector(9 downto 0);
		--dividend_value94:out std_logic_vector(5 downto 0);
		--divisor_value2:out std_logic_vector(5 downto 0);
		--divisor_complement2:out std_logic_vector(5 downto 0);
		sign:out std_logic;
		da:out std_logic_vector(10 downto 0)
		--result: out std_logic_vector(9 downto 0)
		);
		
end component;
begin
uut:Divider
	--port map(dividend1,divisor1,clk1,load1,done1,dividend_value1,divisor_value1,divisor_complement1,control1,da1);
	--port map(dividend1,divisor1,clk1,load1,done1,dividend_value94,control1,da1);
	
	port map(dividend1,divisor1,clk1,load1,done1,sign1,da1);
process
    begin
    for n in 0 TO 50 LOOP
		wait for per;
        clk1<='1';
        wait for per;
        clk1<='0';
	end LOOP;
end process;
process
    begin
	wait for per*4;
	dividend1<="000010101";    --110001011,01110
	divisor1<="00110";
    wait for per*4;
    load1<='1';
    wait for per*4;  
    load1<='0';
wait;
end process;

end Behavioral;
