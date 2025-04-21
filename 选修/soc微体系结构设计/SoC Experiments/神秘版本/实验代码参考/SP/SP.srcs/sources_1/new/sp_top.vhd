
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sp_top is
  port(
		clk_SP	:in std_logic;
		clk_disp: in std_logic;
		rst	:in std_logic;
		SP_CS	:in std_logic;
		nSP_EN	:in std_logic;	
		SP_UP	:in std_logic;
		SP_DN	:in std_logic;
			
		data	:in std_logic_vector(7 downto 0);
		seg_sel : out  STD_LOGIC_VECTOR (15 downto 0);
        seg_data : out  STD_LOGIC_VECTOR (7 downto 0)
	  );
end sp_top;

architecture Behavioral of sp_top is
    component module_SP
        port
        (
            clk_SP	:in std_logic; -- sw16
            reset	:in std_logic; -- 
            SP_CS	:in std_logic; -- sw30
            nSP_EN	:in std_logic; -- sw29
            SP_UP	:in std_logic; -- sw28
            SP_DN	:in std_logic; -- sw27
            data	:in std_logic_vector(7 downto 0); -- sw7 ~ sw0
            SP	:out std_logic_vector(7 downto 0)
	  );
    end component;
    
    component seg_dis_keyin
        Port
        (
            clk : in  STD_LOGIC;
            rst : in  STD_LOGIC;
            key_in : in  STD_LOGIC_VECTOR (7 downto 0);
            seg_sel : out  STD_LOGIC_VECTOR (15 downto 0);
            seg_data : out  STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;
    signal SP_temp:std_logic_vector(7 downto 0):=(others=>'0');
begin
    mySP:module_SP port map(clk_SP,rst,SP_CS,nSP_EN,SP_UP,SP_DN,data,SP_temp);
    disp:seg_dis_keyin port map(clk_disp,rst,SP_temp,seg_sel,seg_data);

end Behavioral;
