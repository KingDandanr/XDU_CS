library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity judge_status is
    generic(
        depth:positive
    );
    port(
        clk:in std_logic;
        rst:in std_logic;
        wr_pt:in std_logic_vector(depth-1 downto 0);
        rd_pt:in std_logic_vector(depth-1 downto 0);
        empty:out std_logic;
        full:out std_logic
    );
end entity judge_status;

architecture Behavioral of judge_status is

begin

process(rst,clk)
begin
    if(rst='0')then empty<='1';
    elsif clk'event and clk='1'then
        if wr_pt=rd_pt then empty<='1';
        else empty<='0';
        end if;
    end if;  
end process;

process(rst,clk)
begin
    if(rst='0')then full<='0';
    elsif clk'event and clk='1'then
        if wr_pt>rd_pt then
            if(depth+rd_pt)=wr_pt then full<='1';else full<='0';end if;
        end if;
    end if;  
end process;

end Behavioral;