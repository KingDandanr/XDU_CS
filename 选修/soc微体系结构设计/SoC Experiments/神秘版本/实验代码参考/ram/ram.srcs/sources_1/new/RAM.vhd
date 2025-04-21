----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/27 18:26:14
-- Design Name: 
-- Module Name: RAM - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
Port (  clk_RAM: in std_logic;
        n_reset: in std_logic;
        RAM_CS: in std_logic;
        nRAM_EN: in std_logic;
        wr_nRD: in std_logic;
        AR: in std_logic_vector(6 downto 0);
        data:in std_logic_vector(7 downto 0);
        seg_sel:out std_logic_vector(15 downto 0);
        seg_data:out std_logic_vector(7 downto 0)
);
end RAM;

architecture Behavioral of RAM is

component RAM_m is
Port ( 
        clk_RAM: in std_logic;
        n_reset: in std_logic;
        RAM_CS: in std_logic;
        nRAM_EN: in std_logic;
        wr_nRD: in std_logic;
        AR: in std_logic_vector(6 downto 0);
        data:in std_logic_vector(7 downto 0);           --仅上板子，组装模块：data:inout std_logic_vector(7 downto 0)
        data_out: out std_logic_vector(7 downto 0)      --删去
);
end component;
component digitalLED_top is
generic(clk_MHz:integer:=100;
             t_REF_uS:integer:=1042);
    Port 
    (
        clk:in std_logic;
        reset:in std_logic;
        key_in:in std_logic_vector(15 downto 0);
        seg_sel:out std_logic_vector(15 downto 0);
        seg_data:out std_logic_vector(7 downto 0)
    );
end component;

signal data_out: std_logic_vector(7 downto 0);
signal reset: std_logic;
signal key_in: std_logic_vector(15 downto 0);

begin

c1:RAM_m port map(clk_RAM,n_reset,RAM_CS,nRAM_EN,wr_nRD,AR,data,data_out);
key_in <= "00000000"&data_out;
c2:digitalLED_top port map(clk_RAM,reset,key_in,seg_sel,seg_data);

end Behavioral;
