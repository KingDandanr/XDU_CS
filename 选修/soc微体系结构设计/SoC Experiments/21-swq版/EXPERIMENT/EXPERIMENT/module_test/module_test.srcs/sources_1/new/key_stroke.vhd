library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity key_stroke is
    generic(CLK_FRE:integer:=100000000);
    Port (
        clk:in std_logic;
        reset:in std_logic;
        key_in:in std_logic;
        output:out std_logic           
    );
end key_stroke;

architecture Behavioral of key_stroke is

type states is(s0,s1,s2,s3);
signal state:states;

begin

process(reset,clk,key_in)
variable count_num:integer:=3*CLK_FRE/1000;--delay 3ms
variable count:integer:=0;
    begin
        if reset='0'then
            state<=s0;
            count:=0;
            output<='0';
        elsif(clk='1'and clk'event)then
            case state is
                when s0=>if(key_in='1')then count:=0;output<='0';state<=s1;end if;
                when s1=>
                    count:=count+1;
                    if (count>=count_num) then state<=s2; end if;
                when s2=>
                    if(key_in='1')then output<='1';state<=s3;
                    --if(key_in='1')then output<='1';state<=s0;--one clk cycle
                    elsif(key_in='0')then state<=s0;
                    end if;
                when s3=>if(key_in='0')then state<=s0;end if;                                                                   
            end case;               
        end if;     
end process;

end Behavioral;
