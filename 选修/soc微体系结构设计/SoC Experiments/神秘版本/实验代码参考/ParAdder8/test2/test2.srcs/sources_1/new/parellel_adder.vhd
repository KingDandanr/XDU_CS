library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity parellel_adder is
  Port ( 
            a: in std_logic_vector(7 downto 0);
            b: in std_logic_vector(7 downto 0);
            sel_in: in std_logic_vector(3 downto 0);
            c_in: in std_logic;
            sel_out: out std_logic_vector(3 downto 0);
            c_out: out std_logic;
            sum_out: out std_logic_vector(7 downto 0)
  
  );
end parellel_adder;

architecture Behavioral of parellel_adder is

signal c0,c1,c2,c3,c4,c5,c6: std_logic := '0';

begin
    sum_out(0) <= a(0) xor b(0) xor c_in;
    c0 <= (a(0) and b(0)) or (a(0) and c_in) or (b(0) and c_in);
    
    sum_out(1) <= a(1) xor b(1) xor c0;
    c1 <= (a(1) and b(1)) or (a(1) and c0) or (b(1) and c0);
    
    sum_out(2) <= a(2) xor b(2) xor c1;
    c2 <= (a(2) and b(2)) or (a(2) and c1) or (b(2) and c1);
    
    sum_out(3) <= a(3) xor b(3) xor c2;
    c3 <= (a(3) and b(3)) or (a(3) and c2) or (b(3) and c2);
    
    sum_out(4) <= a(4) xor b(4) xor c3;
    c4 <= (a(4) and b(4)) or (a(4) and c3) or (b(4) and c3);
    
    sum_out(5) <= a(5) xor b(5) xor c4;
    c5 <= (a(5) and b(5)) or (a(5) and c4) or (b(5) and c4);
    
    sum_out(6) <= a(6) xor b(6) xor c5;
    c6 <= (a(6) and b(6)) or (a(6) and c5) or (b(6) and c5);
    
    sum_out(7) <= a(7) xor b(7) xor c6;
    c_out <= (a(7) and b(7)) or (a(7) and c6) or (b(7) and c6);
    
    sel_out <= sel_in;

end Behavioral;
