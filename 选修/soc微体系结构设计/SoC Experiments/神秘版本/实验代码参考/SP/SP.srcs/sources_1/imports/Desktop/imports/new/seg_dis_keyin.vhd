library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seg_dis_keyin is
    Port
    (
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
		key_in : in  STD_LOGIC_VECTOR (7 downto 0);
        seg_sel : out  STD_LOGIC_VECTOR (15 downto 0);
        seg_data : out  STD_LOGIC_VECTOR (7 downto 0)
    );
end seg_dis_keyin;

architecture Behavioral of seg_dis_keyin is
    component seg_dis
    --generic( 
		--clk_MHz: integer:=50;
		--t_REF_uS: integer:=1000		-- 8K the same purpose
		--);
        Port
        (
            clk : in  STD_LOGIC;
            rst : in  STD_LOGIC;
            data_in_A : in  STD_LOGIC_VECTOR (15 downto 0);
            data_in_B : in  STD_LOGIC_VECTOR (15 downto 0);
            data_in_C : in  STD_LOGIC_VECTOR (15 downto 0);
            data_in_D : in  STD_LOGIC_VECTOR (15 downto 0);
            seg_sel : out  STD_LOGIC_VECTOR (15 downto 0);
            seg_data : out  STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;
    
    signal data_dis_A:STD_LOGIC_VECTOR (15 downto 0):=X"0000";
    signal data_dis_B:STD_LOGIC_VECTOR (15 downto 0):=X"0000";
    signal data_dis_C:STD_LOGIC_VECTOR (15 downto 0):=X"0000";
    signal data_dis_D:STD_LOGIC_VECTOR (15 downto 0):=X"0000";
    signal sel_middle1:  STD_LOGIC_VECTOR (3 downto 0);
    signal sel_middle2:  STD_LOGIC_VECTOR (15 downto 0);

begin
    data_dis_A(7 downto 0)<=key_in(7 downto 0);
    data_dis_A(15 downto 8)<=(others=>'0');

    data_dis_B(15 downto 0)<=(others=>'0');
    data_dis_C(15 downto 0)<=(others=>'0');
    data_dis_D(15 downto 0)<=(others=>'0');

    

    
    U1:	seg_dis PORT MAP
    (
        clk => clk,
		rst => rst,
		data_in_A => data_dis_A,
		data_in_B => data_dis_B,
		data_in_C => data_dis_C,
		data_in_D => data_dis_D,
		seg_sel => seg_sel,
		seg_data => seg_data
	);
	
end Behavioral;
