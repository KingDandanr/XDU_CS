library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PC is
    port(
        clk_pc: in std_logic;                       --PC时钟信号
        n_rst: in std_logic;                        --清零信号
        n_ld: in std_logic;                         --新PC送入
        m_pc: in std_logic;                         --PC值+1
        nPCH, nPCL: in std_logic;                   --高低位
        PC: in std_logic_vector(11 downto 0);       --PC数据
        addr: out std_logic_vector(11 downto 0);    --地址
        d: inout std_logic_vector(7 downto 0)       --数据总线
    );
end PC;

architecture Behavioral of PC is
    signal myPC: std_logic_vector(11 downto 0):="000000000000";
begin
    addr <= myPC;
    
    process(n_rst, clk_pc, m_pc, n_ld)
    begin
        if n_rst='0' then
            myPC <= "000000000000";                     --清零
            d <= "ZZZZZZZZ";                            --数据总线高阻态
        elsif clk_pc'event and clk_pc='1'then
            if m_pc='1' then                            --PC值+1
                myPC <= myPC+1;
            elsif n_ld='0' then                         --送入新PC
                myPC<=PC;
            end if;
        end if;
    end process;
    
    process(nPCH, nPCL)
    begin
        if nPCH='0' and nPCL='1' then                   --高位低电平，低位高电平有效
            d(3 downto 0) <= myPC(11 downto 8);         --高四位输入到数据总线
            d(7 downto 4) <= "0000";
        elsif nPCL='0' and nPCH='1' then                --低位低电平，高位高电平有效
            d <= myPC(7 downto 0);                      --低八位输入到数据总线
        else
            d <= "ZZZZZZZZ";                            --数据总线高阻态
        end if;
    end process;

end Behavioral;
