----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/22 11:58:10
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    port(
        clk,clk_ALU : in std_logic; --全局时钟和ALU时钟
        nreset : in std_logic;      --全局复位信号
        M_A,M_B : in std_logic;     --暂存器控制信号
        M_F : in std_logic;         --程序状态字控制信号
        nALU_EN : in std_logic;     --alu运算结果输出使能
        nPSW_EN : in std_logic;     --psw输出使能
        C0 : in std_logic;          --进位输入
        S : in std_logic_vector(4 downto 0);        --运算类型和操作选择，M为最高位S(4),其余在低四位
        F_in : in std_logic_vector(1 downto 0);     --移位功能选择
        
        regA_out,regB_out,result_out:out std_logic_vector(7 downto 0);
        DATA_BUS : inout std_logic_vector(7 downto 0);  --数据总线
        AC : out std_logic;     --半进位标志
        CY : out std_logic;     --进位标志
        ZN : out std_logic;     --零标志
        OV : out std_logic      --溢出标志
    );
end ALU;

architecture Behavioral of ALU is
component array_multiplier
    Port (
        clk:in std_logic;
        a_in,b_in:in std_logic_vector(7 downto 0);
        sum_out:out std_logic_vector(15 downto 0)
    );
end component;
component divider_origin
    Port(
        clk,start:in std_logic;
        ain:in std_logic_vector(15 downto 0);--除数(要求除数大于被除数！)
        bin:in std_logic_vector(7 downto 0);--被除数
        done:out std_logic;

        s,r:out std_logic_vector(7 downto 0)
    );
end component;

signal regA:std_logic_vector(8 downto 0);
signal regB:std_logic_vector(8 downto 0);
signal result:std_logic_vector(8 downto 0);
signal PSW_reg:std_logic_vector(7 downto 0);        --pws(0):CY psw(1):ZN

signal AC_signal :std_logic;
signal CY_signal :std_logic;
signal ZN_signal :std_logic;
signal OV_signal :std_logic;

signal multiplier_out:std_logic_vector(15 downto 0);
signal start,done:std_logic;
signal divider_ina:std_logic_vector(15 downto 0);
signal divider_r:std_logic_vector(7 downto 0);

begin
array_multiplier_inst:array_multiplier port map(clk_ALU,regA(7 downto 0),regB(7 downto 0),multiplier_out);
--divider_origin_inst:divider_origin port map(clk,start,divider_ina,DATA_BUS,done,result(7 downto 0),divider_r);

process(clk_ALU,nreset) 
variable count:integer:=0;
begin
    if(nreset = '1')then
        start<='1';   
        regA <= "000000000";
        regA <= "000000000";
        result <= "000000000";
        DATA_BUS <= "ZZZZZZZZ";
        AC<= '0';CY<= '0';ZN<= '0';OV<= '0';
        
    elsif(clk_ALU'event and clk_ALU = '1')then
        if(M_A='1'and M_B='0')then     --锁存到A
            regA(7 downto 0) <= DATA_BUS;
            regA(8) <= '0';
        elsif(M_A='0'and M_B='1')then     --锁存到B 
            regB(7 downto 0) <= DATA_BUS;
            regB(8) <= '0';
            
        elsif(nALU_EN = '0')then
            case S is
                when "00000" =>         --直传
                    result <= regA;
                    CY_signal <= result(8);
                when "00001" =>         --加法
                    result <= regA+regB+C0;
                    CY_signal <= result(8);
                when "00010" =>         --减法
                    result <= regA - regB;
                    CY_signal <= result(8);
                    if(regA<regB)then OV_signal<='1';end if; 
                when "00100" =>         --乘法
                    result(7 downto 0) <= multiplier_out(7 downto 0);
                    CY_signal <= regA(8)xor regB(8);
                    if(regA*regB>x"FF")then OV_signal<='1';end if; 
                when "01000" =>         --除法
                    case count is
                        when 0=>
                            divider_ina<=regA(7 downto 0)&regB(7 downto 0);
                            start<='0';
                            count:=count+1;
                        when others=>null;
                    end case;
                    CY_signal <= regA(8)xor regB(8);
                    
                when "10000" =>         --清零
                    regA <= "000000000";
                    result <= regA;
                    CY_signal <= '0';
                when "10001" =>         --与
                    result <= regA and regB;
                    CY_signal <= '0';
                when "10010" =>         --或
                    result <= regA or regB;
                    CY_signal <= '0';
                when "10100" =>         --A取非
                    result <= not regA;
                    CY_signal <= '0';
                when "11000" =>         --异或
                    result <= regA xor regB;
                    CY_signal <= '0';
                when others =>
                    result <= "000000000";
            end case;
            
            case F_in is 
                when "00" => DATA_BUS<= result(7 downto 0);--直接传送
                when "01" => DATA_BUS<= result(8 downto 1);--带C右移
                when "10" => DATA_BUS<= result(6 downto 0)&CY_signal;--循环左移
                when "11" => DATA_BUS<= result(6 downto 0)&'0';--逻辑左移
                when others => DATA_BUS<=(others=>'Z');
            end case;
            
            CY <= CY_signal;
            if(result="000000000")then ZN_signal<='1';else ZN_signal<='0';end if;
            ZN<=ZN_signal;
            
        elsif(nPSW_EN = '0')then
            PSW_reg(0) <= CY_signal;
            PSW_reg(1) <= ZN_signal;
            DATA_BUS<= PSW_reg;
        else
            DATA_BUS <= "ZZZZZZZZ";
        end if;
        
    end if;
end process;

process(regA,regB,result)
begin
    regA_out<=regA(7 downto 0);
    regB_out<=regB(7 downto 0);
    result_out<=result(7 downto 0);
end process;

end Behavioral;
