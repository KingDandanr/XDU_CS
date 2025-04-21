library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pcFinalSim is
--  Port ( );
end pcFinalSim;

architecture Behavioral of pcFinalSim is
    component pcFinal is
        port(
            clk: in std_logic;
            n_rst: in std_logic;
            n_ld: in std_logic;
            m_pc: in std_logic;
            nPCH, nPCL: in std_logic;
            PC_in: in std_logic_vector(11 downto 0);
            segSel: out std_logic_vector(3 downto 0);
            segData: out std_logic_vector(7 downto 0)
        );
    end component;
    signal clk_pc, n_rst, n_ld, m_pc, nPCH, nPCL: std_logic:='0';
    signal PC_in: std_logic_vector(11 downto 0);
    signal segSel: std_logic_vector(3 downto 0);
    signal segData: std_logic_vector(7 downto 0);
begin
    myPC: pcFinal port map(
        clk_pc, n_rst, n_ld, m_pc, nPCH, nPCL, PC_in, segSel, segData
    );
    
    process
    begin
        clk_pc<=not clk_pc;
        wait for 10ns;
    end process;
    
    process
    begin
        n_ld<='1';
        wait for 1000ms;
        n_rst<='1';
        wait for 1000ms;
        m_pc<='1';
        wait for 10000ms;
        PC_in<="110100110101";
        m_pc<='0';
        n_ld<='0';
        wait for 1000ms;
        n_ld<='1';
        wait for 1000ms;
        nPCL<='1';
        wait for 1000ms;
        nPCL<='0';
        wait for 1000ms;
        nPCH<='1';
        wait for 1000ms;
        nPCL<='1';
        wait for 1000ms;
        n_rst<= '0';
        wait;
    end process;

end Behavioral;
