library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
entity IO_test_bench is
end IO_test_bench;

architecture Behavioral of IO_test_bench is
    component IO_top
        port
        (
            clk:in std_logic;
            rst:in std_logic; -- sw31
            
            P0_CS:in std_logic; -- sw30
            P0_IEN:in std_logic; -- sw29
            P0_OEN:in std_logic; -- sw27
            InEN:in std_logic; -- sw28
            OutEN:in std_logic; -- sw26
            
            P0_IN:in std_logic_vector (7 downto 0); -- sw23 ~ sw16
            data_in:in std_logic_vector (7 downto 0); -- sw7 ~ sw0
            seg_sel : out  STD_LOGIC_VECTOR (15 downto 0);
            seg_data : out  STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;
    signal        clk: std_logic:='0';
    signal        rst: std_logic:='0';
            
    signal        P0_CS: std_logic:='1';
    signal        P0_IEN: std_logic:='1';
    signal        P0_OEN: std_logic:='1';
    signal        InEN: std_logic:='0';
    signal        OutEN: std_logic:='0';
            
    signal        P0_IN: std_logic_vector (7 downto 0):=(others=>'0');
    signal        data_in: std_logic_vector (7 downto 0):=(others=>'0');
    signal        seg_sel :  STD_LOGIC_VECTOR (15 downto 0):=(others=>'0');
    signal        seg_data : STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');
    
begin
    IO:IO_top port map(clk,rst,P0_CS,P0_IEN,P0_OEN,InEN,OutEN,P0_IN,data_in,seg_sel,seg_data);
    
    process
    begin
        wait for 1 ps;
        clk<=not clk;
    end process;
    
    process
    begin
        rst<='1';
        wait for 1 ps;
        rst<='0';
        wait;
    end process;
    
    process
    begin
        P0_OEN<='1';
        OutEN<='0';
        P0_IEN<='0';
        InEN<='1';
        wait for 2 ns;
        P0_IEN<='1';
        InEN<='0';
        P0_OEN<='0';
        OutEN<='1';
        wait for 2 ns;
    end process;
    
    process
    begin
        wait for 4 ns;
        data_in<=data_in+1;
    end process;
    
    process
    begin
        wait for 16 ns;
        P0_IN<=P0_IN+1;
    end process;

end Behavioral;
