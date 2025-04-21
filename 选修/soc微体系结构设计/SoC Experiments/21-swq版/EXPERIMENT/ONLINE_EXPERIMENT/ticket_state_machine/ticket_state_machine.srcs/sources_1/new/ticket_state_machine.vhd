----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/03/31 20:09:48
-- Design Name: 
-- Module Name: ticket_state_machine - Behavioral
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

entity ticket_state_machine is
    Port (
        clk,reset:in std_logic;
        input_money:in std_logic_vector(2 downto 0);
        return_money:out std_logic_vector(2 downto 0);
        output_ticket:out std_logic
    );
end ticket_state_machine;

architecture Behavioral of ticket_state_machine is
type states is (m0,m5,m10,m15,m20,m25,m30,m35,m40);
signal current_state,next_state:states;
begin

start:process(reset,clk)
    begin
        if(reset='1')then
            current_state<=m0;
        elsif(reset='0'and clk='1'and clk'event)then
            current_state<=next_state;
        end if;         
end process;

state_machine:process(current_state,input_money)
    begin
        case current_state is
            when m0=>
                output_ticket<='0';
                return_money<="000";
                case input_money is
                    when"000"=>next_state<=m0;
                    when"001"=>next_state<=m5;
                    when"010"=>next_state<=m10;
                    when"100"=>next_state<=m20;
                    when others=>next_state<=current_state;
                end case;
            when m5=>
                output_ticket<='0';
                return_money<="000";
                case input_money is
                    when"000"=>next_state<=m5;
                    when"001"=>next_state<=m10;
                    when"010"=>next_state<=m15;
                    when"100"=>next_state<=m25;
                    when others=>next_state<=current_state;
                end case;
            when m10=>
                output_ticket<='0';
                return_money<="000";
                case input_money is
                    when"000"=>next_state<=m10;
                    when"001"=>next_state<=m15;
                    when"010"=>next_state<=m20;
                    when"100"=>next_state<=m30;
                    when others=>next_state<=current_state;
                end case; 
            when m15=>
                output_ticket<='0';
                return_money<="000";
                case input_money is
                    when"000"=>next_state<=m15;
                    when"001"=>next_state<=m20;
                    when"010"=>next_state<=m25;
                    when"100"=>next_state<=m35;
                    when others=>next_state<=current_state;
                end case; 
            when m20=>
                output_ticket<='0';
                return_money<="000";
                case input_money is
                    when"000"=>next_state<=m20;
                    when"001"=>next_state<=m25;
                    when"010"=>next_state<=m30;
                    when"100"=>next_state<=m40;
                    when others=>next_state<=current_state;
                end case; 
            when m25=>
                output_ticket<='1';
                return_money<="000";
                case input_money is
                    when"000"=>next_state<=m0;
                    when"001"=>next_state<=m5;
                    when"010"=>next_state<=m10;
                    when"100"=>next_state<=m20;
                    when others=>next_state<=current_state;
                end case; 
            when m30=>
                output_ticket<='1';
                return_money<="001";
                case input_money is
                    when"000"=>next_state<=m0;
                    when"001"=>next_state<=m5;
                    when"010"=>next_state<=m10;
                    when"100"=>next_state<=m20;
                    when others=>next_state<=current_state;
                end case;
             when m35=>
                output_ticket<='1';
                return_money<="010";
                case input_money is
                    when"000"=>next_state<=m0;
                    when"001"=>next_state<=m5;
                    when"010"=>next_state<=m10;
                    when"100"=>next_state<=m20;
                    when others=>next_state<=current_state;
                end case;    
            when m40=>
                output_ticket<='1';
                return_money<="011";
                case input_money is
                    when"000"=>next_state<=m0;
                    when"001"=>next_state<=m5;
                    when"010"=>next_state<=m10;
                    when"100"=>next_state<=m20;
                    when others=>next_state<=current_state;
                end case;    
        end case;             
end process;

end Behavioral;
