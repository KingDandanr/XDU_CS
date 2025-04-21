library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IR is
     port(
	   clk:in std_logic;                           --时钟
	   rst:in std_logic;                           --置位  sw0
	   LD_IR1,LD_IR2,LD_IR3:in std_logic;          --选择，sw1-sw3
	   nARen:in std_logic;                         --     sw4
	   RS:inout std_logic;                         --源寄存器，sw5
	   RD:inout std_logic;                         --目的寄存器，sw6
	   data:in std_logic_vector(7 downto 0);      --8位输入，sw31-sw24
	   IR:inout std_logic_vector(5 downto 0);     --数码管A组低两个管,sw23-sw16
	   PC:inout std_logic_vector(11 downto 0);    --12位PC对应led11-led0，以及数码管B组管2-0
	   AR:inout std_logic_vector(6 downto 0);	   --数码管D组低2个管,sw15-sw9
	   seg_sel: out std_logic_vector(15 downto 0);
	   seg_data: out std_logic_vector(7 downto 0)
    );
end IR;

architecture Behavioral of IR is

component seg_dis is
    port(
        clk,rst: in std_logic;
        data_in_A: in std_logic_vector(15 downto 0);
        data_in_B: in std_logic_vector(15 downto 0);
        data_in_C: in std_logic_vector(15 downto 0);
        data_in_D: in std_logic_vector(15 downto 0);
        seg_sel: out std_logic_vector(15 downto 0);
        seg_data: out std_logic_vector(7 downto 0)
    );
end component;
signal data_A,data_B,data_C,data_D: std_logic_vector(15 downto 0):=(others=>'0');
begin
    U1:seg_dis port map(clk,rst,data_A,data_B,data_C,data_D,seg_sel,seg_data);
    -------------------数码管数据读入-------------------------------------
    process(ir,pc,rs,rd,ar)
    begin
        data_A(5 downto 0)<=ir;
        data_B(11 downto 0)<=pc;
        data_C(0)<=rs;
        data_C(4)<=rd;
        data_D(6 downto 0)<=ar;
    end process;
    -------------
    process(clk,rst)
	begin
		if(rst='1')then
			IR<=(others=>'0');
			PC<=(others=>'0');
			RS<='0';
			RD<='0';
		elsif clk'event and clk='1' then
			if(LD_IR1='1')then
				IR<=data(7 downto 2);
				RS<=data(0);
				RD<=data(1);
			end if;
			--------生成PC地址-----------
			if(LD_IR2='1')then
				PC(11 downto 8)<=data(3 downto 0);
			end if;
			
			if(LD_IR3='1')then
				PC(7 downto 0)<=data(7 downto 0);
			end if;
			
			if(LD_IR3='1' and nARen='0')then
				AR<=data(6 downto 0);
			end if;
		end if;				
	end process;
end Behavioral;
