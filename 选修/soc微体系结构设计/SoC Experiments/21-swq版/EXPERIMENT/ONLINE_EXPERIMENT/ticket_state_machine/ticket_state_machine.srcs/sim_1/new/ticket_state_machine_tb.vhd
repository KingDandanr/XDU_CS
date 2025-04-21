----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/03/31 20:10:12
-- Design Name: 
-- Module Name: ticket_state_machine_tb - Behavioral
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

entity ticket_state_machine_tb is
--  Port ( );
end ticket_state_machine_tb;

architecture Behavioral of ticket_state_machine_tb is
component ticket_state_machine
    Port (
        clk,reset:in std_logic;
        input_money:in std_logic_vector(2 downto 0);
        return_money:out std_logic_vector(2 downto 0);
        output_ticket:out std_logic
    );
end component;
signal clk,reset: std_logic;
signal input_money: std_logic_vector(2 downto 0);
signal return_money: std_logic_vector(2 downto 0);
signal output_ticket: std_logic;
begin
tsm:ticket_state_machine port map(clk,reset,input_money,return_money,output_ticket);

clock:process
    begin
        clk<='0';
        wait for 10ns;
        clk<='1';
        wait for 10ns;
end process;

start:process
    begin
        reset<='1';
        wait for 20ns;
        reset<='0';
        wait;
end process;

test:process
    begin
        wait for 50ns;
        input_money<="001";
        wait for 20ns;
        input_money<="000";
        wait for 50ns;
        input_money<="010";
        wait for 20ns;
        input_money<="000";
        wait for 50ns;
        input_money<="100";
        wait for 20ns;
        input_money<="000";
        wait for 50ns;
        input_money<="010";
        wait for 20ns;
        input_money<="000";
end process;

end Behavioral;
