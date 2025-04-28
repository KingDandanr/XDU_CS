----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/05/22 09:59:20
-- Design Name: 
-- Module Name: alu - Behavioral
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

entity alu is
Port (m_a,m_b:in std_logic_vector(7 downto 0);
    c0:in std_logic;
    s:in std_logic_vector(4 downto 0);
    f_in:in std_logic_vector(1 downto 0);
    data: out std_logic_vector(7 downto 0);
    cy,zn: out std_logic );
end alu;

architecture Behavioral of alu is
signal a,b,result,f:std_logic_vector(7 downto 0);
signal co,acc,cyy,znn,ovv:std_logic;
component cal is 
    PORT (
        S  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0 );
        A  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        B  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        F  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        M  : IN  STD_LOGIC;
        CN : IN  STD_LOGIC;
        CO : OUT STD_LOGIC   );
END component;

begin
ls181: cal port map(S=>s(3 downto 0),A=>a,B=>b,F=>f,M=>s(4),CN=>c0,CO=>co); 

a<=m_a;b<=m_b;data<=result;


process(f, f_in)
begin
case f_in is 
when "00"=>result<=f;
when "01"=>result<=f(0) & f(7 downto 1);
when "10"=>result<=f(6 downto 0) & f(7);
when "11"=>result<=f(6 downto 0) & '0';
when others=>result<=f;
end case;
end process;

process(co,f)
begin
if f="00000000" then zn<='1'; else zn<='0'; end if;
cy<=co;
end process;

end Behavioral;
