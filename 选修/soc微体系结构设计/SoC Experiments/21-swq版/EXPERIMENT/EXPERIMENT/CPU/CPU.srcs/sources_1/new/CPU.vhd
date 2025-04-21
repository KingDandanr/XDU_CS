----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/25 17:50:57
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU is
    generic(
        CLK_FRE:integer:=100000000
    );
    Port(
        clk:in std_logic;
        nreset:in std_logic;
        data_in:in std_logic_vector(7 downto 0);
        
        regA_out,regB_out,result_out:out std_logic_vector(7 downto 0);
        data_out:out std_logic_vector(7 downto 0)
    );
end CPU;

architecture Behavioral of CPU is
signal clk1,nclk1:std_logic;   --clk
signal clk2,nclk2:std_logic;   --clk二分频
signal w0,w1,w2,w3:std_logic;   --节拍信号
component clock
    Port(
        clk,rst:in std_logic;
        clk1,nclk1:out std_logic;   --clk
        clk2,nclk2:out std_logic;   --clk二分频
        w0,w1,w2,w3:out std_logic   --节拍信号
    );
end component;

signal clk_uC,M_uA,CMROM_CS:std_logic;
signal IR_line:std_logic_vector(7 downto 0);
signal CTR_BUS:std_logic_vector(47 downto 8);
component uC
    Port(
        clk_uC:in std_logic;    --微程序控制器时钟信号
        nreset:in std_logic;    --复位信号
        M_uA:in std_logic;      --微地址控制信号
        IR:in std_logic_vector(7 downto 2); --IR操作码信息
        CMROM_CS:in std_logic;  --控制存储器选通信号
        
        CM:out std_logic_vector(47 downto 8)    --控制信号输出
    );
end component;

signal clk_SP,SP_CS,SP_UP,SP_DN,nSP_EN:STD_LOGIC;
signal AR:std_logic_vector(6 downto 0);
signal DATA_BUS:std_logic_vector(7 downto 0);
component SP
    Port(
        clk_SP:in std_logic;    --SP时钟信号
        nreset:in std_logic;    --复位信号                
        SP_CS:in std_logic;     --SP选择信号
        SP_UP:in std_logic;     --SP+1控制
        SP_DN:in std_logic;     --SP-1控制
        nSP_EN:in std_logic;    --SP输出使能
        
        AR:out std_logic_vector(6 downto 0);--SP指向RAM地址
        DATA_BUS:inout std_logic_vector(7 downto 0)   --数据总线
    );
end component;

signal clk_IO,IO_CS,IO_IEN,IO_OEN,RI_EN,RO_EN:std_logic;
signal IO_in,IO_out:std_logic_vector(7 downto 0);
component IO
    Port(
        clk_IO:in std_logic;    --IO时钟信号
        nreset:in std_logic;    --IO复位信号
        IO_CS:in std_logic;     --IO选择信号
        IO_IEN:in std_logic;    --IO输入使能
        IO_OEN:in std_logic;    --IO输出使能
        RI_EN:in std_logic;     --IO缓存器输入使能
        RO_EN:in std_logic;     --IO缓存器输出使能
        IO_in:in std_logic_vector(7 downto 0);          --IO输入
        
        IO_out:out std_logic_vector(7 downto 0);        --IO输出
        DATA_BUS:inout std_logic_vector(7 downto 0)    --数据总线
    );
end component;

signal clk_RAM,RAM_CS,nRAM_EN,Wr_nRD:std_logic;
component RAM
    generic(
        depth:positive:=7;
        width:positive:=8
    );
    Port (
        clk_RAM:in STD_LOGIC;       --RAM时钟信号
        n_reset:in STD_LOGIC;       --RAM选择信号
        RAM_CS:in STD_LOGIC;        --RAM片选信号
        nRAM_EN:in STD_LOGIC;       --RAM输出使能
        Wr_nRD :in STD_LOGIC;       --RAM读写信号
        AR:in STD_LOGIC_VECTOR (depth-1 downto 0);  --RAM地址信号
        
        DATA_BUS: inout STD_LOGIC_VECTOR (width-1 downto 0) --数据总线
    );
end component;

signal clk_ALU,m_A,m_B,m_F,nALU_EN,nPSW_EN,C0:std_logic;
signal S :std_logic_vector(4 downto 0);
signal F_in :std_logic_vector(1 downto 0);    
--signal regA_out,regB_out,result_out:std_logic_vector(7 downto 0);
signal AC : std_logic;     --半进位标志
signal CY : std_logic;     --进位标志
signal ZN : std_logic;     --零标志
signal OV : std_logic;      --溢出标志
component ALU 
    port(
        clk,clk_ALU : in std_logic; --全局时钟和ALU时钟
        nreset : in std_logic;      --全局复位信号
        M_A,M_B : in std_logic;     --暂存器控制信号
        M_F : in std_logic;         --程序状态字控制信号
        nALU_EN : in std_logic;     --alu运算结果输出使能
        nPSW_EN : in std_logic;     --psw输出使能
        C0 : in std_logic;          --进位输入
        S : in std_logic_vector(4 downto 0);        --运算类型和操作选择，M为最高位S(4),其余在低四位
        F_in : in std_logic_vector(1 downto 0);     --移位功能选择
        
        regA_out,regB_out,result_out:out std_logic_vector(7 downto 0);
        DATA_BUS : inout std_logic_vector(7 downto 0);  --数据总线
        AC : out std_logic;     --半进位标志
        CY : out std_logic;     --进位标志
        ZN : out std_logic;     --零标志
        OV : out std_logic      --溢出标志
    );
end component;

signal clk_RN,Rn_CS,nRi_EN,RDRi,WRRi:std_logic;
signal RS,RD:std_logic;
component RN
    Port(
        clk_RN,Rn_CS,nRi_EN,RDRi,WRRi:in std_logic;
        RS,RD:in std_logic;

        DATA_BUS:inout std_logic_vector(7 downto 0)
    );
end component;

signal clk_IR,LD_IR1,LD_IR2,LD_IR3,nARen: std_logic;
signal IR_AR       :std_logic_vector(6 downto 0);
component IR
    Port (
        rst,clk_IR,LD_IR1,LD_IR2,LD_IR3,nARen:in std_logic;
        DATA_BUS:in std_logic_vector(7 downto 0);
        
        IR_out:out std_logic_vector(7 downto 0);--传送指令到指令寄存器
        RS,RD:out std_logic;--传送操作寄存器（寄存器地址）
        PC_out:out std_logic_vector(11 downto 0);--PC地址总线
        AR:out std_logic_vector(6 downto 0)
    );
end component;

signal clk_ROM,M_ROM,ROM_EN:std_logic;
signal ROM_PC:std_logic_vector(11 downto 0);
component ROM
    generic(
        depth:positive:=12;
        width:positive:=8
    );
    Port (
        clk_ROM,M_ROM,ROM_EN:in std_logic;
        addr:in std_logic_vector(11 downto 0);
        DATA_BUS:inout std_logic_vector(7 downto 0)
    );
end component;

signal clk_PC,M_PC,nLD_PC,nPCH,nPCL:std_logic;
signal PC_in:std_logic_vector(11 downto 0):=(others=>'0');
component pc
    Port (        
        rst,clk_PC,M_PC,nLD_PC:in std_logic;
        nPCH,nPCL:in std_logic;
        PC_in:in std_logic_vector(11 downto 0);
        
        PC_out:out std_logic_vector(11 downto 0);
        DATA_BUS:inout std_logic_vector(7 downto 0)
     );
end component;

signal test_line:std_logic_vector(7 downto 0);

begin

clock_inst:clock port map(clk,nreset,clk1,nclk1,clk2,nclk2,w0,w1,w2,w3);
PC_inst:PC port map(nreset,clk_PC,M_PC,nLD_PC,nPCH,nPCL,PC_in,ROM_PC,DATA_BUS);
ROM_inst:ROM generic map(12,8)port map(clk_ROM,M_ROM,ROM_EN,ROM_PC,DATA_BUS);
uC_inst:uC port map(clk_uC,nreset,M_uA,IR_line(7 downto 2),CMROM_CS,CTR_BUS);
IR_inst:IR port map(rst=>nreset,clk_IR=>clk_IR,LD_IR1=>LD_IR1,LD_IR2=>LD_IR2,LD_IR3=>LD_IR3,nARen=>nARen,DATA_BUS=>DATA_BUS,IR_out=>IR_line,RS=>RS,RD=>RD,PC_out=>PC_in,AR=>AR(6 downto 0));
RAM_inst:RAM generic map(7,8)port map(clk_RAM=>clk_RAM,n_reset=>nreset,RAM_CS=>RAM_CS,nRAM_EN=>nRAM_EN,Wr_nRD=>Wr_nRD,AR=>AR,DATA_BUS=>DATA_BUS);
IO_inst:IO port map(clk_IO,nreset,IO_CS,IO_IEN,IO_OEN,RI_EN,RO_EN,data_in,data_out,DATA_BUS);
--SP_inst:SP PORT MAP(clk_SP,nreset,SP_CS,SP_UP,SP_DN,nSP_EN,AR,DATA_BUS);
ALU_inst:ALU port map(clk,clk_ALU,nreset,m_A,m_B,m_F,nALU_EN,nPSW_EN,C0,S,F_in,regA_out,regB_out,result_out,DATA_BUS,AC,CY,ZN,OV);
RN_inst:RN port map(clk_RN,Rn_CS,nRi_EN,RDRi,WRRi,RS,RD,DATA_BUS);

clk_PC<=clk1 and clk2;
clk_ROM<=nclk1 and clk2;
clk_IR<=clk1 and nclk2;
clk_uC<=nclk1 and nclk2;
clk_RN<=clk1 and nclk2;
clk_ALU<=nclk1 and nclk2;
--clk_IO<=clk2;--（LED程序使用）
clk_IO<=nclk1 and clk2;--（ADD程序使用）
clk_RAM<=nclk1 and w1;
clk_SP<=clk1 and clk2 and w1;

M_A <= CTR_BUS(47);
M_B <= CTR_BUS(46);
M_F <= CTR_BUS(45);
S(4) <= CTR_BUS(44);
S(3) <= CTR_BUS(43);
S(2) <= CTR_BUS(42);
S(1) <= CTR_BUS(41);
S(0) <= CTR_BUS(40);
F_in(1) <= CTR_BUS(39);
F_in(0) <= CTR_BUS(38);
nALU_EN <= CTR_BUS(37);
nPSW_EN <= CTR_BUS(36);
C0 <= CTR_BUS(35);
RAM_CS <= CTR_BUS(34);
Wr_nRD <= CTR_BUS(33); 
nRAM_EN <= CTR_BUS(32);
Rn_CS <= CTR_BUS(31);
RDRi <= CTR_BUS(30);
WRRi <= CTR_BUS(29);
nRi_EN <= CTR_BUS(28);
LD_IR1 <= CTR_BUS(27);
LD_IR2 <= CTR_BUS(26);
LD_IR3 <= CTR_BUS(25);
nAREN <= CTR_BUS(24);
M_PC <= CTR_BUS(23);
nLD_PC <= CTR_BUS(22); 
nPCH <= CTR_BUS(21); 
nPCL <= CTR_BUS(20); 
SP_UP <= CTR_BUS(19);
SP_DN <= CTR_BUS(18);
SP_CS <= CTR_BUS(17); 
nSP_EN <= CTR_BUS(16); 
IO_CS <= CTR_BUS(15);
IO_IEN <= CTR_BUS(14);
IO_OEN <= CTR_BUS(13);
RI_EN<='0';
RO_EN<='0';
-- <= CTR_BUS(12);
M_ROM <= CTR_BUS(11);
ROM_EN <= CTR_BUS(10);
M_uA <= CTR_BUS(9);
CMROM_CS <= CTR_BUS(8);

process(nPCH,nPCL)
begin
    if(nPCH='0')then PC_in(11 downto 8)<=DATA_BUS(3 downto 0);
    elsif(nPCL='0')then PC_in(7 downto 0)<=DATA_BUS;
    end if;
end process;

end Behavioral;
