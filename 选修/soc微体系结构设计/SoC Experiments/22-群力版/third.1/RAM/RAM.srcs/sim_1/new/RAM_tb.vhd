----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/23 21:55:51
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RAM_tb is
--  Port ( );
end RAM_tb;

architecture Behavioral of RAM_tb is
component RAM
    generic(
        depth:positive:=7;
        width:positive:=8
    );
    Port (
        clk_RAM:in STD_LOGIC;       --RAM时钟信号
        n_reset:in STD_LOGIC;       --RAM选择信号
        RAM_CS:in STD_LOGIC;        --RAM片选信号
        nRAM_EN:in STD_LOGIC;       --RAM输出使能
        Wr_nRD :in STD_LOGIC;       --RAM读写信号
        AR:in STD_LOGIC_VECTOR (depth-1 downto 0);  --RAM地址信号
        
        DATA_BUS: inout STD_LOGIC_VECTOR (width-1 downto 0) --数据总线
        --data_in:in STD_LOGIC_VECTOR (width-1 downto 0);
        --data_out:out STD_LOGIC_VECTOR (width-1 downto 0))
    );
end component;

signal clk_RAM,n_reset,RAM_CS,nRAM_EN,Wr_nRD:std_logic;
signal AR:std_logic_vector(6 downto 0);
signal DATA_BUS:std_logic_vector(7 downto 0);
signal data_in,data_out:std_logic_vector(7 downto 0);

begin

RAM_inst:RAM generic map(7,8)port map(clk_RAM=>clk_RAM,n_reset=>n_reset,RAM_CS=>RAM_CS,nRAM_EN=>nRAM_EN,Wr_nRD=>Wr_nRD,AR=>AR,DATA_BUS=>DATA_BUS);
--RAM_inst:RAM generic map(7,8)port map(clk_RAM=>clk_RAM,n_reset=>n_reset,RAM_CS=>RAM_CS,nRAM_EN=>nRAM_EN,Wr_nRD=>Wr_nRD,AR=>AR,data_in=>data_in,data_out=>data_out);

clock:process
begin
    clk_RAM<='1';
    wait for 5ns;
    clk_RAM<='0';
    wait for 5ns;
end process;

test:process
begin
    n_reset<='1';
    wait for 25ns;
    n_reset<='0';
    
    RAM_CS<='1';
    nRAM_EN<='1';
    Wr_nRD<='1';
    AR<="0000000";
    wait for 25ns;
    DATA_BUS<=x"FF";
    wait for 25ns;
    AR<="0000001";
    wait for 25ns;
    DATA_BUS<=x"EE";
    wait for 25ns;
    
    nRAM_EN<='0';
    Wr_nRD<='0';
    AR<="0000000";
    wait for 25ns;
    AR<="0000001";
    
    wait;

end process;

end Behavioral;
