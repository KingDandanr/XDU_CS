library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IO_top is
    port
    (
        clk:in std_logic;
        rst:in std_logic;
        
        P0_CS:in std_logic;
        P0_IEN:in std_logic;
        P0_OEN:in std_logic;
        InEN:in std_logic;
        OutEN:in std_logic;
        
        P0_IN:in std_logic_vector (7 downto 0);
        data_in:in std_logic_vector (7 downto 0);
        seg_sel : out  STD_LOGIC_VECTOR (15 downto 0);
        seg_data : out  STD_LOGIC_VECTOR (7 downto 0)
    );
end IO_top;

architecture Behavioral of IO_top is
    component PC_IO
         port
        (
            clk_P0:in std_logic;
            reset:in std_logic;
            P0_CS:in std_logic;
            P0_IEN:in std_logic;
            P0_OEN:in std_logic;
            InEn:in std_logic;
            OutEn:in std_logic;
            
            P0_IN:in std_logic_vector (7 downto 0);
            P0_OUT:out std_logic_vector (7 downto 0);
            data_in:in std_logic_vector (7 downto 0);
            data_out:out std_logic_vector (7 downto 0)
            
        );
    end component;
    
    component seg_dis_keyin
        Port
        (
            clk : in  STD_LOGIC;
            rst : in  STD_LOGIC;
            key_in : in  STD_LOGIC_VECTOR (15 downto 0);
            seg_sel : out  STD_LOGIC_VECTOR (15 downto 0);
            seg_data : out  STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;
    
    signal data_temp:std_logic_vector(7 downto 0);
    signal P0_temp:std_logic_vector(7 downto 0);
begin
    IO:PC_IO port map(clk,rst,P0_CS,P0_IEN,P0_OEN,InEN,OutEN,P0_IN,P0_temp,data_in,data_temp);
    disp:seg_dis_keyin port map(clk=>clk,rst=>rst,key_in(15 downto 8)=>P0_temp,key_in(7 downto 0)=>data_temp,seg_sel=>seg_sel,seg_data=>seg_data);

end Behavioral;
