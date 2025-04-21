library ieee;
use ieee.std_logic_1164.all;

entity Decoder3to8_tb is
end entity Decoder3to8_tb;

architecture Behavioral of Decoder3to8_tb is

  signal input_signal : std_logic_vector(2 downto 0);
  signal output_signal : std_logic_vector(7 downto 0);
  signal enable_signal: std_logic;

  constant SIM_TIME : time := 100 ns;

  component Decoder3to8 is
    port (
      input : in std_logic_vector(2 downto 0);
      output : out std_logic_vector(7 downto 0);
      enable: in std_logic
    );
  end component Decoder3to8;

begin

  DUT: Decoder3to8
    port map (
      input => input_signal,
      output => output_signal,
      enable => enable_signal
    );

  simulate: process
  begin
    enable_signal <= '1';
    wait for SIM_TIME;
    enable_signal <= '0';
    wait for SIM_TIME;
    input_signal <= "000";
    wait for SIM_TIME;
    input_signal <= "001";
    wait for SIM_TIME;    
    input_signal <= "010";
    wait for SIM_TIME;    
    input_signal <= "011";
    wait for SIM_TIME;    
    input_signal <= "100";
    wait for SIM_TIME;    
    input_signal <= "101";
    wait for SIM_TIME;    
    input_signal <= "110";
    wait for SIM_TIME;    
    input_signal <= "111";
    wait for SIM_TIME;    
    wait;
  end process simulate;

end architecture Behavioral;
