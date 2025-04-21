library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier_booth is
    Port(
        clk,start:in std_logic;
        ain,bin:in std_logic_vector(7 downto 0);
        done:out std_logic;
        sout:inout std_logic_vector(15 downto 0)
    );
end multiplier_booth;

architecture Behavioral of multiplier_booth is

component multiplier_booth_ctrl
    Port (
        clk,start:in std_logic;
        clkout,rstall,done:out std_logic
     );
end component;
component multiplier_booth_8bitshiftreg
    Port (
        clk,load:in std_logic;
        din:in std_logic_vector(7 downto 0);
        qb0,qb1:out std_logic
     );
end component;
component multiplier_booth_16bitreg
    Port (
        clk,clr:in std_logic;
        d:in std_logic_vector(8 downto 0);
        q:out std_logic_vector(15 downto 0)
     );
end component;
component multiplier_booth_selector
    Port (
        clk,rst:in std_logic;
        a0,a1:in std_logic;
        din:in std_logic_vector(7 downto 0);
        dout:out std_logic_vector(7 downto 0)
     );
end component;
component multiplier_booth_8bitadder
    Port (
        clk,rst:in std_logic;
        ain,bin:in std_logic_vector(7 downto 0);
        sout:out std_logic_vector(8 downto 0)
     );
end component;

signal clk_line:std_logic;
signal rst_line:std_logic;
signal qb1_line,qb0_line:std_logic;
signal bin_line:std_logic_vector(7 downto 0);
signal sout_line:std_logic_vector(8 downto 0);
signal test_line:std_logic_vector(8 downto 0);

begin
multiplier_booth_ctrl_inst:multiplier_booth_ctrl port map(clk=>clk,start=>start,clkout=>clk_line,rstall=>rst_line,done=>done);
multiplier_booth_8bitshiftreg_inst:multiplier_booth_8bitshiftreg port map(clk=>clk_line,load=>rst_line,din=>ain,qb0=>qb0_line,qb1=>qb1_line);
multiplier_booth_16bitreg_inst:multiplier_booth_16bitreg port map(clk=>clk_line,clr=>rst_line,d=>sout_line,q=>sout);
multiplier_booth_selector_inst:multiplier_booth_selector port map(clk=>clk_line,rst=>rst_line,a0=>qb0_line,a1=>qb1_line,din=>bin,dout=>bin_line);
multiplier_booth_8bitadder_inst:multiplier_booth_8bitadder port map(clk=>clk_line,rst=>rst_line,ain=>sout(15 downto 8),bin=>bin_line,sout=>sout_line);

end Behavioral;
