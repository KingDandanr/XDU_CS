library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity multiplier_booth_selector is
    Port (
        clk,rst:in std_logic;
        a0,a1:in std_logic;
        din:in std_logic_vector(7 downto 0);
        dout:out std_logic_vector(7 downto 0)
     );
end multiplier_booth_selector;

architecture Behavioral of multiplier_booth_selector is

begin

process(clk,a0,a1,din)
variable complement_x:std_logic_vector(7 downto 0);
variable complement_x_negative:std_logic_vector(7 downto 0);
begin
    if(rst='1')then dout<="00000000";
    elsif(rst='0'and clk'event and clk='0')then
        if(din(7)='1')then complement_x:=(din(7)&(not din(6 downto 0)))+1;else complement_x:=din;end if;    --È¡X²¹Âë
        if((not din(7))='1')then complement_x_negative:=((not din(7))&(not din(6 downto 0)))+1;else complement_x_negative:=(not din(7))&din(6 downto 0);end if; --È¡-X²¹Âë
        if(a1=a0)then dout<="00000000";
        elsif(a0='1'and a1='0')then dout<=complement_x;
        elsif(a0='0'and a1='1')then dout<=complement_x_negative;
        end if;
    end if;    
end process;

end Behavioral;
