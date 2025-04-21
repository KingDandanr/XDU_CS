----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 13:02:24
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pc is
    Port (        
        rst,clk_PC,M_PC,nLD_PC:in std_logic;
        nPCH,nPCL:in std_logic;
        PC_in:in std_logic_vector(11 downto 0);
        
        PC_out:out std_logic_vector(11 downto 0);
        DATA_BUS:inout std_logic_vector(7 downto 0)
     );
end pc;

architecture Behavioral of pc is

signal pc_count:std_logic_vector(11 downto 0);
signal ADDR:std_logic_vector(11 downto 0);

begin

process(rst,clk_PC,M_PC,nLD_PC)
begin
    if(rst='0')then 
        pc_count<=PC_in;
        ADDR<=pc_count;
        PC_out<=(others=>'0');
        DATA_BUS<=(others=>'Z');
    elsif(M_PC='1')then
        if(clk_PC='1'and clk_PC'event)then
            if(nLD_PC='0')then 
                PC_out<=PC_in;
                pc_count<=PC_in;
                if(nPCH='0')then DATA_BUS<="0000"& ADDR(11 downto 8);
                elsif(nPCL='0')then DATA_BUS<=ADDR(7 downto 0);
                end if;
            elsif(nPCL='1'and nPCH='1')then 
                pc_count<=pc_count+1;
                PC_out<=pc_count+1;
                ADDR<=pc_count+1;
            end if;
        end if;
    else DATA_BUS<=(others=>'Z');
    end if;
end process;



end Behavioral;
