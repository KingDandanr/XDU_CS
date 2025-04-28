library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity array_multiplier is
    Port (
        clk:in std_logic;
        a_in,b_in:in std_logic_vector(7 downto 0);
        sum_out:out std_logic_vector(15 downto 0)
    );
end array_multiplier;
 
architecture Behavioral of array_multiplier is
component array_multiplier_top
    Port (
        a_in:in std_logic;
        b_in:in std_logic_vector(7 downto 0);
        s:out std_logic_vector(7 downto 0)
     );
end component;
component array_multiplier_unit
    Port (
        x_in:in std_logic;
        y_in:in std_logic_vector(7 downto 0);
        c_in:in std_logic_vector(6 downto 0);
        z_in:in std_logic_vector(7 downto 0);
        c_out:out std_logic_vector(6 downto 0);
        z_out:out std_logic_vector(7 downto 0)
     );
end component;
component array_multiplier_low
    Port (
        z_in,c_in:in std_logic_vector(6 downto 0);
        s_out:out std_logic_vector(7 downto 0)
     );
end component;
 
signal z_in0:std_logic_vector(7 downto 0);
signal z_in1:std_logic_vector(7 downto 0);
signal z_in2:std_logic_vector(7 downto 0);
signal z_in3:std_logic_vector(7 downto 0);
signal z_in4:std_logic_vector(7 downto 0);
signal z_in5:std_logic_vector(7 downto 0);
signal z_in6:std_logic_vector(7 downto 0);
signal z_in7:std_logic_vector(7 downto 0);
signal c_in1:std_logic_vector(6 downto 0);
signal c_in2:std_logic_vector(6 downto 0);
signal c_in3:std_logic_vector(6 downto 0);
signal c_in4:std_logic_vector(6 downto 0);
signal c_in5:std_logic_vector(6 downto 0);
signal c_in6:std_logic_vector(6 downto 0);
signal c_in7:std_logic_vector(6 downto 0);
 
begin
 
array_multiplier_top_inst:array_multiplier_top port map(a_in(0),b_in,z_in0);
array_multiplier_unit_inst1:array_multiplier_unit port map(a_in(1),b_in,"0000000",z_in0,c_in1,z_in1);
array_multiplier_unit_inst2:array_multiplier_unit port map(a_in(2),b_in,c_in1,z_in1,c_in2,z_in2);
array_multiplier_unit_inst3:array_multiplier_unit port map(a_in(3),b_in,c_in2,z_in2,c_in3,z_in3);
array_multiplier_unit_inst4:array_multiplier_unit port map(a_in(4),b_in,c_in3,z_in3,c_in4,z_in4);
array_multiplier_unit_inst5:array_multiplier_unit port map(a_in(5),b_in,c_in4,z_in4,c_in5,z_in5);
array_multiplier_unit_inst6:array_multiplier_unit port map(a_in(6),b_in,c_in5,z_in5,c_in6,z_in6);
array_multiplier_unit_inst7:array_multiplier_unit port map(a_in(7),b_in,c_in6,z_in6,c_in7,z_in7);
array_multiplier_low_inst:array_multiplier_low port map(z_in7(7 downto 1),c_in7,sum_out(15 downto 8));
 
process(clk,a_in,b_in)
begin
    sum_out(0)<=z_in0(0);
    sum_out(1)<=z_in1(0);
    sum_out(2)<=z_in2(0);
    sum_out(3)<=z_in3(0);
    sum_out(4)<=z_in4(0);
    sum_out(5)<=z_in5(0);
    sum_out(6)<=z_in6(0);
    sum_out(7)<=z_in7(0);
end process;
 
end Behavioral;