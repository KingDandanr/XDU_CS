----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 19:49:35
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity divider_origin_16bitreg is
    Port (
        clk,rst:in std_logic;
        ain:in std_logic_vector(15 downto 0);
        d:in std_logic_vector(8 downto 0);
        c_out:out std_logic;
        q:out std_logic_vector(15 downto 0)
     );
end divider_origin_16bitreg;

architecture Behavioral of divider_origin_16bitreg is

begin

process(clk,rst)
variable sr16b:std_logic_vector(15 downto 0);
begin
    if rst='1'then
        sr16b:=ain;
        c_out<=sr16b(15);--发送符号位
        sr16b(15 downto 1):=sr16b(14 downto 0);--左移一位
        sr16b(0):='0';--上0
    elsif(clk='1'and clk'event)then  
        sr16b(15 downto 8):=d(7 downto 0);
        c_out<=sr16b(15);--发送符号位
        sr16b(15 downto 1):=sr16b(14 downto 0);--左移一位
        sr16b(0):=not d(8);    --上商取反符号位
    end if;   
    q<=sr16b;
end process;

end Behavioral;
