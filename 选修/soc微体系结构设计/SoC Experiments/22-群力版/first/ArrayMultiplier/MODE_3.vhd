library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity array_multiplier_low is
    Port (
        z_in,c_in:in std_logic_vector(6 downto 0);
        s_out:out std_logic_vector(7 downto 0)
     );
end array_multiplier_low;
 
architecture Behavioral of array_multiplier_low is
component adder_1bit
    Port (
        a,b,c_in:in std_logic;
        s,c_out:out std_logic
     );
end component;
 
signal c_line:std_logic_vector(5 downto 0);
 
begin
 
adder_1bit_inst0:adder_1bit port map(z_in(0),c_in(0),'0',s_out(0),c_line(0));
adder_1bit_inst1:adder_1bit port map(z_in(1),c_in(1),c_line(0),s_out(1),c_line(1));
adder_1bit_inst2:adder_1bit port map(z_in(2),c_in(2),c_line(1),s_out(2),c_line(2));
adder_1bit_inst3:adder_1bit port map(z_in(3),c_in(3),c_line(2),s_out(3),c_line(3));
adder_1bit_inst4:adder_1bit port map(z_in(4),c_in(4),c_line(3),s_out(4),c_line(4));
adder_1bit_inst5:adder_1bit port map(z_in(5),c_in(5),c_line(4),s_out(5),c_line(5));
adder_1bit_inst6:adder_1bit port map(z_in(6),c_in(6),c_line(5),s_out(6),s_out(7));
 
end Behavioral;