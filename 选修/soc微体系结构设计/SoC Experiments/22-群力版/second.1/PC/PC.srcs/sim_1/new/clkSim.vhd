library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clkSim is
--  Port ( );
end clkSim;

architecture Behavioral of clkSim is
    component clkDIs is
        port(
            clk: in std_logic;
            clk_seg: out std_logic;
            clk_pc: out std_logic
        );
    end component;
    signal clk, clk_seg, clk_pc: std_logic:='0';
begin
    myClk: clkDIs port map(
        clk, clk_seg, clk_pc
    );

    process
    begin
        clk <= not clk;
        wait for 10us;
    end process;

end Behavioral;
