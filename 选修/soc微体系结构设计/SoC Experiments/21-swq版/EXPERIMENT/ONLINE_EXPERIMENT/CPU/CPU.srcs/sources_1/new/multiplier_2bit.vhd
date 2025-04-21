library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier_2bit is
    Port(
        clk,start:in std_logic;
        ain,bin:in std_logic_vector(7 downto 0);
        done:out std_logic;
        sout:inout std_logic_vector(15 downto 0)
    );
end multiplier_2bit;

architecture Behavioral of multiplier_2bit is

component multiplier_2bit_ctrl
    Port (
        clk,start:in std_logic;
        clkout,rstall,done:out std_logic
     );
end component;
component multiplier_2bit_8bitshiftreg
    Port (
        clk,load:in std_logic;
        din:in std_logic_vector(7 downto 0);
        qb0,qb1:out std_logic
     );
end component;
component multiplier_2bit_16bitreg
    Port (
        clk,clr:in std_logic;
        d:in std_logic_vector(8 downto 0);
        q:out std_logic_vector(15 downto 0)
     );
end component;
component multiplier_2bit_selector
    Port (
        clk,rst:in std_logic;
        a0,a1,cin:in std_logic;
        din:in std_logic_vector(7 downto 0);
        cout:out std_logic;
        dout:out std_logic_vector(7 downto 0)
     );
end component;
component multiplier_2bit_8bitadder
    Port (
        clk,rst:in std_logic;
        cin:in std_logic;
        ain,bin:in std_logic_vector(7 downto 0);
        sout:out std_logic_vector(8 downto 0)
     );
end component;

signal clk_line:std_logic;
signal rst_line:std_logic;
signal cin_line:std_logic;
signal qb1_line,qb0_line:std_logic;
signal bin_line:std_logic_vector(7 downto 0);
signal sout_line:std_logic_vector(8 downto 0);
signal test_line:std_logic_vector(8 downto 0);

begin
multiplier_2bit_ctrl_inst:multiplier_2bit_ctrl port map(clk=>clk,start=>start,clkout=>clk_line,rstall=>rst_line,done=>done);
multiplier_2bit_8bitshiftreg_inst:multiplier_2bit_8bitshiftreg port map(clk=>clk_line,load=>rst_line,din=>ain,qb0=>qb0_line,qb1=>qb1_line);
multiplier_2bit_16bitreg_inst:multiplier_2bit_16bitreg port map(clk=>clk_line,clr=>rst_line,d=>sout_line,q=>sout);
multiplier_2bit_selector_inst:multiplier_2bit_selector port map(clk=>clk_line,rst=>rst_line,a0=>qb0_line,a1=>qb1_line,cin=>sout_line(8),din=>bin,cout=>cin_line,dout=>bin_line);
multiplier_2bit_8bitadder_inst:multiplier_2bit_8bitadder port map(clk=>clk_line,rst=>rst_line,cin=>cin_line,ain=>sout(15 downto 8),bin=>bin_line,sout=>sout_line);

end Behavioral;
