library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity multiplier_booth_8bitshiftreg is
    Port (
        clk,load:in std_logic;
        din:in std_logic_vector(7 downto 0);
        qb0,qb1:out std_logic
     );
end multiplier_booth_8bitshiftreg;

architecture Behavioral of multiplier_booth_8bitshiftreg is

signal reg8b:std_logic_vector(8 downto 0);

begin

process(clk,load)
begin
    if load='1'then 
        if(din(7)='1')then reg8b(8 downto 1)<=(din(7)&(not din(6 downto 0)))+1;else reg8b(8 downto 1)<=din;end if;  --È¡²¹Âë
        reg8b(0)<='0';
        qb0<='0';qb1<='0';
    end if;
    if(load='0'and clk='1')then 
        qb0<=reg8b(0);
        qb1<=reg8b(1);
        reg8b(7 downto 0)<=reg8b(8 downto 1);
        reg8b(8)<='0';   
    end if;     
end process;

end Behavioral;
