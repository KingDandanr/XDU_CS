library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity segDis is
    port(
        clk, rst: in std_logic;
        dataInA, dataInB, dataInC, dataInD: in std_logic_vector(15 downto 0);
        segSel: out std_logic_vector(15 downto 0);
        segData: out std_logic_vector(7 downto 0)
    );
end segDis;

architecture Behavioral of segDis is
    component data2Seg is
        port(
            dataIn: in std_logic_vector(3 downto 0);    --四位8421数据输入
            segData: out std_logic_vector(7 downto 0)   --八位数码管数据输出
        );
    end component;
    signal cnt: std_logic_vector(3 downto 0):=x"0";
    signal data: std_logic_vector(3 downto 0);
begin
    reg: process(clk)
    variable maxCutCount: integer:=30000;                  --每三万次上升沿刷新数码管下一位显示
    variable cutCount: integer:=0;
    begin
        if clk'event and clk='1' then                       --时钟信号上升沿有效
            cutCount := cutCount+1;                         --数码管计数器+1
            if cutCount=maxCutCount then                    --计数器数值max
                cnt <= cnt + 1;                             --移到下一位数码管
                cutCount:=0;                                --循环次数清零
            end if;
        end if;
    end process;
    
    myData2Seg: data2Seg port map(
        data, segData
    );
    --数码管选择
    segSel <= "1111111111111110" when cnt=x"0"
        else "1111111111111101" when cnt=x"1"
        else "1111111111111011" when cnt=x"2"
        else "1111111111110111" when cnt=x"3"
        else "1111111111101111" when cnt=x"4"
        else "1111111111011111" when cnt=x"5"
        else "1111111110111111" when cnt=x"6"
        else "1111111101111111" when cnt=x"7"
        else "1111111011111111" when cnt=x"8"
        else "1111110111111111" when cnt=x"9"
        else "1111101111111111" when cnt=x"a"
        else "1111011111111111" when cnt=x"b"
        else "1110111111111111" when cnt=x"c"
        else "1101111111111111" when cnt=x"d"
        else "1011111111111111" when cnt=x"e"
        else "0111111111111111" when cnt=x"f"
        else x"ffff";
    --数码管数据输入
    data <= dataInA(15 downto 12) when cnt=x"0"
        else dataInA(11 downto 8) when cnt=x"1"
        else dataInA(7 downto 4) when cnt=x"2"
        else dataInA(3 downto 0) when cnt=x"3"
        else dataInB(15 downto 12) when cnt=x"4"
        else dataInB(11 downto 8) when cnt=x"5"
        else dataInB(7 downto 4) when cnt=x"6"
        else dataInB(3 downto 0) when cnt=x"7"
        else dataInC(15 downto 12) when cnt=x"8"
        else dataInC(11 downto 8) when cnt=x"9"
        else dataInC(7 downto 4) when cnt=x"a"
        else dataInC(3 downto 0) when cnt=x"b"
        else dataInD(15 downto 12) when cnt=x"c"
        else dataInD(11 downto 8) when cnt=x"d"
        else dataInD(7 downto 4) when cnt=x"e"
        else dataInD(3 downto 0) when cnt=x"f"
        else x"0";

end Behavioral;
