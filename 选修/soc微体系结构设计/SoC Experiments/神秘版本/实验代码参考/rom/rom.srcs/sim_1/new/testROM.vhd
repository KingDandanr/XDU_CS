----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/05/13 19:29:38
-- Design Name: 
-- Module Name: testROM - Behavioral
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

entity testROM is
--  Port ( );
end testROM;

architecture Behavioral of testROM is
component rom_dled
  Port (
    addr:in std_logic_vector(7 downto 0);
    oe:in std_logic;                        --使能信号
    clk,rst: in std_logic;
    sel:out std_logic_vector(1 downto 0);   --选择信号，只需要用两个引脚
    dis:out std_logic_vector(7 downto 0)    --输出数码管
  );
end component;
signal addr:std_logic_vector(7 downto 0):="00000000";
signal oe:std_logic:='1';
signal clk,rst:std_logic:='0';
signal sel:std_logic_vector(1 downto 0):="11";
signal dis:std_logic_vector(7 downto 0):="11111111";
constant clk_period : time := 10 ns;

begin
U1: rom_dled  port map(addr,oe,clk,rst,sel,dis);
clk <= not clk after clk_period/2;  --生成占空比为50%的时钟;
process
begin
wait for 20 ns;
oe<='0';
wait for 20 ns;
addr<="00000000";

wait for 20 ns;
addr<="00000001";
wait for 20 ns;
addr<="00000010";
wait for 20 ns;
addr<="00000011";
wait;
end process;

end Behavioral;
