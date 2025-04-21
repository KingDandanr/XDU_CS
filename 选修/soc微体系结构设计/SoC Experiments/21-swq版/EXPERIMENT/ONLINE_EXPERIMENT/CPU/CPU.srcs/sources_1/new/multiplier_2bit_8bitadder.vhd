library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity multiplier_2bit_8bitadder is
    Port (
        clk,rst:in std_logic;
        cin:in std_logic;
        ain,bin:in std_logic_vector(7 downto 0);
        sout:out std_logic_vector(8 downto 0)
     );
end multiplier_2bit_8bitadder;

architecture Behavioral of multiplier_2bit_8bitadder is
begin

process(clk,rst,ain,bin,cin)
begin
    if(rst='1')then sout<="000000000";
    elsif(rst='0'and clk='0')then
        sout<=('0'& ain)+(cin & bin);
    end if;
end process;

end Behavioral;