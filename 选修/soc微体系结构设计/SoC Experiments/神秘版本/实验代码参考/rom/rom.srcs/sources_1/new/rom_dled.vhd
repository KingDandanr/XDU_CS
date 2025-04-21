----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/05/19 10:55:10
-- Design Name: 
-- Module Name: rom_dled - Behavioral
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

entity rom_dled is
  Port (
    addr:in std_logic_vector(7 downto 0);
    oe:in std_logic;                        --使能信号
    clk,rst: in std_logic;
    sel:out std_logic_vector(1 downto 0);   --选择信号，只需要用两个引脚
    dis:out std_logic_vector(7 downto 0)    --输出数码管
  );
end rom_dled;

architecture Behavioral of rom_dled is
component MyRom is
  generic(
    wordlength:integer:=8;
    addrlength:integer:=8
  );
  Port (
    addr:in std_logic_vector(addrlength-1 downto 0);
    oe:in std_logic;
    dout:out std_logic_vector(wordlength-1 downto 0)
  );
end component;
component DLED is
  Port (
    data: in std_logic_vector(7 downto 0);
    clk,rst: in std_logic;
    sel:out std_logic_vector(1 downto 0);   --选择信号，只需要用两个引脚
    dis:out std_logic_vector(7 downto 0)    --输出数码管
   );
end component;
signal temp: std_logic_vector(7 downto 0):="00000000";
begin
U1: MyRom port map(addr,oe,temp);
U2: DLED port map(temp,clk,rst,sel,dis);
end Behavioral;
