----------------------------------------------------------------------------------
-- Engineer: 
-- Create Date: 2024/04/24 14:06:31
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IO is
    Port(
        clk_IO:in std_logic;    --IO时钟信号
        nreset:in std_logic;    --IO复位信号
        IO_CS:in std_logic;     --IO选择信号
        IO_IEN:in std_logic;    --IO输入使能
        IO_OEN:in std_logic;    --IO输出使能
        RI_EN:in std_logic;     --IO缓存器输入使能
        RO_EN:in std_logic;     --IO缓存器输出使能
        IO_in:in std_logic_vector(7 downto 0);          --IO输入
        
        IO_out:out std_logic_vector(7 downto 0);        --IO输出
        DATA_BUS:inout std_logic_vector(7 downto 0)    --数据总线
    );
end IO;

architecture Behavioral of IO is
signal reg:std_logic_vector(7 downto 0);
begin

process(IO_CS,nreset,clk_IO,RO_EN,IO_OEN)
begin
    if(nreset='0')then IO_out<="ZZZZZZZZ";
    elsif(IO_CS='1')then
        if(clk_IO='1'and clk_IO'event and IO_CS='1')then
        if(IO_IEN='0'and IO_OEN='1')then 
            reg<=IO_in;
        elsif(IO_IEN='1'and IO_OEN='0')then 
            reg<=DATA_BUS;
        elsif(RI_EN='0')then DATA_BUS<=reg;
        else DATA_BUS<="ZZZZZZZZ";
        end if;
        end if;
    else DATA_BUS<="ZZZZZZZZ";
    end if;
end process;

process(reg)
begin
    if(RO_EN='0')then IO_out<=reg;end if;
end process;
end Behavioral;
