library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_tb is
end test_tb;

architecture sim of test_tb is

    -- Component declaration
    component cal is
        Port (S  : in  STD_LOGIC_VECTOR(3 downto 0);
              A  : in  STD_LOGIC_VECTOR(7 downto 0);
              B  : in  STD_LOGIC_VECTOR(7 downto 0);
              F  : out STD_LOGIC_VECTOR(7 downto 0);
              M  : in  STD_LOGIC;
              CN : in  STD_LOGIC;
              CO : out STD_LOGIC);
    end component;

    -- Signals
    signal S_tb   : STD_LOGIC_VECTOR(3 downto 0);
    signal A_tb   : STD_LOGIC_VECTOR(7 downto 0);
    signal B_tb   : STD_LOGIC_VECTOR(7 downto 0);
    signal F_tb   : STD_LOGIC_VECTOR(7 downto 0);
    signal M_tb   : STD_LOGIC;
    signal CN_tb  : STD_LOGIC;
    signal CO_tb  : STD_LOGIC;

begin

    -- Instantiate the cal entity
    uut: cal
    port map (
        S  => S_tb,
        A  => A_tb,
        B  => B_tb,
        F  => F_tb,
        M  => M_tb,
        CN => CN_tb,
        CO => CO_tb
    );

    -- Stimulus process
    stimulus_proc: process
    begin
        -- Initialize inputs
        S_tb <= (others => '0');
        A_tb <= (others => '0');
        B_tb <= (others => '0');
        M_tb <= '0';
        CN_tb <= '0';
        
        wait for 10 ns;

        A_tb <= "00000011";
        B_tb <= "00000011";
        
        -- test for a + b + cn
        S_tb <= "1001";
        M_tb <= '0';
        CN_tb <= '0';
        wait for 10 ns;
        CN_tb <= '1';
        wait for 10 ns;
        
        -- test for not (a xor b)
        M_tb <= '1';
        wait for 10 ns;

        A_tb <= "10110011";
        B_tb <= "10100001";

        -- test for (a - b) - cn
        s_tb <= "0110";
        M_tb <= '0';
        CN_tb <= '0';
        wait for 10 ns;
        CN_tb <= '1';
        wait for 10 ns;
        
        -- test for a xor b
        M_tb <= '1';
        wait for 10 ns;
        
        wait;
    end process stimulus_proc;

end sim;
