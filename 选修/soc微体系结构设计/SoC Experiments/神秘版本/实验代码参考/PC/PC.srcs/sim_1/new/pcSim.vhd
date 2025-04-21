library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pcSim is
--  Port ( );
end pcSim;

architecture Behavioral of pcSim is
    component PC is
        port(
            clk_pc: in std_logic;
            n_rst: in std_logic;
            n_ld: in std_logic;
            m_pc: in std_logic;
            nPCH, nPCL: in std_logic;
            PC: in std_logic_vector(11 downto 0);
            addr: out std_logic_vector(11 downto 0);
            d: inout std_logic_vector(7 downto 0)
        );
    end component;
    signal clk_pc, n_rst, n_ld, m_pc, nPCH, nPCL: std_logic:='0';
    signal PC0, addr: std_logic_vector(11 downto 0):="000000000000";
    signal d: std_logic_vector(7 downto 0);
begin
    myPC: PC port map(
        clk_pc, n_rst, n_ld, m_pc, nPCH, nPCL, PC0, addr, d
    );
    
    process
    begin
        clk_pc<=not clk_pc;
        wait for 10ns;
    end process;
    
    process
    begin
        n_ld<='1';
        wait for 10ns;
        n_rst<='1';
        wait for 20ns;
        m_pc<='1';
        wait for 100ns;
        PC0<=x"37F";
        m_pc<='0';
        n_ld<='0';
        wait for 10ns;
        n_ld<='0';
        wait for 10ns;
        nPCL<='1';
        n_ld<='1';
        wait for 10ns;
        nPCL<='0';
        wait for 10ns;
        nPCH<='1';
        wait for 10ns;
        nPCH<='0';
        m_pc<='1';
        PC0<=x"F07";
        wait for 60ns;
        m_pc<='0';
        wait for 10ns;
        n_ld<='0';
        wait for 30ns;
        n_rst<= '0';
        wait;
    end process;

end Behavioral;
