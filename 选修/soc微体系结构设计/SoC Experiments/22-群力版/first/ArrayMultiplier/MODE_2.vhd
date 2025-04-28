library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity array_multiplier_unit is
    Port (
        x_in:in std_logic;
        y_in:in std_logic_vector(7 downto 0);
        c_in:in std_logic_vector(6 downto 0);
        z_in:in std_logic_vector(7 downto 0);
        c_out:out std_logic_vector(6 downto 0);
        z_out:out std_logic_vector(7 downto 0)
     );
end array_multiplier_unit;
 
architecture Behavioral of array_multiplier_unit is
component adder_1bit
    Port (
        a,b,c_in:in std_logic;
        s,c_out:out std_logic
     );
end component;
 
signal a_line:std_logic_vector(7 downto 0);
 
begin
 
adder_1bit_inst1:adder_1bit port map(a_line(0),c_in(0),z_in(1),z_out(0),c_out(0));
adder_1bit_inst2:adder_1bit port map(a_line(1),c_in(1),z_in(2),z_out(1),c_out(1));
adder_1bit_inst3:adder_1bit port map(a_line(2),c_in(2),z_in(3),z_out(2),c_out(2));
adder_1bit_inst4:adder_1bit port map(a_line(3),c_in(3),z_in(4),z_out(3),c_out(3));
adder_1bit_inst5:adder_1bit port map(a_line(4),c_in(4),z_in(5),z_out(4),c_out(4));
adder_1bit_inst6:adder_1bit port map(a_line(5),c_in(5),z_in(6),z_out(5),c_out(5));
adder_1bit_inst7:adder_1bit port map(a_line(6),c_in(6),z_in(7),z_out(6),c_out(6));
 
process(x_in,y_in)
begin 
    z_out(7)<=x_in and y_in(7);
    for i in 0 to 7 loop
       a_line(i)<=x_in and y_in(i);
    end loop;
end process;
 
end Behavioral;