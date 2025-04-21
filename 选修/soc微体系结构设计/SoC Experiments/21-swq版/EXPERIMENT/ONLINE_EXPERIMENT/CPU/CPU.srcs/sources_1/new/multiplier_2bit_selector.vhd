library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity multiplier_2bit_selector is
    Port (
        clk,rst:in std_logic;
        a0,a1,cin:in std_logic;
        din:in std_logic_vector(7 downto 0);
        cout:out std_logic;
        dout:out std_logic_vector(7 downto 0)
     );
end multiplier_2bit_selector;

architecture Behavioral of multiplier_2bit_selector is

begin

process(clk,a0,a1,cin,din)
begin
    if(rst='1')then cout<='0';dout<="00000000";
    elsif(rst='0'and clk'event and clk='0')then
        if(a0=a1 and a0=cin)then dout<="00000000";cout<=cin;
        elsif(a1='0'and (a0 xor cin)='1')then dout<=din;cout<='0';
        elsif((a1 xor a0)='1'and a0=cin)then
            dout(7 downto 1)<=din(6 downto 0);  
            dout(0)<='0';
            cout<='0';
        elsif(a1='1'and(a0 xor cin)='1')then
            dout<=(not din)+1;
            cout<='1';  
        end if;
    end if;    
end process;

end Behavioral;
