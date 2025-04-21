library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_IO is
port(
clk_P0:in std_logic;
reset:in std_logic;
P0_CS:in std_logic;
P0_IEN:in std_logic;
P0_OEN:in std_logic;
InEN:in std_logic;
OutEN:in std_logic;
P0_IN:in std_logic_vector (7 downto 0);
P0_OUT:out std_logic_vector (7 downto 0);
data_out:out std_logic_vector (7 downto 0);
data_in:in std_logic_vector (7 downto 0)
    );

end PC_IO;

architecture Behavioral of PC_IO is

begin
process(clk_P0,P0_CS,P0_IEN,P0_IN,P0_OEN)
variable lockin:std_logic_vector(7 downto 0);
begin
     if(reset='1') then
        if(clk_P0' EVENT and clk_P0='1')then
              if( P0_CS='1' and P0_IEN='0') then
                     lockin:=P0_IN;
                     if InEN ='0' then
                        data_out<=lockin;
                     end if;
              end if;
              if( P0_CS='1' and P0_OEN='0') then
                     lockin:=data_in;
                     if OutEN ='0' then
                        P0_OUT<=lockin;
                     end if;
               end if;
	       end if;
	  elsif(reset='0') then
	      P0_OUT<="00000000";
	      data_out <="00000000";
	end if;
end process;


end Behavioral;
