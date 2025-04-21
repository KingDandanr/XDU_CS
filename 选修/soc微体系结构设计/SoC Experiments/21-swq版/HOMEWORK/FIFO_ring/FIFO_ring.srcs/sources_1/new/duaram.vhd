----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/04/01 12:13:44
-- Design Name: 
-- Module Name: duaram - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity duaram is
generic(
    depth:positive :=8;
    width:positive:=8
);
Port(
    clka:in std_logic;
    wr:in std_logic;
    addra:in std_logic_vector(depth-1 downto 0);
    datain:in std_logic_vector(width-1 downto 0);
    
    clkb:in std_logic;
    rd:in std_logic;
    addrb:in std_logic_vector(depth-1 downto 0);
    dataout:out std_logic_vector(width-1 downto 0)
);
end duaram;

architecture Behavioral of duaram is

type ram is array(2**depth-1 downto 0)of std_logic_vector(width-1 downto 0);
signal dualram:ram;

begin

process(clka,clkb)
begin
    if(clka'event and clka='1')then
        if(wr='0')then dualram(conv_integer(addra))<=datain;end if;
    end if;
end process;

process(clkb)
begin
    if(clkb'event and clkb='1')then
        if(rd='0')then dataout<=dualram(conv_integer(addrb));end if;
    end if;
end process;

end Behavioral;
