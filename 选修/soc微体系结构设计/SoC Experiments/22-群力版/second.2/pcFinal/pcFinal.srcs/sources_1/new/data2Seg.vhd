library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity data2Seg is
    port(
        dataIn: in std_logic_vector(3 downto 0);
        segData: out std_logic_vector(7 downto 0)
    );
end data2Seg;

architecture Behavioral of data2Seg is

begin
    segData <= "00000011" when dataIn=x"0"
        else "10011111" when dataIn=x"1"
        else "00100101" when dataIn=x"2"
        else "00001101" when dataIn=x"3"
        else "10011001" when dataIn=x"4"
        else "01001001" when dataIn=x"5"
        else "01000001" when dataIn=x"6"
        else "00011111" when dataIn=x"7"
        else "00000001" when dataIn=x"8"
        else "00001001" when dataIn=x"9"
        else "00010001" when dataIn=x"a"
        else "11000001" when dataIn=x"b"
        else "01100011" when dataIn=x"c"
        else "10000101" when dataIn=x"d"
        else "01100001" when dataIn=x"e"
        else "01110001" when dataIn=x"f"
        else "11111111";
end Behavioral;
