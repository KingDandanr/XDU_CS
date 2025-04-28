----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/05/16 14:46:12
-- Design Name: 
-- Module Name: FIFOControl - Behavioral
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

entity FIFOControl is
--  Port ( );
	generic(
		width:positive:=8;	--N
		depth:positive:=8	--M
	);
	port(
		clk:in std_logic;
		clkk:in std_logic;
		rst,rst2:in std_logic;
		wr:in std_logic;
		re:in std_logic;
		wrEn:in std_logic;
		reEn:in std_logic;
		dataIn:in std_logic_vector(width-1 downto 0);
		dataOut:inout std_logic_vector(width-1 downto 0);
		empty:out std_logic;
		full:out std_logic;
		segSel : out std_logic_vector(7 downto 0);
        segData : out std_logic_vector(7 downto 0)
	);
end FIFOControl;

architecture Behavioral of FIFOControl is
	type ram is array(0 to depth-1)of std_logic_vector(width-1 downto 0);
	signal dataSum:integer range 0 to depth;
	signal readPtr,writePtr:integer range 0 to depth-1;
	signal myRam:ram;
	signal clkk2:std_logic;
	component XIAODOU 
	   port(clk,rst,keyin:in std_logic;
        keyout :out std_logic);
    end component;
    TYPE states IS (s0,s1,s2,s3,s4,s5,s6,s7);
	signal next_state :states:= s0;
	signal clkFenPin:std_logic;
begin
    ck :process(clk)
		variable cnt:integer:=0;
	begin
		if(clk'EVENT and clk ='1') then 
			cnt:=cnt+1;
		end if;
		if(cnt = 1000 and clkFenPin='0') then
			clkFenPin <= '1';
			cnt:=0;
		elsif(cnt=1000 and clkFenPin='1') then
			clkFenPin <= '0';
			cnt:=0;
		end if;
	end process;
	
    u1:XIAODOU port map(clk,rst2,clkk,clkk2);
	process(clkk2)
	begin
		if rising_edge(clkk2) then
			if(rst='1') then
				dataSum<=0;
				readPtr<=0;
				writePtr<=0;
			elsif reEn='1'and re='1'and wrEn='0' and wr='0' and dataSum>0 then
				dataOut<=myRam(readPtr);
				readPtr<=(readPtr+1)mod depth;
				dataSum<=dataSum-1;
			elsif reEn='0'and re='0'and wrEn='1' and wr='1' and dataSum<depth then
				myRam(writePtr)<=dataIn;
				writePtr<=(writePtr+1)mod depth;
				dataSum<=dataSum+1;
			end if;
		end if;
	end process;
	process(clk,dataout)
	variable a:std_logic_vector(7 downto 0);
	begin
	a:=dataout;
	if(clkFenPin'EVENT and clkFenPin ='1') then 
		case next_state is
			when s0 =>
				if(a(0) = '0') then
					segSel <= "11111110";
					segData <="11000000";	
				elsif(a(0) = '1') then
				    segSel <= "11111110";
					segData <="11111001";
				end if;
				next_state <= s1;
			when s1 =>
				if(a(1) = '0') then
					segSel <= "11111101";
					segData <="11000000";	
				elsif(a(1) = '1') then
				    segSel <= "11111101";
					segData <="11111001";
				end if;
				next_state <= s2;			
			when s2 =>
				if(a(2) = '0') then
					segSel <= "11111011";
					segData <="11000000";	
				elsif(a(2) = '1') then
				    segSel <= "11111011";
					segData <="11111001";
				end if;
				next_state <= s3;
         
			when s3 =>
				if(a(3) = '0') then
					segSel <= "11110111";
					segData <="11000000";	
				elsif(a(3) = '1') then
				    segSel <= "11110111";
					segData <="11111001";
				end if;
				next_state <= s4;
         
			when s4 =>
				if(a(4) = '0') then
					segSel <= "11101111";
					segData <="11000000";	
				elsif(a(4) = '1') then
				    segSel <= "11101111";
					segData <="11111001";
				end if;
				next_state <= s5;
         
			when s5 =>
				if(a(5) = '0') then
					segSel <= "11011111";
					segData <="11000000";	
				elsif(a(5) = '1') then
				    segSel <= "11011111";
					segData <="11111001";
				end if;
				next_state <= s6;
         
			when s6 =>
				if(a(6) = '0') then
					segSel <= "10111111";
					segData <="11000000";	
				elsif(a(2) = '1') then
				    segSel <= "10111111";
					segData <="11111001";
				end if;
				next_state <= s7;
         
			when s7 =>
				if(a(7) = '0') then
					segSel <= "01111111";
					segData <="11000000";	
				elsif(a(7) = '1') then
				    segSel <= "01111111";
					segData <="11111001";
				end if;
				next_state <= s0;
		end case; 
	end if;
	end process;
	process(clk)
	begin
		if rising_edge(clk) then
			if dataSum=depth then
				full<='1';
			else
				full<='0';
			end if;
			if dataSum=0 then
				empty<='1';
			else
				empty<='0';
			end if;
		end if;
	end process;
	
end Behavioral;
