
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
entity design1 is
    Port(
           k_in :in std_logic_vector(15 downto 0);
           clk :in std_logic;
           seg_sel : out std_logic_vector(15 downto 0);
           seg_data : out std_logic_vector(7 downto 0);
           rst : in std_logic
    );
end design1;

architecture Behavioral of design1 is
TYPE states IS (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15);
signal next_state :states:= s0;
signal clk1:std_logic;
Begin
ck :process(clk)
variable cnt:integer:=0;
begin
if(clk'EVENT and clk ='1') then 
cnt:=cnt+1;
end if;
if(cnt = 1000 and clk1='0') then
clk1 <= '1';
cnt:=0;
elsif(cnt=1000 and clk1='1') then
clk1 <= '0';
cnt:=0;
end if;
end process;

state_change:process
begin
if(rst='1') then
 next_state <= s0;
 seg_sel<="0000000000000000";
elsif(clk1'EVENT and clk1 ='1') then 
  case next_state is
      when s0 =>
         if(k_in(0) = '1') then
          seg_sel <= "1111111111111110";
          seg_data <="11000000";--11000000表示0
          end if;
          next_state <= s1;
       when s1 =>
         if(k_in(1) = '1') then
          seg_sel <="1111111111111101";
           seg_data <="11111001";--11111001表示1
          end if;
          next_state <= s2;
         
        when s2 =>
         if(k_in(2) = '1') then
          seg_sel <= "1111111111111011";
             seg_data <="10100100";--10100100表示2
          end if;
          next_state <= s3;
         
        when s3 =>
         if(k_in(3) = '1') then
          seg_sel <= "1111111111110111";
             seg_data <="10110000";--10110000表示3
          end if;
          next_state <= s4;
         
        when s4 =>
         if(k_in(4) = '1') then
          seg_sel <= "1111111111101111";
             seg_data <="10011001";--10011001表示4
          end if;
          next_state <= s5;
         
        when s5 =>
         if(k_in(5) = '1') then
          seg_sel <= "1111111111011111";
             seg_data <="10011001";--10010010表示5   --4
         end if;
          next_state <= s6;
         
        when s6 =>
         if(k_in(6) = '1') then
          seg_sel <= "1111111110111111";
             seg_data <="11000000";--10000010表示6  --0
         end if;
          next_state <= s7;
         
         
        when s7 =>
         if(k_in(7) = '1') then
          seg_sel <= "1111111101111111";
             seg_data <="11000000";--11111000表示7  --0
         end if;
          next_state <= s8;
         
        when s8 =>
         if(k_in(8) = '1') then
          seg_sel <= "1111111011111111";
             seg_data <="11111001";--10000000表示8  --1
          end if;
          next_state <= s9;
         
        when s9 =>
         if(k_in(9) = '1') then
          seg_sel <= "1111110111111111";
             seg_data <="11000000";--10010000表示9  --0
         end if;
          next_state <= s10;
         
        when s10 =>
         if(k_in(10) = '1') then
          seg_sel <= "1111101111111111";
             seg_data <="10100100";--10001000表示A  --2
         end if;
          next_state <= s11;
         
        when s11 =>
         if(k_in(11) = '1') then
          seg_sel <= "1111011111111111";
             seg_data <="10010000";--10000011表示b  --9
         end if;
          next_state <= s12;
         
        when s12 =>
         if(k_in(12) = '1') then
          seg_sel <= "1110111111111111";
             seg_data <="11000000";--11000110表示c --0
         end if;
          next_state <= s13;
        
        when s13 =>
         if(k_in(13) = '1') then
          seg_sel <= "1101111111111111";
             seg_data <="11000000";--0
        end if;
          next_state <= s14;
         
        when s14 =>
         if(k_in(14) = '1') then
          seg_sel <= "1011111111111111";
             seg_data <="10100100";--2
         end if;
          next_state <= s15;
         
        when s15 =>
         if(k_in(15) = '1') then
          seg_sel <= "0111111111111111";
             seg_data <="10100100";--2
         end if;
          next_state <= s0;
      end case; 
   end if;
end process;


end Behavioral;