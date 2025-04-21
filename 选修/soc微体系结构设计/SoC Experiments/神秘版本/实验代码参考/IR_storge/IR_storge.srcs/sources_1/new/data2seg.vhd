LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity data2seg is
	port(
		data_in : in std_logic_vector(3 downto 0);
		seg_data : out std_logic_vector(7 downto 0)
	);
end data2seg;

architecture behavioral of data2seg is
begin
	process(data_in)
	begin
		case data_in is
			when "0000" => seg_data<="00000011";
                when "0001" => seg_data<="10011111";
                when "0010" => seg_data<="00100101";
                when "0011" => seg_data<="00001101";
                when "0100" => seg_data<="10011001";
                when "0101" => seg_data<="01001001";
                when "0110" => seg_data<="01000001";
                when "0111" => seg_data<="00011111";
                
                when "1000" => seg_data<="00000001";
                when "1001" => seg_data<="00001001";
                when "1010" => seg_data<="00010001";
                when "1011" => seg_data<="11000001";
                when "1100" => seg_data<="11000101";
                when "1101" => seg_data<="10000101";
                when "1110" => seg_data<="01100001";
                when "1111" => seg_data<="01110001";
                when others => seg_data<="11111111";
		end case;
	end process;
end behavioral;