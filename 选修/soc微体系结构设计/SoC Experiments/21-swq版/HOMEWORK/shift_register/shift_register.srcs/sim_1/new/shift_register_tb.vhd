----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/03/31 15:49:16
-- Design Name: 
-- Module Name: shift_register_tb - Behavioral
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

entity shift_register_tb is
--  Port ( );
end shift_register_tb;

architecture Behavioral of shift_register_tb is
component shift_register
port(
        clk,reset,left,right:in std_logic;
        mode:in std_logic_vector(1 downto 0);
        input_data:in std_logic_vector(7 downto 0);
        output_data:inout std_logic_vector(7 downto 0)   
);
end component;
signal clk,reset,left,right:std_logic;
signal mode:std_logic_vector(1 downto 0);
signal input_data:std_logic_vector(7 downto 0);
signal output_data:std_logic_vector(7 downto 0);   
begin
sr1:shift_register port map(clk,reset,left,right,mode,input_data,output_data);

clock_gen:process
    begin
        left<=output_data(7);
        right<=output_data(0);
        clk<='0';
        wait for 10ns;
        clk<='1';
        wait for 10ns;
end process;

reset_gen:process
    begin
        reset<='0';
        wait for 25ns;
        reset<='1';
        wait;
end process;

mode_test:process
    begin
        mode<="00";
        wait for 30ns;
        mode<="01";
        input_data<="00001111";
        wait for 30ns;
        mode<="10";
        wait for 200ns;
        mode<="01";
        input_data<="00001111";
        wait for 30ns;
        mode<="11";
        wait for 200ns;
end process;

end Behavioral;
