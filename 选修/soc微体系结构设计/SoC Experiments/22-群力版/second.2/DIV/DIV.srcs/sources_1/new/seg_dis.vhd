library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seg_dis is
    port(
        rst,clk:in std_logic;
        data_in_A,data_in_B,data_in_C,data_in_D:in std_logic_vector(15 downto 0);
        
        seg_dig:out std_logic_vector(15 downto 0);
        seg_data:out std_logic_vector(7 downto 0)--π‹Ω≈¡¨Ω”À≥–Ú£∫dp,g,f,e,d,c,b,a
    );

end seg_dis;

architecture Behavioral of seg_dis is

signal data_in_line: std_logic_vector(3 downto 0);

type states is(s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15);
signal state,next_state:states;

begin   

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
    when s0 =>  seg_dig<=not"0000000000000001";   data_in_line<=data_in_A(3 downto 0);   next_state<=s1;
    when s1 =>  seg_dig<=not"0000000000000010";   data_in_line<=data_in_A(7 downto 4);   next_state<=s2;
    when s2 =>  seg_dig<=not"0000000000000100";   data_in_line<=data_in_A(11 downto 8);  next_state<=s3;
    when s3 =>  seg_dig<=not"0000000000001000";   data_in_line<=data_in_A(15 downto 12); next_state<=s4;   
    when s4 =>  seg_dig<=not"0000000000010000";   data_in_line<=data_in_B(3 downto 0);   next_state<=s5;
    when s5 =>  seg_dig<=not"0000000000100000";   data_in_line<=data_in_B(7 downto 4);   next_state<=s6;
    when s6 =>  seg_dig<=not"0000000001000000";   data_in_line<=data_in_B(11 downto 8);  next_state<=s7;
    when s7 =>  seg_dig<=not"0000000010000000";   data_in_line<=data_in_B(15 downto 12); next_state<=s8;     
    when s8 =>  seg_dig<=not"0000000100000000";   data_in_line<=data_in_C(3 downto 0);   next_state<=s9;
    when s9 =>  seg_dig<=not"0000001000000000";   data_in_line<=data_in_C(7 downto 4);   next_state<=s10;
    when s10=>  seg_dig<=not"0000010000000000";   data_in_line<=data_in_C(11 downto 8);  next_state<=s11;
    when s11=>  seg_dig<=not"0000100000000000";   data_in_line<=data_in_C(15 downto 12); next_state<=s12;
    when s12=>  seg_dig<=not"0001000000000000";   data_in_line<=data_in_D(3 downto 0);   next_state<=s13;
    when s13=>  seg_dig<=not"0010000000000000";   data_in_line<=data_in_D(7 downto 4);   next_state<=s14;
    when s14=>  seg_dig<=not"0100000000000000";   data_in_line<=data_in_D(11 downto 8);  next_state<=s15;
    when s15=>  seg_dig<=not"1000000000000000";   data_in_line<=data_in_D(15 downto 12); next_state<=s0;
    when others=>next_state<=s0;
    end case;
end process;

process(data_in_line)
begin
    case data_in_line is
        when "0000"=>seg_data<=not"00111111";
        when "0001"=>seg_data<=not"00000110";
        when "0010"=>seg_data<=not"01011011";
        when "0011"=>seg_data<=not"01001111";
        when "0100"=>seg_data<=not"01100110";
        when "0101"=>seg_data<=not"01101101";
        when "0110"=>seg_data<=not"01111101";
        when "0111"=>seg_data<=not"00000111";
        when "1000"=>seg_data<=not"01111111";
        when "1001"=>seg_data<=not"01101111";
        when "1010"=>seg_data<=not"01110111";
        when "1011"=>seg_data<=not"01111100";
        when "1100"=>seg_data<=not"00111001";
        when "1101"=>seg_data<=not"01011110";
        when "1110"=>seg_data<=not"01111001";
        when "1111"=>seg_data<=not"01110001";
        when others=>seg_data<=not"11111111";
    end case;
end process;

end Behavioral;