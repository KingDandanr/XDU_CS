library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity divider_origin_8bitadder is
    Port (
        clk,rst:in std_logic;
        cina,cinb:in std_logic;
        ain,bin:in std_logic_vector(7 downto 0);
        sout:out std_logic_vector(8 downto 0)
     );
end divider_origin_8bitadder;

architecture Behavioral of divider_origin_8bitadder is
begin

process(rst,clk,ain,bin,cina,cinb)
begin
    if(rst='1')then sout<=(cina & ain)+(cinb & bin);
    elsif(clk='0')then
        sout<=(cina & ain)+(cinb & bin);
    end if;
end process;

end Behavioral;