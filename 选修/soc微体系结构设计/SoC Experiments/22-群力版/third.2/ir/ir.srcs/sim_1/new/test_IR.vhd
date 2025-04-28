--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

--entity test_IR is
--end test_IR;

--architecture Behavioral of test_IR is

--signal clk: std_logic;
--signal rst: std_logic;
--signal LD_IR1,LD_IR2,LD_IR3: std_logic;
--signal nARen: std_logic;
--signal data: std_logic_vector(7 downto 0);
--signal IR: std_logic_vector(7 downto 0);
--signal PC: std_logic_vector(11 downto 0);
--signal AR: std_logic_vector(6 downto 0);
--signal RS: std_logic;
--signal RD: std_logic;
	   
--signal seg_sel: std_logic_vector(15 downto 0);
--signal seg_data: std_logic_vector(7 downto 0);

--constant clk_period :time :=10 ns;

--begin

--u1: entity work.ir port map (clk,rst,LD_IR1,LD_IR2,LD_IR3,nAren,RS,RD,data,IR,PC,AR,seg_sel,seg_data);

--process
--begin
--    wait for clk_period/2;
--    clk <= '1';
--    wait for clk_period/2;
--    clk <= '0';
--end process;

--process
--begin
--    rst<='1';
--    LD_IR1<='0';
--    LD_IR2<='0';
--    LD_IR3<='0';
--    naren<='1';
--    wait for 20 ns;
    
--    rst<='0';
--    data<="00110101";
--    LD_IR1<='1';
--    LD_IR2<='0';
--    LD_IR3<='0';
    
--    wait for 10 ns;
    
--    rst<='0';
--    data<="00110101";
--    LD_IR1<='0';
--    LD_IR2<='1';
--    LD_IR3<='0';
    
--    wait for 10 ns;
    
--    rst<='0';
--    data<="00110101";
--    LD_IR1<='0';
--    LD_IR2<='0';
--    LD_IR3<='1';
    
--    wait for 10 ns;
    
--    naren<='0';
    
--    wait;
    
--end process;

--end Behavioral;