----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 13:02:24
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seg_dis is
    port(
        rst,clk:in std_logic;
        data_in_A,data_in_B,data_in_C,data_in_D:in std_logic_vector(15 downto 0);
        seg_sel:out std_logic_vector(3 downto 0);
        seg_data:out std_logic_vector(7 downto 0)
    );

end seg_dis;

architecture Behavioral of seg_dis is
component data2seg
    port(
        data_in:in std_logic_vector(3 downto 0);
        seg_data:out std_logic_vector(7 downto 0)
    );
end component;

signal data_in_line: std_logic_vector(3 downto 0);

type states is(s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15);
signal state,next_state:states;

begin   

data2seg_inst:data2seg port map(data_in_line,seg_data);

process(rst,clk)
begin 
    if(rst='1')then state<=s0;
    elsif(clk='1'and clk'event)then
        state<=next_state;
    end if;
end process;


process(state)
begin
    case state is
    when s0=>
        seg_sel<="0000";
        data_in_line<=data_in_A(3 downto 0);
        next_state<=s1;
    when s1=>
        seg_sel<="0001";
        data_in_line<=data_in_A(7 downto 4);
        next_state<=s2;
    when s2=>
        seg_sel<="0010";
        data_in_line<=data_in_A(11 downto 8);
        next_state<=s3;
    when s3=>
        seg_sel<="0011";
        data_in_line<=data_in_A(15 downto 12);
        next_state<=s4;
    
    when s4=>seg_sel<="0100";data_in_line<=data_in_B(3 downto 0);next_state<=s5;
    when s5=>seg_sel<="0101";data_in_line<=data_in_B(7 downto 4);next_state<=s6;
    when s6=>seg_sel<="0110";data_in_line<=data_in_B(11 downto 8);next_state<=s7;
    when s7=>seg_sel<="0111";data_in_line<=data_in_B(15 downto 12);next_state<=s8;
    
    when s8=>seg_sel<="1000";data_in_line<=data_in_C(3 downto 0);next_state<=s9;
    when s9=>seg_sel<="1001";data_in_line<=data_in_C(7 downto 4);next_state<=s10;
    when s10=>seg_sel<="1010";data_in_line<=data_in_C(11 downto 8);next_state<=s11;
    when s11=>seg_sel<="1011";data_in_line<=data_in_C(15 downto 12);next_state<=s12;
    
    when s12=>seg_sel<="1100";data_in_line<=data_in_D(3 downto 0);next_state<=s13;
    when s13=>seg_sel<="1101";data_in_line<=data_in_D(7 downto 4);next_state<=s14;
    when s14=>seg_sel<="1110";data_in_line<=data_in_D(11 downto 8);next_state<=s15;
    when s15=>seg_sel<="1111";data_in_line<=data_in_D(15 downto 12);next_state<=s0;
    
    when others=>state<=next_state;
    end case;
end process;

end Behavioral;