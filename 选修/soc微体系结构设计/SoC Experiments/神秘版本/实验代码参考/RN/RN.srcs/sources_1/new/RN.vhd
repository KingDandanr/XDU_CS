----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/27 17:28:40
-- Design Name: 
-- Module Name: RN - Behavioral
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

entity RN is
Port ( 
            clk_RN: in std_logic;
            nreset: in std_logic;
            Ri_EN: in std_logic;
            RDRi: in std_logic;
            WRRi: in std_logic;
            RS: in std_logic;
            RD: in std_logic;
            data : in std_logic_vector(7 downto 0);
            seg_sel:out std_logic_vector(15 downto 0);
            seg_data:out std_logic_vector(7 downto 0)
            
);
end RN;

architecture Behavioral of RN is

component RN_m is
Port ( 
            clk_RN: in std_logic;
            nreset: in std_logic;
            Ri_EN: in std_logic;
            RDRi: in std_logic;
            WRRi: in std_logic;
            RS: in std_logic;
            RD: in std_logic;
            data : in std_logic_vector(7 downto 0);
            data_out: out std_logic_vector(7 downto 0)
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

c1:RN_m port map(clk_RN,nreset,Ri_EN,RDRi,WRRi,RS,RD,data,data_out);
key_in <= "00000000" & data_out;
c2:digitalLED_top port map(
        clk_RN,
        reset,
        key_in,
        seg_sel,
        seg_data
);

end Behavioral;
