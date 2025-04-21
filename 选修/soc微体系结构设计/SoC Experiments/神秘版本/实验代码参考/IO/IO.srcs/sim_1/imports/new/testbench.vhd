


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity testbench is
end testbench;

architecture Behavioral of testbench is
component  PC_IO is
port(
clk_P0:in std_logic;
nreset:in std_logic;
P0_CS:in std_logic;
P0_IEN:in std_logic;
P0_OEN:in std_logic;
InEn:in std_logic;
OutEn:in std_logic;
P0_IN:in std_logic_vector (7 downto 0);
P0_OUT:out std_logic_vector (7 downto 0);
data_out:out std_logic_vector (7 downto 0);
data_in:in std_logic_vector (7 downto 0)
    );
end component;
signal clk_P0: std_logic;
signal nreset: std_logic;
signal P0_CS: std_logic;
signal P0_IEN: std_logic;
signal P0_OEN: std_logic;
signal InEn: std_logic;
signal OutEn: std_logic;
signal P0_IN: std_logic_vector (7 downto 0);
signal P0_OUT: std_logic_vector (7 downto 0);
signal data_out: std_logic_vector (7 downto 0);
signal data_in: std_logic_vector (7 downto 0);

begin

u1: PC_IO port map(clk_P0 => clk_P0,nreset => nreset,P0_CS => P0_CS, P0_IEN => P0_IEN, P0_OEN =>P0_OEN,
InEn => InEn,OutEn => OutEn,P0_IN =>P0_IN,P0_OUT =>P0_out,data_out => data_out,data_in => data_in
);

process
begin
clk_P0 <= '0';
wait for 10 ps;
clk_P0 <= '1';
wait for 10 ps;
end process;

process
begin
nreset <= '1';
wait for 5 ps;
nreset <= '0';
wait ;
end process;

process
begin
P0_CS <= '1';
wait ;
end process;

process
begin
P0_IEN <= '1';
wait for 20 ps;
P0_IEN <= '0';
wait for 20 ps;
P0_IEN <= '1';
wait;
end process;

process
begin
InEn <= '0';
wait for 20 ps;
InEn <= '1';
wait for 20 ps;
InEn <= '0';
wait;
end process;

process
begin
P0_OEN <= '1';
wait for 45 ps;
P0_OEN <= '0';
wait for 20 ps;
P0_OEN <= '1';
wait;
end process;

process
begin
OutEn <= '0';
wait for 45 ps;
OutEn <= '1';
wait for 20 ps;
OutEn <= '0';
wait;
end process;

process
begin
P0_IN <="01010101";
wait;
end process;

process
begin
data_in <="10101010";
wait;
end process;

end Behavioral;
