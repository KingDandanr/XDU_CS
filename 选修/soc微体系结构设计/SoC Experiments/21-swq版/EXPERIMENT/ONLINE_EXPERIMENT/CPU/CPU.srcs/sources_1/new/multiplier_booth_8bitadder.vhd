library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity multiplier_booth_8bitadder is
    Port (
        clk,rst:in std_logic;
        ain,bin:in std_logic_vector(7 downto 0);
        sout:out std_logic_vector(8 downto 0)
     );
end multiplier_booth_8bitadder;

architecture Behavioral of multiplier_booth_8bitadder is
begin

process(clk,rst,ain,bin)
begin
    if(rst='1')then sout<="000000000";
    elsif(rst='0'and clk='0')then
        sout<=(ain(7) & ain)+(bin(7)  & bin);   --符号位扩展加法
    end if;
end process;

end Behavioral;