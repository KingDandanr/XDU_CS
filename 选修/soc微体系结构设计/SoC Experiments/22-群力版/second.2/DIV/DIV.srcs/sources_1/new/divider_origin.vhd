library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divider_origin is
    Port(
        clk,start:in std_logic;
        ain:in std_logic_vector(15 downto 0);--除数(要求除数大于被除数！)
        bin:in std_logic_vector(7 downto 0);--被除数
        done:out std_logic;

        s,r:out std_logic_vector(7 downto 0)
    );
end divider_origin;

architecture Behavioral of divider_origin is

component divider_origin_ctrl
    Port (
        clk,start:in std_logic;
        clkout,rstall,done:out std_logic
     );
end component;
component divider_origin_16bitreg
    Port (
        clk,rst:in std_logic;
        ain:in std_logic_vector(15 downto 0);
        d:in std_logic_vector(8 downto 0);
        c_out:out std_logic;
        q:out std_logic_vector(15 downto 0)
     );
end component;
component divider_origin_selector
    Port (
        clk,rst:in std_logic;
        a0:in std_logic;
        din:in std_logic_vector(7 downto 0);
        cout:out std_logic;
        dout:out std_logic_vector(7 downto 0)
     );
end component;
component divider_origin_8bitadder
    Port (
        clk,rst:in std_logic;
        cina,cinb:in std_logic;
        ain,bin:in std_logic_vector(7 downto 0);
        sout:out std_logic_vector(8 downto 0)
     );
end component;

signal clk_line:std_logic;
signal rst_line:std_logic;
signal cina_line,cinb_line:std_logic;
signal bin_line:std_logic_vector(7 downto 0);
signal sout_line:std_logic_vector(8 downto 0);
signal q_line:std_logic_vector(15 downto 0);

begin
divider_origin_ctrl_inst:divider_origin_ctrl port map(clk=>clk,start=>start,clkout=>clk_line,rstall=>rst_line,done=>done);
divider_origin_16bitreg_inst:divider_origin_16bitreg port map(clk=>clk_line,rst=>rst_line,ain=>ain,d=>sout_line,c_out=>cina_line,q=>q_line);
divider_origin_selector_inst:divider_origin_selector port map(clk=>clk_line,rst=>rst_line,a0=>q_line(0),din=>bin,cout=>cinb_line,dout=>bin_line);
divider_origin_8bitadder_inst:divider_origin_8bitadder port map(clk=>clk_line,rst=>rst_line,cina=>cina_line,cinb=>cinb_line,ain=>q_line(15 downto 8),bin=>bin_line,sout=>sout_line);

process(q_line)
begin
    s<=q_line(7 downto 0);--&not sout_line(8);
    r<=cina_line&q_line(15 downto 9);
    --r<=q_line(15 downto 8);
end process;

end Behavioral;
