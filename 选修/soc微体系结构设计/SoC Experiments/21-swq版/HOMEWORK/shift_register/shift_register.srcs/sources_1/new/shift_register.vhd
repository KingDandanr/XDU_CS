----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/03/31 15:48:46
-- Design Name: 
-- Module Name: shift_register - Behavioral
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

entity shift_register is
    Port (
        clk,reset,left,right:in std_logic;
        mode:in std_logic_vector(1 downto 0);
        input_data:in std_logic_vector(7 downto 0);
        output_data:inout std_logic_vector(7 downto 0)
    );
end shift_register;

architecture Behavioral of shift_register is
begin
process(reset,clk,mode)

begin
    if (reset='0')then
        output_data<="00000000";
    elsif(reset='1'and clk='1')then
        case mode is
            when "00"=>output_data<=output_data;
            when "01"=>output_data<=input_data;
            when "10"=>
                    output_data(0)<=left;
                    output_data(7)<=output_data(6);
                    output_data(6)<=output_data(5);
                    output_data(5)<=output_data(4);
                    output_data(4)<=output_data(3);
                    output_data(3)<=output_data(2);
                    output_data(2)<=output_data(1);
                    output_data(1)<=output_data(0);              
            when "11"=>
                    output_data(0)<=output_data(1);
                    output_data(1)<=output_data(2);
                    output_data(2)<=output_data(3);
                    output_data(3)<=output_data(4);
                    output_data(4)<=output_data(5);
                    output_data(5)<=output_data(6);
                    output_data(6)<=output_data(7);
                    output_data(7)<=right;
            when others=>output_data<=output_data;
        end case;         
    end if;
end process;

end Behavioral;
