


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity module_SP is
  port(
		clk_SP	:in std_logic;
		reset	:in std_logic;
		SP_CS	:in std_logic;
		SP_UP	:in std_logic;
		SP_DN	:in std_logic;
		nSP_EN	:in std_logic;		
		data	:in std_logic_vector(7 downto 0);
		SP	:out std_logic_vector(7 downto 0)
	  );
end module_SP;

architecture Behavioral of module_SP is

begin

    process (clk_SP,SP_CS,SP_UP,SP_DN,reset)
        variable data_temp: std_logic_vector(7 downto 0);
    begin
        if ( reset = '1') then
            SP <="00000000";
        elsif(reset ='0') then
            if(clk_SP' event and clk_SP = '1')then
                if ( SP_CS = '1' and nSP_EN = '1') then
                    data_temp := data;
                    SP <= data_temp;
                elsif (SP_CS = '1' and nSP_EN = '0' and SP_UP = '1') then
                    data_temp := data_temp+1;
                    SP <= data_temp;
                elsif ( SP_CS = '1' and nSP_EN = '0' and SP_DN = '1') then
                    data_temp := data_temp-1;
                    SP <= data_temp;
                end if;
            end if;
        end if;
    end process;

end Behavioral;
