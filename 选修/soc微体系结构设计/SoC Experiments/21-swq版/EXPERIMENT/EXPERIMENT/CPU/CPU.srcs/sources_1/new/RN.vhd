----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/20 17:36:21
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RN is
    Port(
        clk_RN,Rn_CS,nRi_EN,RDRi,WRRi:in std_logic;
        RS,RD:in std_logic;
        DATA_BUS:inout std_logic_vector(7 downto 0)
    );
end RN;

architecture Behavioral of RN is
signal R0,R1:std_logic_vector(7 downto 0);

begin

process(Rn_CS,nRi_EN,clk_RN)
begin
    if(Rn_CS='0' and nRi_EN='0')then
        if(clk_RN='1'and clk_RN'event and nRi_EN='0')then
            if(RDRi='1')then 
                if(RS='0')then DATA_BUS<=R0;
                else  DATA_BUS<=R1;
                end if;
            elsif(WRRi='1')then 
                if(RD='0')then R0<=DATA_BUS;
                else R1<=DATA_BUS;
                end if;
            end if;
        end if;
    else DATA_BUS<=(others=>'Z');
    end if;
end process;

end Behavioral;
