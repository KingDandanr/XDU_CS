library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity divider_origin_selector is
    Port (
        clk,rst:in std_logic;
        a0:in std_logic;
        din:in std_logic_vector(7 downto 0);
        cout:out std_logic;
        dout:out std_logic_vector(7 downto 0)
     );
end divider_origin_selector;

architecture Behavioral of divider_origin_selector is

signal complement_x_negative:std_logic_vector(7 downto 0);

begin

process(din)
begin
    complement_x_negative<=(not din)+1;
end process;

process(clk,rst,a0,din)

begin
    if(rst='1')then dout<=complement_x_negative;cout<='1';
    elsif(clk'event and clk='0')then
        if(a0='1')then dout<=complement_x_negative;cout<='1';--输出加数和其符号位
        else dout<=din;cout<='0';
        end if;
    end if;    
end process;

end Behavioral;
