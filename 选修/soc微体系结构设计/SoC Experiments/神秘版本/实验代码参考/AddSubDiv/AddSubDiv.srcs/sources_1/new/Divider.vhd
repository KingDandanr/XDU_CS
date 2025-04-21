
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Divider is

    port(
        dividend: in std_logic_vector(8 downto 0);
        divisor: in std_logic_vector(4 downto 0);
        clk: in std_logic;
        load: in std_logic;
        done: out std_logic;
		--dividend_value2:out std_logic_vector(9 downto 0);
		--dividend_value94:out std_logic_vector(5 downto 0);
		--divisor_value2:out std_logic_vector(5 downto 0);
		--divisor_complement2:out std_logic_vector(5 downto 0);
		sign:out std_logic;
		--result: out std_logic_vector(9 downto 0)
        da: out std_logic_vector(10 downto 0)
    );
end Divider;

architecture Behavioral of Divider is
    signal dividend_value: std_logic_vector(9 downto 0);
    signal divisor_value: std_logic_vector(5 downto 0);
    signal divisor_complement: std_logic_vector(5 downto 0);
    signal control: std_logic := '0';
    signal count: integer;
	signal flag:integer;
	signal sign2:std_logic;
    signal done_value: std_logic := '0';
begin
    process(clk, load,divisor,dividend)
    begin
        if load = '1' then
            count <= 0;
            control<='0';
			flag<=0;
            done_value <= '0';
            dividend_value(7 downto 0) <= dividend(7 downto 0);
            dividend_value(9 downto 8) <= "00";
            divisor_value(3 downto 0) <= divisor(3 downto 0);
            divisor_value(5 downto 4) <= "00";
            divisor_complement <= std_logic_vector(unsigned(not divisor_value) + 1);
		
			sign2<=dividend(8) xor divisor(4);
			
        elsif rising_edge(clk) then
			if flag=0 and  count = 4 then
				if dividend_value(9) = '1' and done_value = '0' then
					dividend_value(9 downto 4) <= std_logic_vector(unsigned(dividend_value(9 downto 4)) + unsigned(divisor_value(5 downto 0)));
				end if;
				done_value <= '1';
			elsif flag=0 and count<4 then
                control <= dividend_value(9);
                dividend_value(9 downto 0) <= dividend_value(8 downto 0) & control;
				
				flag<=1;
			elsif flag=1 and count<4 then
                --dividend_value94 <= dividend_value(9 downto 4);----!!!!!!!!!!!
                
                if control = '0' then
                    dividend_value(9 downto 4) <= std_logic_vector(unsigned(dividend_value(9 downto 4)) + unsigned(divisor_complement(5 downto 0)));
                elsif control = '1' then
                    dividend_value(9 downto 4) <= std_logic_vector(unsigned(dividend_value(9 downto 4)) + unsigned(divisor_value(5 downto 0)));
                end if;
				
				flag<=2;
			elsif flag=2 and count<4 then
                control <= not dividend_value(9);
				count <= count + 1;
				
				flag<=0;
			end if;
        end if;
		    da <=dividend_value&control;
			--result <=sign&(dividend_value(7 downto 0)&control);
            done <=done_value;
            sign<=sign2;
			--dividend_value2 <= dividend_value;
			--divisor_value2 <= divisor_value;
			--divisor_complement2 <= divisor_complement;
			--control2 <= control;
    end process;
end Behavioral;
