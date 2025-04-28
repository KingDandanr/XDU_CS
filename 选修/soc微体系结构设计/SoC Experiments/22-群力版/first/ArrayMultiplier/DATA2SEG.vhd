library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity data2seg is
    port(
        data_in:in std_logic_vector(3 downto 0);
        seg_data:out std_logic_vector(7 downto 0)
    );
 
end data2seg;
 
architecture Behavioral of data2seg is
begin 
process(data_in)
begin
    case data_in is
        when "0000"=>seg_data<=not"00111111";
        when "0001"=>seg_data<=not"00000110";
        when "0010"=>seg_data<=not"01011011";
        when "0011"=>seg_data<=not"01001111";
        when "0100"=>seg_data<=not"01100110";
        when "0101"=>seg_data<=not"11101101";
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