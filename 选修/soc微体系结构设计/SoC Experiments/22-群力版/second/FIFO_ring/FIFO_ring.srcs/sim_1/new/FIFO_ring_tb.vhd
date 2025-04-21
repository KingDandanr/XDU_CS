----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 13:02:24
-- Module Name: FIFO_ring_tb - Behavioral
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FIFO_ring_tb is
--  Port ( );
end FIFO_ring_tb;

architecture Behavioral of FIFO_ring_tb is

component FIFO_ring_test
generic(
    CLK_FRE:integer:=100000000;
    cycle_max:positive:=3;--×î´ó¶ÁÐ´È¦Êý
    depth:positive:=3;
    width:positive:=8
);
    Port(
        clk:in std_logic;
        rst:in std_logic;
        key_in:in std_logic;
        data_in:in std_logic_vector(7 downto 0);
        wr:in std_logic;
        rd:in std_logic;
        
        empty:out std_logic;
        full:out std_logic;
        data_out:out std_logic_vector(7 downto 0)
    );
end component;

signal clk:std_logic;
signal rst:std_logic;
signal key_in:std_logic;
signal data_in:std_logic_vector(7 downto 0);
signal wr:std_logic;
signal rd:std_logic;
signal empty:std_logic;
signal full:std_logic;
signal data_out:std_logic_vector(7 downto 0);

begin

FIFO_ring_test_inst:FIFO_ring_test generic map(100000000,3,8)port map(clk,rst,key_in,data_in,wr,rd,empty,full,data_out);

clock:process
begin
    clk<='0';
    wait for 5ns;
    clk<='1';
    wait for 5ns;
end process;

reset:process
begin
    rst<='0';
    wait for 25ns;
    rst<='1';
    wait;
end process;

test:process
begin
    rd<='1';
    wr<='1';
    data_in<="00000000";
    key_in<='0';
    wait for 4ms;
    
    rd<='1';
    wr<='0';
    data_in<="00000001";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<="00000010";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<="00000100";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<="00001000";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<="00010000";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<="00100000";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<="01000000";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<="10000000";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<="11111111";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<="00001111";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<="11110000";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    
    wr<='1';
    rd<='0';
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    
    rd<='1';
    wr<='0';
    data_in<=not"00000001";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<=not"00000010";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<=not"00000100";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<=not"00001000";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<=not"00010000";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<=not"00100000";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<=not"01000000";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<=not"10000000";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<=not"11111111";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<=not"00001111";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    data_in<=not"11110000";
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    
    wr<='1';
    rd<='0';
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    wait for 4ms;
    key_in<='1';
    wait for 4ms;
    key_in<='0';
    wait for 4ms;
    
    wait;

end process;

end Behavioral;
