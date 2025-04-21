library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pcFinal is
    port(
        clk: in std_logic;                              --时钟信号
        n_rst: in std_logic;                            --复位信号
        n_ld: in std_logic;                             --PC送addr
        m_pc: in std_logic;                             --PC+1送addr
        nPCH, nPCL: in std_logic;                       --高低位
        PC_in: in std_logic_vector(11 downto 0);        --PC输入
        segSel: out std_logic_vector(15 downto 0);      --数码管选择
        segData: out std_logic_vector(7 downto 0)       --数码管数据
    );
end pcFinal;

architecture Behavioral of pcFinal is
    component clkDIs is
        port(
            clk: in std_logic;
            clk_seg: out std_logic;
            clk_pc: out std_logic
        );
    end component;
    
    component segDis is
        port(
            clk, rst: in std_logic;
            dataInA, dataInB, dataInC, dataInD: in std_logic_vector(15 downto 0);
            segSel: out std_logic_vector(15 downto 0);
            segData: out std_logic_vector(7 downto 0)
        );
    end component;
    
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
    
    signal clk_seg, clk_pc: std_logic;
    signal addr, d: std_logic_vector(15 downto 0):=x"0000";
    constant no_signal: std_logic_vector(15 downto 0):="ZZZZZZZZZZZZZZZZ";
    
begin
    myClk: clkDIs port map(
        clk, clk_seg, clk_pc
    );
    mySeg: segDis port map(
        clk_seg, '0', addr, d, no_signal, no_signal, segSel, segData
    );
    myPC: PC port map(
        clk_pc, n_rst, n_ld, m_pc, nPCH, nPCL, PC_in, addr(11 downto 0), d(7 downto 0)
    );

end Behavioral;
