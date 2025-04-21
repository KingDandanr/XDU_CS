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
        PC_in:in std_logic_vector(11 downto 0);
        
        DATA_BUS:inout std_logic_vector(7 downto 0);
        
        nPCH,nPCL:out std_logic
     );
end pc;

architecture Behavioral of pc is

signal pc_count:std_logic_vector(11 downto 0);
signal ADDR:std_logic_vector(11 downto 0);


begin

process(rst,clk_PC)
variable addr_count:integer:=0;
begin
    if(rst='1')then 
        pc_count<=PC_in;
        ADDR<=pc_count;
        DATA_BUS<=(others=>'Z');
        nPCH<='1';nPCL<='1';

    elsif(clk_PC='1'and clk_PC'event)then
        if(addr_count=0)then pc_count<=pc_count+1;end if;
        if(M_PC='1')then ADDR<=pc_count;end if;
        if(nLD_PC='0')then 
            if(addr_count=0)then DATA_BUS<="0000"& ADDR(11 downto 8);addr_count:=addr_count+1;nPCH<='0';nPCL<='1';
            elsif(addr_count=1)then DATA_BUS<=ADDR(7 downto 0);addr_count:=addr_count-1;nPCH<='1';nPCL<='0';
            end if;
        end if;
    end if;
end process;



end Behavioral;
