library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity multiplier_2bit_16bitreg is
    Port (
        clk,clr:in std_logic;
        d:in std_logic_vector(8 downto 0);
        q:out std_logic_vector(15 downto 0)
     );
end multiplier_2bit_16bitreg;

architecture Behavioral of multiplier_2bit_16bitreg is

begin

process(clk,clr)
variable sr16b:std_logic_vector(15 downto 0);
begin
    if clr='1'then
        sr16b:="0000000000000000";
    elsif(clr='0'and clk'event and clk='1')then  
        sr16b(15 downto 8):=d(7 downto 0);
        sr16b(13 downto 0):=sr16b(15 downto 2);
        sr16b(15):=d(8);
        sr16b(14):=d(8);
    end if;   
    q<=sr16b;
end process;

end Behavioral;
