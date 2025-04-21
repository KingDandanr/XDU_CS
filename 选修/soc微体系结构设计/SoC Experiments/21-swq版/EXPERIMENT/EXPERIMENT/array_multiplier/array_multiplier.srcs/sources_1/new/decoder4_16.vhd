----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/18 13:02:24
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder4_16 is
    Port (
        sel_in:in std_logic_vector(3 downto 0);
        sel_out:out std_logic_vector(15 downto 0)
     );
end decoder4_16;

architecture Behavioral of decoder4_16 is

begin

process(sel_in)
begin
    case sel_in is
    when "0000"=>sel_out<=not"0000000000000001";
    when "0001"=>sel_out<=not"0000000000000010";
    when "0010"=>sel_out<=not"0000000000000100";
    when "0011"=>sel_out<=not"0000000000001000";
    when "0100"=>sel_out<=not"0000000000010000";
    when "0101"=>sel_out<=not"0000000000100000";
    when "0110"=>sel_out<=not"0000000001000000";
    when "0111"=>sel_out<=not"0000000010000000";
    when "1000"=>sel_out<=not"0000000100000000";
    when "1001"=>sel_out<=not"0000001000000000";
    when "1010"=>sel_out<=not"0000010000000000";
    when "1011"=>sel_out<=not"0000100000000000";
    when "1100"=>sel_out<=not"0001000000000000";
    when "1101"=>sel_out<=not"0010000000000000";
    when "1110"=>sel_out<=not"0100000000000000";
    when "1111"=>sel_out<=not"1000000000000000";
    when others=>sel_out<="1111111111111111";
    end case;
end process;

end Behavioral;
