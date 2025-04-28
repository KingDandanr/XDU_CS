----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/22 09:34:26
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RN_tb is
--  Port ( );
end RN_tb;

architecture Behavioral of RN_tb is
component RN
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
end component;

signal clk_RN,Ri_EN,RDRi,WRRi:std_logic;
signal RS,RD:std_logic_vector(0 downto 0);
signal DATA_BUS:std_logic_vector(7 downto 0);
signal data_in:std_logic_vector(7 downto 0);
signal data_out:std_logic_vector(7 downto 0);

begin

RN_inst:RN generic map(1)port map(clk_RN,Ri_EN,RDRi,WRRi,RS,RD,data_in,data_out);
--RN_inst:RN generic map(1)port map(clk_RN,Ri_EN,RDRi,WRRi,RS,RD,DATA_BUS);

clock:process
begin
    clk_RN<='1';
    wait for 5ns;
    clk_RN<='0';
    wait for 5ns;
end process;

test:process
begin
    Ri_EN<='1';
    wait for 25ns;
    Ri_EN<='0';
    
    RDRi<='0';
    WRRi<='1';
    RS<="0";
    RD<="0";
    data_in<=x"FF";
    wait for 25ns;
    
    RDRi<='0';
    WRRi<='1';
    RS<="0";
    RD<="1";
    data_in<=x"EE";
    wait for 25ns;
    
    RDRi<='1';
    WRRi<='0';
    RS<="0";
    RD<="0";
    wait for 25ns;
    
    RDRi<='1';
    WRRi<='0';
    RS<="1";
    RD<="0";
       
    wait for 25ns;
    Ri_EN<='1';
    wait;
end process;

end Behavioral;
