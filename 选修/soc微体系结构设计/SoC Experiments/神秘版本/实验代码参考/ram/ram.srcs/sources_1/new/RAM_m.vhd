----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/27 18:07:01
-- Design Name: 
-- Module Name: RAM_m - Behavioral
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

entity RAM_m is
Port ( 
        clk_RAM: in std_logic;
        n_reset: in std_logic;
        RAM_CS: in std_logic;
        nRAM_EN: in std_logic;
        wr_nRD: in std_logic;
        AR: in std_logic_vector(6 downto 0);
        data:in std_logic_vector(7 downto 0);           --仅上板子，组装模块：data:inout std_logic_vector(7 downto 0)
        data_out: out std_logic_vector(7 downto 0)      --删去
);
end RAM_m;

architecture Behavioral of RAM_m is
type max is array(integer range<>) of std_logic_vector(7 downto 0);         --定义数据类型
signal tmp: max(0 to 2**7-1);       --定义ram空间
begin

process(clk_RAM)
begin
    if(clk_RAM'event and clk_RAM = '1')then
        if(n_reset = '0')then
            data_out <= "00000000";     --模块：data <= "00000000";
        else
            if(RAM_CS = '1'and wr_nRD = '0' and nRAM_EN = '0')then
                data_out <= tmp(conv_integer(AR));    --模块：data <= tmp(AR);
            elsif(RAM_CS = '1' and wr_nRD = '1')then
                tmp(conv_integer(AR)) <= data;
            end if;
        end if;
    end if;
end process;

end Behavioral;
