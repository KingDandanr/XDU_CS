library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity data2seg is
    port
    (
        data_in : in STD_LOGIC_VECTOR (3 downto 0);
        seg_data : out STD_LOGIC_VECTOR (7 downto 0)
    );
end data2seg;

architecture Behavioral of data2seg is
begin
    process (data_in)
	begin
		case data_in is
		when X"0"=>seg_data<=X"03"; --1 1 1 1 1 1 0 0
		when X"1"=>seg_data<=X"9F"; --0 1 1 0 0 0 0 0
		when X"2"=>seg_data<=X"25";
		when X"3"=>seg_data<=X"0D";
		when X"4"=>seg_data<=X"99";
		when X"5"=>seg_data<=X"49";
		when X"6"=>seg_data<=X"41";
		when X"7"=>seg_data<=X"1F";
		when X"8"=>seg_data<=X"01";
		when X"9"=>seg_data<=X"09";
		when X"A"=>seg_data<=X"11";
		when X"B"=>seg_data<=X"C1";
		when X"C"=>seg_data<=X"63";
		when X"D"=>seg_data<=X"85";
		when X"E"=>seg_data<=X"61";
		when X"f"=>seg_data<=X"71";
		when others=>seg_data<=X"FF";
		end case;
	end process;

end Behavioral;
