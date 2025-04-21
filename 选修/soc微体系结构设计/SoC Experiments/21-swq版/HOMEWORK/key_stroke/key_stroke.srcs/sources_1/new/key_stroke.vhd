----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/04/01 08:54:46
-- Design Name: 
-- Module Name: key_stroke - Behavioral
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

entity key_stroke is
    generic(CLK_FRE:integer:=50000000);
    Port (
        clk:in std_logic;
        reset:in std_logic;
        key_in:in std_logic;
        output:out std_logic           
    );
end key_stroke;

architecture Behavioral of key_stroke is

type states is(s0,s1,s2,s3,s4);
signal state:states;

begin
process(reset,clk,key_in)
variable count_num:integer:=3*CLK_FRE/1000;
variable count:integer:=0;
    begin
        if reset='1'then
            state<=s0;
            count:=0;
            output<='0';
        elsif reset='0'then
            case state is
                when s0=>if key_in='1' then state<=s1;end if;
                when s1=>
                    if clk='1' then count:=count+1;end if;
                    if count=count_num then state<=s2; end if;
                when s2=>
                    if(key_in='1')then output<='1';state<=s3;
                    elsif(key_in='0')then output<='0';state<=s4;
                    end if;
                when s3=>
                    output<='0';
                    if(key_in='0')then state<=s4;end if;
                when s4=>
                    state<=s0;
                    count:=0;
                    output<='0';             
            end case;               
        end if;     
end process;



end Behavioral;
