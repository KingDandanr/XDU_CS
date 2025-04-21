----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/05/22 16:19:04
-- Design Name: 
-- Module Name: XIAODOU - Behavioral
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

entity XIAODOU is
    port(clk,rst,keyin:in std_logic;
    keyout :out std_logic);
end XIAODOU;

architecture Behavioral of XIAODOU is
    type states is (s0,s1,s2,s3,s4,s5);
    signal next_state:states;
begin
    process(clk,rst,keyin)
    variable count:integer:=1000;
    begin 
        if (rst = '1') then
            next_state <=s0;
        elsif (clk'EVENT AND clk ='1') then
            case next_state is
                when s0=>
                    if (keyin = '1') then
                        next_state<=s1;
                    else null;
                    end if;
                when s1=>
                    count:=count-1;
                    if (count = 0) then
                    count:=1000;
                    next_state <=s2;
                    else null;
                    end if;
                when s2=>
                    if (keyin = '0') then
                        next_state<=s0;
                    else next_state<=s3;
                    end if;
                when s3=>
                    if (keyin = '0') then
                        next_state<=s0;
                    else next_state<=s4;
                    end if;
                when s4=>
                    if (keyin = '0') then
                        next_state<=s0;
                    else 
                        next_state<=s5;
                        keyout<='1';
                    end if;
                 when s5=>
                 if (keyin='0') then
                    keyout<='0';
                    next_state<=s0;
                 end if;
             end case;
         end if;
    end process;
end Behavioral;
