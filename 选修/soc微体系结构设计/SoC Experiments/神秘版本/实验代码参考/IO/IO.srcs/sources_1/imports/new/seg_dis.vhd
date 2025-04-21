library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seg_dis is
    port
    (
        clk: in STD_LOGIC ;
        rst :in STD_LOGIC ;
        data_in_A:in STD_LOGIC_VECTOR(15 downto 0) ;
        data_in_B:in STD_LOGIC_VECTOR(15 downto 0) ;
        data_in_C:in STD_LOGIC_VECTOR(15 downto 0) ;
        data_in_D:in STD_LOGIC_VECTOR(15 downto 0) ;
        seg_data:out STD_LOGIC_VECTOR(7 downto 0) ;
        seg_sel:out STD_LOGIC_VECTOR(15 downto 0)
    ) ;
end seg_dis;

architecture Behavioral of seg_dis is
    component data2seg
        Port 
        ( 
            data_in : in  STD_LOGIC_VECTOR (3 downto 0);
            seg_data : out  STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;
    
    CONSTANT REFRESH_PERIOD_CLOCKS: integer:= 50000;
    type states is 
    (
        INIT0,INIT1,INIT2,INIT3,INIT4,INIT5,INIT6,INIT7,                         
        INIT8,INIT9,INIT10,INIT11,INIT12,INIT13,INIT14,INIT15
    );
    signal N_S,C_S: states;
    signal fre_flag:STD_LOGIC;
    signal data_T:STD_LOGIC_VECTOR (3 downto 0);	

begin

    state:	process (clk,rst)
	begin
	   if(rst='1') then
	       C_S<=INIT0;
        elsif rising_edge(clk) then
            C_S<=N_S;
		end if;
	end process;
	
    pro:process (C_S,fre_flag,data_in_A,data_in_B,data_in_C,data_in_D)
	begin
		case C_S is
		when INIT0=>
			seg_sel<=(0=>'0',others=>'1');data_T<=data_in_A(3 downto 0);
			if(fre_flag='1') then
				N_S<=INIT1;
			else
				N_S<=INIT0;
			end if;
		when INIT1=>seg_sel<=(1=>'0',others=>'1');data_T<=data_in_A(7 downto 4);
			if(fre_flag='1') then
				N_S<=INIT2;
			else
				N_S<=INIT1;
			end if;
		when INIT2=>seg_sel<=(2=>'0',others=>'1');data_T<=data_in_A(11 downto 8);
			if(fre_flag='1') then
				N_S<=INIT3;
			else
				N_S<=INIT2;
			end if;
		when INIT3=>seg_sel<=(3=>'0',others=>'1');data_T<=data_in_A(15 downto 12);
			if(fre_flag='1') then
				N_S<=INIT4;
			else
				N_S<=INIT3;
			end if;
		when INIT4=>seg_sel<=(4=>'0',others=>'1');data_T<=data_in_B(3 downto 0);
			if(fre_flag='1') then
				N_S<=INIT5;
			else
				N_S<=INIT4;
			end if;
		when INIT5=>seg_sel<=(5=>'0',others=>'1');data_T<=data_in_B(7 downto 4);
			if(fre_flag='1') then
				N_S<=INIT6;
			else
				N_S<=INIT5;
			end if;
		when INIT6=>seg_sel<=(6=>'0',others=>'1');data_T<=data_in_B(11 downto 8);
			if(fre_flag='1') then
				N_S<=INIT7;
			else
				N_S<=INIT6;
			end if;
		when INIT7=>seg_sel<=(7=>'0',others=>'1');data_T<=data_in_B(15 downto 12);
			if(fre_flag='1') then
				N_S<=INIT8;
			else
				N_S<=INIT7;
			end if;
		when INIT8=>seg_sel<=(8=>'0',others=>'1');data_T<=data_in_C(3 downto 0);
			if(fre_flag='1') then
				N_S<=INIT9;
			else
				N_S<=INIT8;
			end if;
		when INIT9=>seg_sel<=(9=>'0',others=>'1');data_T<=data_in_C(7 downto 4);
			if(fre_flag='1') then
				N_S<=INIT10;
			else
				N_S<=INIT9;
			end if;
		when INIT10=>seg_sel<=(10=>'0',others=>'1');data_T<=data_in_C(11 downto 8);
			if(fre_flag='1') then
				N_S<=INIT11;
			else
				N_S<=INIT10;
			end if;
		when INIT11=>seg_sel<=(11=>'0',others=>'1');data_T<=data_in_C(15 downto 12);
			if(fre_flag='1') then
				N_S<=INIT12;
			else
				N_S<=INIT11;
			end if;
		when INIT12=>seg_sel<=(12=>'0',others=>'1');data_T<=data_in_D(3 downto 0);
			if(fre_flag='1') then
				N_S<=INIT13;
			else
				N_S<=INIT12;
			end if;
		when INIT13=>seg_sel<=(13=>'0',others=>'1');data_T<=data_in_D(7 downto 4);
			if(fre_flag='1') then
				N_S<=INIT14;
			else
				N_S<=INIT13;
			end if;
		when INIT14=>seg_sel<=(14=>'0',others=>'1');data_T<=data_in_D(11 downto 8);
			if(fre_flag='1') then
				N_S<=INIT15;
			else
				N_S<=INIT14;
			end if;
		when INIT15=>seg_sel<=(15=>'0',others=>'1');data_T<=data_in_D(15 downto 12);
			if(fre_flag='1') then
				N_S<=INIT0;
			else
				N_S<=INIT15;
			end if;
		when others=>seg_sel<=(others=>'1');data_T<=X"0";
	    end case;
	end process;

    fresh:	process (clk,rst)
	variable cnt:integer;
	begin
		if(rst='1') then
			cnt:=0;
			fre_flag<='0';
		elsif rising_edge(clk) then
			cnt:=cnt+1;
	       	if(cnt=REFRESH_PERIOD_CLOCKS) then
			     cnt:=0;
			     fre_flag<='1';
		    else
			     fre_flag<='0';
			end if;
		end if;		
	end process;
			
    U1:data2seg PORT MAP
    (
	   data_in => data_T,
       seg_data	=> seg_data
    );

end Behavioral;
