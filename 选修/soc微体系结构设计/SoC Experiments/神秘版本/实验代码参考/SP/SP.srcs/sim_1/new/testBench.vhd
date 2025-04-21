library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
entity testBench is
end testBench;

architecture Behavioral of testBench is
    component sp_top
        port(
            clk_SP	:in std_logic;
            clk_disp: in std_logic;
            rst	:in std_logic;
            SP_CS	:in std_logic;
            nSP_EN	:in std_logic;	
            SP_UP	:in std_logic;
            SP_DN	:in std_logic;
                
            data	:in std_logic_vector(7 downto 0);
            seg_sel : out  STD_LOGIC_VECTOR (15 downto 0);
            seg_data : out  STD_LOGIC_VECTOR (7 downto 0)
	   );
    end component;
    signal         clk_SP	: std_logic:='0';
    signal         clk_disp : std_logic:='0';
    signal         rst	    : std_logic:='0';
    signal         SP_CS	: std_logic:='1';
    signal         nSP_EN	: std_logic:='1';	
    signal         SP_UP	: std_logic:='0';
    signal         SP_DN	: std_logic:='0';
                
    signal         data	    : std_logic_vector(7 downto 0):=(others=>'0');
    signal         seg_sel  : STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
    signal         seg_data : STD_LOGIC_VECTOR(7 downto 0):=(others=>'0');
begin
    sp:sp_top port map(clk_SP,clk_disp,rst,SP_CS,nSP_EN,SP_UP,SP_DN,data,seg_sel,seg_data);
    process
    begin
        wait for 1 ps;
        clk_disp<= not clk_disp;
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
        wait for 1 ns;
        clk_SP<=not clk_SP;
    end process;
    
    process
    begin
        SP_DN<='0';
        nSP_EN<='1';
        wait for 2 ns;
        nSP_EN<='0';
        SP_UP<='1';
        wait for 2 ns;
        SP_UP<='0';
        SP_DN<='1';
        wait for 2 ns;
    end process;
    
    process
    begin
        wait for 6 ns;
        data<=data+1;
    end process;
    
end Behavioral;
