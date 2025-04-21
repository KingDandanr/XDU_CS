----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/04/01 20:43:41
-- Design Name: 
-- Module Name: clock - Behavioral
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

entity clock is
    Port(
        clk,rst:in std_logic;
        clk1,nclk1:out std_logic;   --clk
        clk2,nclk2:out std_logic;   --clk二分频
        w0,w1,w2,w3:out std_logic   --节拍信号
    );
end clock;

architecture Behavioral of clock is
begin

process(clk)
variable count_clk2:integer:=0;
variable count_w:integer:=0;
begin
    if(rst='1')then
        w0<='0';
        w1<='0';
        w2<='0';
        w3<='0';
        clk1<='0';
        nclk1<='1';
        clk2<='0';
        nclk2<='1';
        count_clk2:=0;
        count_w:=0;
    elsif(rst='0')then
        clk1<=clk;
        nclk1<=not clk;
        if(clk'event and clk='1')then
            if(count_clk2=0)then count_clk2:=1;clk2<='1';nclk2<='0';
            elsif(count_clk2=1)then count_clk2:=0;clk2<='0';nclk2<='1';
            end if;
            if(count_w>=0 and count_w<=3)then w0<='1';else w0<='0';end if;
            if(count_w>=4 and count_w<=7)then w1<='1';else w1<='0';end if;
            if(count_w>=8 and count_w<=11)then w2<='1';else w2<='0';end if;
            if(count_w>=12 and count_w<=15)then w3<='1';else w3<='0';end if;
            if(count_w<15)then count_w:=count_w+1;else count_w:=0;end if;
        end if;
    end if;
end process;

end Behavioral;
