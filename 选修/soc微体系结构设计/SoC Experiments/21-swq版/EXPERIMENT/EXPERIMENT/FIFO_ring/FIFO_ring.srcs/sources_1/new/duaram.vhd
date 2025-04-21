----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 13:02:24
-- Module Name: FIFO_ring - Behavioral
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity duaram is
    generic(
        depth:positive;
        width:positive
    );
    Port(
        clka:in std_logic;
        wr:in std_logic;
        wr_en:in std_logic;
        addra:in std_logic_vector(depth-1 downto 0);
        datain:in std_logic_vector(width-1 downto 0);
        
        clkb:in std_logic;
        rd:in std_logic;
        rd_en:in std_logic;
        addrb:in std_logic_vector(depth-1 downto 0);
        dataout:out std_logic_vector(width-1 downto 0)
    );
end duaram;

architecture Behavioral of duaram is
type ram is array(2**depth-1 downto 0)of std_logic_vector(width-1 downto 0);
signal dualram:ram;
begin

    process(clka)
    begin
        if(clka'event and clka='1')then
            if(wr='0'and wr_en='0')then dualram(conv_integer(addra))<=datain;end if;
        end if;
    end process;
    
    process(clkb)
    begin
        if(clkb'event and clkb='1')then
            if(rd='0'and rd_en='0')then dataout<=dualram(conv_integer(addrb));end if;
        end if;
    end process;

end Behavioral;
