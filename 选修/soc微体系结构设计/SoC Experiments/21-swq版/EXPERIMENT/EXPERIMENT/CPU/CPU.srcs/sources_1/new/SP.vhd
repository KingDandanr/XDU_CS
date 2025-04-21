----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/24 10:52:17
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SP is
    Port(
        clk_SP:in std_logic;    --SP时钟信号
        nreset:in std_logic;    --复位信号                
        SP_CS:in std_logic;     --SP选择信号
        SP_UP:in std_logic;     --SP+1控制
        SP_DN:in std_logic;     --SP-1控制
        nSP_EN:in std_logic;    --SP输出使能
        
        AR:out std_logic_vector(6 downto 0);--SP指向RAM地址
        --data_in:in std_logic_vector(7 downto 0);
        --data_out:out std_logic_vector(7 downto 0)
        DATA_BUS:inout std_logic_vector(7 downto 0)   --数据总线
    );
end SP;

architecture Behavioral of SP is

signal SP_p:std_logic_vector(6 downto 0);--指向RAM地址

begin

process(SP_CS,clk_SP,nreset)
begin   
    if(nreset='0')then AR<="0000000";
    elsif(SP_CS='1')then
        if(clk_SP='1'and clk_SP'event)then
            if(nSP_EN='1')then 
                SP_p<=DATA_BUS(6 downto 0);
            else
                if(SP_UP='1'and SP_DN='0')then SP_p<=SP_p+1;
                elsif(SP_UP='0'and SP_DN='1')then SP_p<=SP_p-1;
                end if;
                AR<=SP_p;
            end if;
        end if;
    else AR<="0000000";
    end if;
end process;

end Behavioral;
