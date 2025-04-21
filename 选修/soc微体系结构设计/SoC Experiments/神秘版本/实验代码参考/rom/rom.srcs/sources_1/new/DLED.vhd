----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/05/19 00:11:51
-- Design Name: 
-- Module Name: DLED - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DLED is
  Port (
    data: in std_logic_vector(7 downto 0);
    clk,rst: in std_logic;
    sel:out std_logic_vector(1 downto 0);   --选择信号，只需要用两个引脚
    dis:out std_logic_vector(7 downto 0)    --输出数码管
   );
end DLED;

architecture Behavioral of DLED is
type states is (s0,s1);     --用两状态机实现
signal next_state: states:=s0;
signal temp:std_logic_vector(3 downto 0);
signal clk_out:std_logic:='0';   --输出时钟信号，对输入时钟分频
begin
    process(clk)    --负责对输入的时钟信号分频
    variable count:integer:=0;
    begin
        if clk'event and clk='1' then
            count:=count+1;
        end if;
        if count>=1000 and clk_out='0' then
            clk_out<='1';
            count:=0;
        elsif count>=1000 and clk_out='1' then
            clk_out<='0';
            count:=0;
        end if;
    end process;

    process(clk_out,rst,data)
    begin
        if rst='1' then
            next_state<=s0;
            sel<="11";
            dis<="11111111";
        elsif clk_out'event and clk_out='1' then
            case next_state is
                when s0=>
                    temp<=data(7 downto 4);
                    sel<="01";          --选中高位数码管
                    case temp is
                        when "0000"=>dis<="11000000";
                        when "0001"=>dis<="11111001";
                        when "0010"=>dis<="10100100";
                        when "0011"=>dis<="10110000";
                        when "0100"=>dis<="10011001";
                        when "0101"=>dis<="10010010";
                        when "0110"=>dis<="10000010";
                        when "0111"=>dis<="11111000";
                        when "1000"=>dis<="10000000";
                        when "1001"=>dis<="10010000";
                        when "1010"=>dis<="10001000";
                        when "1011"=>dis<="10000011";
                        when "1100"=>dis<="11000110";
                        when "1101"=>dis<="10100001";
                        when "1110"=>dis<="10000110";
                        when "1111"=>dis<="10001110";
                        when others=>dis<="11111111";
                   end case;
                   next_state<=s1;
                when s1=>
                    temp<=data(3 downto 0);
                    sel<="10";          --选中低位数码管
                    case temp is
                        when "0000"=>dis<="11000000";
                        when "0001"=>dis<="11111001";
                        when "0010"=>dis<="10100100";
                        when "0011"=>dis<="10110000";
                        when "0100"=>dis<="10011001";
                        when "0101"=>dis<="10010010";
                        when "0110"=>dis<="10000010";
                        when "0111"=>dis<="11111000";
                        when "1000"=>dis<="10000000";
                        when "1001"=>dis<="10010000";
                        when "1010"=>dis<="10001000";
                        when "1011"=>dis<="10000011";
                        when "1100"=>dis<="11000110";
                        when "1101"=>dis<="10100001";
                        when "1110"=>dis<="10000110";
                        when "1111"=>dis<="10001110";
                        when others=>dis<="11111111";
                   end case;
                   next_state<=s0;
               end case;
           end if;
       end process;
end Behavioral;
