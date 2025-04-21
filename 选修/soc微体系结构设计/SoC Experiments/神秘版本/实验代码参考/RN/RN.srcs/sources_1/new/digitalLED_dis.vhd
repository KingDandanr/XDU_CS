----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/20 23:18:44
-- Design Name: 
-- Module Name: seg_dis - Behavioral
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

entity digitalLED_dis is
--  Port ( );
   
    Port(
                clk             :in std_logic;
                reset           :in std_logic;
                data_in_a       :in std_logic_vector(15 downto 0);
                data_in_b       :in std_logic_vector(15 downto 0);
                data_in_c       :in std_logic_vector(15 downto 0);
                data_in_d       :in std_logic_vector(15 downto 0);
                seg_sel         :out std_logic_vector(15 downto 0);
                seg_data        :out std_logic_vector(7 downto 0)
    );
end digitalLED_dis;

architecture Behavioral of digitalLED_dis is
    type states IS(S0,S1,S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15); 
    signal pr_state: states:=S0;
    signal nx_state: states:=S0;
    signal data_in: std_logic_vector(3 downto 0);
    signal clk_in: std_logic;
    signal counter: integer:=0;
    signal r_REF_us: integer:=1000;
    component digitalLED_decode is
        port(
             num:in std_logic_vector(3 downto 0);
            seg_data:out std_logic_vector(7 downto 0)
        );
    end component;
begin
    u0: digitalLED_decode port map(
                data_in, seg_data
    );

    process(clk)
    begin
		IF(clk'EVENT AND clk = '1')THEN
			IF(counter = r_REF_us)THEN        
				counter<=0;
                clk_in<= not clk_in;
			ELSE
				counter<=counter+1;
			END	IF;
		END IF;
    end process;

    process(clk_in, reset)
    begin
        if(reset='1') then pr_state<=S0;
        elsif (clk_in'event and clk_in = '1') then
            pr_state<=nx_state;
        else null;
        end if;
    end process;


    process(pr_state)
    begin
        case pr_state is 
            when S0=>
                seg_sel<=x"FFFE";
                data_in<=data_in_A(3 downto 0);
                nx_state<=S1;
            when S1=>
                seg_sel<=x"FFFD";
                data_in<=data_in_A(7 downto 4);
                nx_state<=S2;
            when S2=>
                seg_sel<=x"FFFB";
                data_in<=data_in_A(11 downto 8);
                nx_state<=S3;
            when S3=>
                seg_sel<=x"FFF7";
                data_in<=data_in_A(15 downto 12);
                nx_state<=S4;
            when S4=>
                seg_sel<=x"FFEF";
                data_in<=data_in_B(3 downto 0);
                nx_state<=S5;
            when S5=>
                seg_sel<=x"FFDF";
                data_in<=data_in_B(7 downto 4);
                nx_state<=S6;
            when S6=>
                seg_sel<=x"FFBF";
                data_in<=data_in_B(11 downto 8);
                nx_state<=S7;
            when S7=>
                seg_sel<=x"FF7F";
                data_in<=data_in_B(15 downto 12);
                nx_state<=S8;
            when S8=>
                seg_sel<=x"FEFF";
                data_in<=data_in_C(3 downto 0);
                nx_state<=S9;
            when S9=>
                seg_sel<=x"FDFF";
                data_in<=data_in_C(7 downto 4);
                nx_state<=S10;
            when S10=>
                seg_sel<=x"FBFF";
                data_in<=data_in_C(11 downto 8);
                nx_state<=S11;
            when S11=>
                seg_sel<=x"F7FF";
                data_in<=data_in_C(15 downto 12);
                nx_state<=S12;
            when S12=>
                seg_sel<=x"EFFF";
                data_in<=data_in_D(3 downto 0);
                nx_state<=S13;
            when S13=>
                seg_sel<=x"DFFF";
                data_in<=data_in_D(7 downto 4);
                nx_state<=S14;
            when S14=>
                seg_sel<=x"BFFF";
                data_in<=data_in_D(11 downto 8);
                nx_state<=S15;
            when S15=>
                seg_sel<=x"7FFF";
                data_in<=data_in_D(15 downto 12);
                nx_state<=S0;
        end case;
    end process;

end Behavioral;
