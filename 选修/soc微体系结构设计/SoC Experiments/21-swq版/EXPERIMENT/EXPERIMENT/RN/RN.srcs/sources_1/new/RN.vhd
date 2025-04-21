----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/20 17:36:21
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RN is
    generic(
        depth:integer:=1
    );
    Port(
        clk_RN,Ri_EN,RDRi,WRRi:in std_logic;
        RS,RD:in std_logic_vector(depth-1 downto 0);
        data_in:in std_logic_vector(7 downto 0);
        data_out:out std_logic_vector(7 downto 0)
        --DATA_BUS:inout std_logic_vector(7 downto 0)
    );
end RN;

architecture Behavioral of RN is
type RN is array(2**depth-1 downto 0)of std_logic_vector(7 downto 0);
signal RN_in:RN;

begin

process(clk_RN)
begin
    if(Ri_EN='1')then data_out<=(others=>'Z');
    elsif(clk_RN='1'and clk_RN'event)then
        if(RDRi='1')then data_out<=RN_in(conv_integer(RS));
        elsif(WRRi='1')then RN_in(conv_integer(RD))<=data_in;
        else data_out<=(others=>'Z');
        end if;
    end if;
end process;

end Behavioral;
