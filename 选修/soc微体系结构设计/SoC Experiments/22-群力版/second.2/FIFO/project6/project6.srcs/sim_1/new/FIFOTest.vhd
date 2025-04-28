----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/05/16 17:39:16
-- Design Name: 
-- Module Name: FIFOTest - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIFOTest is
--  Port ( );
end FIFOTest;

architecture Behavioral of FIFOTest is

    signal clk1,rst1,wr1,re1,wrEn1,reEn1:std_logic;
    signal dataIn1,dataOut1:std_logic_vector(7 downto 0);
    signal empty1,full1:std_logic;
	signal tmp:integer;
	constant per:time:=1ns;


component FIFOControl is
--  Port ( );
	generic(
		width:positive:=8;	--N
		depth:positive:=8	--M
	);
	port(
		clk:in std_logic;
		rst:in std_logic;
		wr:in std_logic;
		re:in std_logic;
		wrEn:in std_logic;
		reEn:in std_logic;
		dataIn:in std_logic_vector(width-1 downto 0);
		dataOut:out std_logic_vector(width-1 downto 0);
		empty:out std_logic;
		full:out std_logic
	);
end component;
	
begin
    uut : FIFOControl
    generic map(
        width => 8,
        depth => 4
    )

    PORT MAP(
        clk => clk1,
        rst => rst1,
        wr => wr1,
        re => re1,
		wrEn => wrEn1,
		reEn => reEn1,
        dataIn => dataIn1,
        dataOut => dataOut1,
        empty => empty1,
        full => full1
    );

	process
    begin
    for n in 0 TO 50 LOOP
		wait for per;
        clk1<='1';
        wait for per;
        clk1<='0';
	end LOOP;
	end process;

    process
    begin
		wait for per*2;
        rst1 <= '1';
        dataIn1 <= (others => '0');
        wait for per*2;
        rst1 <= '0';
        wait for per*2;
		
		tmp<=0;
		while tmp<3 loop
		    wrEn1<='1';
			wait for per*2;
			wr1 <= '1';
			dataIn1 <= "11110000";
			wait for per*2;
			wr1 <= '0';
			wait for per*2;
			wrEn1<='0';
			wait for per*2;
			reEn1<='1';
			wait for per*2;
			re1 <= '1';
			wait for per*2;
			re1 <= '0';
			wait for per*2;
			reEn1<='0';
			wait for per*2;
			
			tmp<=tmp+1;
		end loop;
				
		tmp<=0;
		while tmp<9 loop
		    wrEn1<='1';
			wait for per*2;
			wr1 <= '1';
			dataIn1 <= "00001111";
			wait for per*2;
			wr1 <= '0';
			wait for per*2;
			wrEn1<='0';
			wait for per*2;
			
			tmp<=tmp+1;
		end loop;
		
		--tmp<=0;
		while tmp>0 loop
			reEn1<='1';
			wait for per*2;
			re1 <= '1';
			wait for per*2;
			re1 <= '0';
			wait for per*2;
			reEn1<='0';
			wait for per*2;
			
			tmp<=tmp-1;
		end loop;
		
    wait;
    end process;
end Behavioral;
