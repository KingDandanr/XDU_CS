----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 19:49:35
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider_origin_tb is
--  Port ( );
end divider_origin_tb;

architecture Behavioral of divider_origin_tb is
component divider_origin
    Port(
        clk,start:in std_logic;
        ain:in std_logic_vector(15 downto 0);--³ýÊý
        bin:in std_logic_vector(7 downto 0);--±»³ýÊý
        done:out std_logic;

        s,r:out std_logic_vector(7 downto 0)
    );
end component;
signal clk,start: std_logic;
signal ain: std_logic_vector(15 downto 0);
signal bin: std_logic_vector(7 downto 0);
signal done: std_logic;
signal s,r: std_logic_vector(7 downto 0);
begin
divider_origin_inst:divider_origin port map(clk,start,ain,bin,done,s,r);

clock_gen:process
begin  
    clk<='1';
    wait for 5ns;
    clk<='0';
    wait for 5ns;
end process;

test:process
begin
    --09 0d
    ain<=x"008B";
    bin<=x"0E";
    wait for 25ns;
    start<='1';
    wait for 25ns;
    start<='0';    
    wait for 100ns;
    
    --00 ff
    ain<=x"0001";
    bin<=x"02";
    wait for 25ns;
    start<='1';
    wait for 25ns;
    start<='0';    
    wait for 100ns;
    
    --01 33
    ain<=x"00AB";
    bin<=x"78";
    wait for 25ns;
    start<='1';
    wait for 25ns;
    start<='0';    
    wait for 100ns;
    
    --ad 27
    ain<=x"ABCD";
    bin<=x"FE";
    wait for 25ns;
    start<='1';
    wait for 25ns;
    start<='0';    
    wait for 100ns;
   
    --01 01
    ain<=x"0100";
    bin<=x"FF";
    wait for 25ns;
    start<='1';
    wait for 25ns;
    start<='0';    
    wait for 100ns;
    
    wait;
end process;

end Behavioral;
