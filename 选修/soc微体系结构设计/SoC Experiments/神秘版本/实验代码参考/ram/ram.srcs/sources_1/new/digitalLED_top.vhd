----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/21 17:23:20
-- Design Name: 
-- Module Name: digitalLED_top - Behavioral
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

entity digitalLED_top is
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
end digitalLED_top;

architecture Behavioral of digitalLED_top is
    component digitalLED_dis is
    Port 
    (
        clk:in std_logic;
        reset:in std_logic;
        data_in_A:in std_logic_vector(15 downto 0);
        data_in_B:in std_logic_vector(15 downto 0);
        data_in_C:in std_logic_vector(15 downto 0);
        data_in_D:in std_logic_vector(15 downto 0);
        
        seg_sel:out std_logic_vector(15 downto 0);--×´Ì¬»úÊä³ö
        seg_data:out std_logic_vector(7 downto 0)
    );
    end component;
    
    signal num:std_logic_vector(63 downto 0);
    signal data_in_A,data_in_B,data_in_C,data_in_D:std_logic_vector(15 downto 0);
    begin
        num<=x"0123456789AB"&key_in;
        data_in_A<=key_in;
        data_in_B<=num(31 downto 16);
        data_in_C<=num(47 downto 32);
        data_in_D<=num(63 downto 48);
        
    u1:digitalLED_dis 
        port map(clk,reset,data_in_A,data_in_B,data_in_C,data_in_D,seg_sel,seg_data);
end Behavioral;
