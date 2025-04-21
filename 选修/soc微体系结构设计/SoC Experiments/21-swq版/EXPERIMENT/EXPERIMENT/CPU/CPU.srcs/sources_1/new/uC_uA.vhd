----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/24 16:22:50
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uC_uA is
    Port(
        clk:in std_logic;
        nreset:in std_logic;    --复位信号
        M_uA:in std_logic;
        IR:in std_logic_vector(7 downto 2);     --IR操作码信息
        uA_in:in std_logic_vector(7 downto 0);  --uIR传送的微地址
        
        uA_out:out std_logic_vector(7 downto 0) --下一条微指令的地址
    );
end uC_uA;

architecture Behavioral of uC_uA is

begin

process(clk,nreset)
begin
    if(nreset='0')then uA_out<=(others=>'0');
    elsif(clk='1'and clk'event)then
        if(M_uA='0')then uA_out<=IR&"00";
        else uA_out<=uA_in;
        end if;
    end if;
end process;

end Behavioral;
