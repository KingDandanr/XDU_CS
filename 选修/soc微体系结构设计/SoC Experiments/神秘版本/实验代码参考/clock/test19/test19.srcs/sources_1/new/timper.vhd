----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/27 10:20:18
-- Design Name: 
-- Module Name: timper - Behavioral
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

entity timper is
Port (
        clk: in std_logic;
        rstn: in std_logic;
        clk1: out std_logic;
        clk2: out std_logic;
        nclk1: out std_logic;
        nclk2: out std_logic;
        w0: out std_logic;
        w1: out std_logic;
        w2: out std_logic;
        w3: out std_logic
        
);
end timper;

architecture Behavioral of timper is

begin

process(clk)
variable cnt1: integer range 0 to 1 := 0;
variable cnt2: integer range 0 to 7 := 0;
begin

clk1 <= clk and rstn;
nclk1 <= rstn and (clk xor '1');

if(clk'event and clk = '1')then     --clk2,nclk2
    if(rstn = '0') then
        clk2 <= '0';
        nclk2 <= '0';
        w0 <= '0';
        w1 <= '0';
        w2 <= '0';
        w3 <= '0';
    else
        if(cnt1 < 2)then
            if(cnt1 < 1)then
                clk2 <= '1';
                nclk2 <= '0';
            elsif(cnt1 < 2)then
                clk2 <= '0';
                nclk2 <= '1';
            end if;
            cnt1 := cnt1 + 1;
            if(cnt1 = 2)then
                cnt1 := 0;
            end if;
        end if;
        if(cnt2 < 8)then
                if(cnt2 < 2)then
                    w0 <= '1';
                    w1 <= '0';
                    w2 <= '0';
                    w3 <= '0';
                elsif(cnt2 < 4) then
                    w0 <= '0';
                    w1 <= '1';
                    w2 <= '0';
                    w3 <= '0';
                elsif(cnt2 < 6) then
                    w0 <= '0';
                    w1 <= '0';
                    w2 <= '1';
                    w3 <= '0';
                elsif(cnt2 < 8)then
                    w0 <= '0';
                    w1 <= '0';
                    w2 <= '0';
                    w3 <= '1';
                end if;
                cnt2 := cnt2 + 1;
                if(cnt2 = 8)then
                    cnt2 := 0;
                end if;
        end if;
    end if;

end if;

end process;


end Behavioral;
