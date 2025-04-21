----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/05/20 20:32:03
-- Design Name: 
-- Module Name: micro_controller - Behavioral
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

entity micro_controller is
Port (clk_mc,m_ua,cmrom_cs:in std_logic;
    ir:in std_logic_vector(7 downto 2);
    clkk,test,t1,t2:out std_logic;
    arr:out std_logic_vector(7 downto 0);
    cm:out std_logic_vector(47 downto 8) );
end micro_controller;

architecture Behavioral of micro_controller is
component cmrom is
Port (m_rom,nrom_en:in std_logic;
    addr:in std_logic_vector(7 downto 0);
    data:out std_logic_vector(47 downto 0) );
end component;

signal uar:std_logic_vector(7 downto 0);
signal uir:std_logic_vector(47 downto 0);
signal ccc,cc,tt:std_logic;


begin
cm1:cmrom port map(m_rom=>cmrom_cs,nrom_en=>'0',addr=>uar,data=>uir);
cm<=uir(47 downto 8);
clkk<=ccc;
    
    process(clk_mc)
    variable count: integer range 0 to 30000;
    begin
    if clk_mc'event and clk_mc='1' then
    count:=count+1;
    if count=10000 then
    cc<=not cc;
    count:=0;
    end if;
    end if;
    end process;
    process(cc)
    variable countt: integer range 0 to 30000;
    begin
    if cc'event and cc='1' then
    countt:=countt+1;
    if countt=5000 then
    ccc<=not ccc;
    countt:=0;
    end if;
    end if;
    end process;

process(m_ua,ccc)
begin
if rising_edge(ccc) then 
    tt<=not tt;
    test<=tt;
    if m_ua='1' then
    uar(5 downto 0)<=ir;uar(7 downto 6)<="00";t1<=tt;
    elsif m_ua='0' then
    uar<=uir(7 downto 0);t2<=tt;
    end if;
end if;
end process;

end Behavioral;
