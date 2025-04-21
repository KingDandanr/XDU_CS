----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/05/13 10:30:37
-- Design Name: 
-- Module Name: state - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity state is
Port (clk, rst : in std_logic;
    key_in : in std_logic_vector(15 downto 0);
    seg_sel : out std_logic_vector(15 downto 0);
    seg_data : out std_logic_vector(7 downto 0);
    show:in std_logic_vector(63 downto 0) );
end state;

architecture Behavioral of state is
type states is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15);
signal state,next_state:states;
signal show1: std_logic_vector(3 downto 0);
signal rsts,clks: std_logic;
signal cc: std_logic;
signal showw:std_logic_vector(63 downto 0);

component data2seg is
Port (data_in:in std_logic_vector(3 downto 0);
    seg_data:out std_logic_vector(7 downto 0));
end component;

begin
u: data2seg port map(data_in=>show1, seg_data=>seg_data);

    process(clk)
    variable count: integer range 0 to 30000;
    begin
    if clk'event and clk='1' then
    count:=count+1;
    if count=20000 then
    cc<=not cc;
    count:=0;
    end if;
    end if;
    end process;
    
    process(cc,clk,rst)    --复位和状态转移
    begin
    if rst='1' then 
        state<=s0;showw<=x"0123456789abcdef";
    elsif cc'event and cc='1' then
        showw<=show;
        state<=next_state;
    end if;
    end process;
    
    process(state)
    begin
        case state is --数码管输出
        when s0=>if key_in(0)='1' then seg_sel<=x"fffe"; show1<=showw(3 downto 0); else seg_sel<=x"ffff"; end if; next_state<=s1;
        when s1=>if key_in(1)='1' then seg_sel<=x"fffd"; show1<=showw(7 downto 4); else seg_sel<=x"ffff"; end if; next_state<=s2;
        when s2=>if key_in(2)='1' then seg_sel<=x"fffb"; show1<=showw(11 downto 8); else seg_sel<=x"ffff"; end if; next_state<=s3;
        when s3=>if key_in(3)='1' then seg_sel<=x"fff7"; show1<=showw(15 downto 12); else seg_sel<=x"ffff"; end if; next_state<=s4;
        when s4=>if key_in(4)='1' then seg_sel<=x"ffef"; show1<=showw(19 downto 16); else seg_sel<=x"ffff"; end if; next_state<=s5;
        when s5=>if key_in(5)='1' then seg_sel<=x"ffdf"; show1<=showw(23 downto 20); else seg_sel<=x"ffff"; end if; next_state<=s6;
        when s6=>if key_in(6)='1' then seg_sel<=x"ffbf"; show1<=showw(27 downto 24); else seg_sel<=x"ffff"; end if; next_state<=s7;
        when s7=>if key_in(7)='1' then seg_sel<=x"ff7f"; show1<=showw(31 downto 28); else seg_sel<=x"ffff"; end if; next_state<=s8;
        when s8=>if key_in(8)='1' then seg_sel<=x"feff"; show1<=showw(35 downto 32); else seg_sel<=x"ffff"; end if; next_state<=s9; 
        when s9=>if key_in(9)='1' then seg_sel<=x"fdff"; show1<=showw(39 downto 36); else seg_sel<=x"ffff"; end if; next_state<=s10;
        when s10=>if key_in(10)='1' then seg_sel<=x"fbff"; show1<=showw(43 downto 40); else seg_sel<=x"ffff"; end if; next_state<=s11;
        when s11=>if key_in(11)='1' then seg_sel<=x"f7ff"; show1<=showw(47 downto 44); else seg_sel<=x"ffff"; end if; next_state<=s12;
        when s12=>if key_in(12)='1' then seg_sel<=x"efff"; show1<=showw(51 downto 48); else seg_sel<=x"ffff"; end if; next_state<=s13;
        when s13=>if key_in(13)='1' then seg_sel<=x"dfff"; show1<=showw(55 downto 52); else seg_sel<=x"ffff"; end if; next_state<=s14;
        when s14=>if key_in(14)='1' then seg_sel<=x"bfff"; show1<=showw(59 downto 56); else seg_sel<=x"ffff"; end if; next_state<=s15;
        when s15=>if key_in(15)='1' then seg_sel<=x"7fff"; show1<=showw(63 downto 60); else seg_sel<=x"ffff"; end if; next_state<=s0;
        end case;
    end process;

end Behavioral;
