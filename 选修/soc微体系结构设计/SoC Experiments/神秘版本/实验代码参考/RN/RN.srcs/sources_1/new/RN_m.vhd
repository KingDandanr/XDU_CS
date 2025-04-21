library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RN_m is
    Port ( 
            clk_RN: in std_logic;
            nreset: in std_logic;
            Ri_EN: in std_logic;
            RDRi: in std_logic;
            WRRi: in std_logic;
            RS: in std_logic;
            RD: in std_logic;
            data : in std_logic_vector(7 downto 0);             --仅用于上板子，模块组合时：data : inout std_logic_vector(7 downto 0)
            data_out: out std_logic_vector(7 downto 0)          --删除
);
end RN_m;

architecture Behavioral of RN_m is
signal tmp: std_logic_vector(7 downto 0);
begin
reg:process(clk_RN)

begin
if(clk_RN'event and clk_RN = '1')then
    if(Ri_EN = '0' and WRRi = '1' and RS = '1') then
        tmp <= data;
    elsif(Ri_EN = '0' and RDRi = '1' and RD = '1') then
        data_out <= tmp;                                    --同上，模块组合时：data <= tmp;
    end if;
end if;
end process reg;
end Behavioral;