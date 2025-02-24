# 微控制器设计
## 一、实验目的
1. 掌握微控制器功能及工作原理；
2. 掌握微控制器与其他模块信号之间的关联性。

## 二、实验要求
1. 将指令分解为基本的微命令序列，把操作控制信号编制成微指令，存放到控制存储器 (CM)；

2. 程序运行时，从控存中取出微指令，产生指令运行所需的操作控制信号。

## 三、实验方案及工作原理
### 3.1 微程序控制器基本结构
<img src="https://jsd.cdn.zzko.cn/gh/LZHMS/picx-images-hosting@master/ZBlog/PDFImage/image-20240428133219625.101ywato4a.webp" alt="微程序控制器基本结构" />

​	在该实验中，微程序控制器主要由控制存储器CM、微指令寄存器$\mu$IR、微地址形成电路、微地址寄存器$\mu$AR模块组成，其中各模块功能分析如下：
+ 控制存储器CM：存放不同机器指令对应的微程序；
+ 微指令寄存器$\mu$IR：存放现行微指令；
+ 微地址形成电路：提供下一条微命令对应的微地址；
+ 微地址寄存器$\mu$AR：存在现在微地址；

### 3.2 控制信号汇总

#### PC 模块（4条）

+ LD_PC: in std_logic;              -- 装载新地址
+ M_PC: in std_logic;                --PC 加 1 控制信号
+ nPCH, nPCL: in std_logic;     --PC 输出总线控制信号

#### ROM 模块（2条）
+ M_ROM: in std_logic;             --ROM 片选信号
+ ROM_EN: in std_logic;           --ROM 使能信号

#### IR 模块（4 条）
+ LD_IR1,LD_IR2,LD_IR3: in std_logic; 		--IR 指令存储控制信号
+ nARen :in std_logic; 					--IR 中 RAM 地址控制信号


#### RN 模块（4 条）
+ Ri_CS: in std_logic; 		--RN 选择信号 
+ Ri_EN :in std_logic; 		--RN 寄存器使能
+ RDRi,WRRi :in std_logic; 		--RN 读写信号 

#### ALU 模块（13 条） 
+ M_A,M_B :in std_logic; 		--暂存器控制信号 
+ M_F :in std_logic; 			--程序状态字控制信号 
+ nALU_EN :in std_logic;		 --ALU 运算结果输出使能
+ nPSW_EN :in std_logic;   		 --PSW 输出使能 
+ C0 :in std_logic;				 --进位输入 
+ S:in std_logic_vector(4 downto 0); 	--运算类型和操作选择 
+ F_in:in std_logic_vector(1 downto 0);		 --移位功能选择 

#### RAM 模块（3 条） 
+ RAM_CS :in std_logic; 		--RAM 片选信号 
+ nRAM_EN :in std_logic; 		--RAM 输出使能信号 
+ wr_nRD :in std_logic;			 -- 读写信号

### 3.3 控制信号设计
+ 39条控制信号（39位编码）
+ 27条指令（5位编码）

### 3.4 微指令编码设计

<img src="https://jsd.cdn.zzko.cn/gh/LZHMS/picx-images-hosting@master/ZBlog/PDFImage/image.1zi29gvuf5.webp" alt="微指令编码结构" />

根据实验手册，设计 48 位的微指令各编码段如上图所示，对应所有控制信号和寄存器；

#### 取指公操作：微程序入口地址 00H
<img src="https://jsd.cdn.zzko.cn/gh/LZHMS/picx-images-hosting@master/ZBlog/PDFImage/image.54xk8f1owc.webp" alt="取指公操作编码设计" />

该微指令的入口地址为 00H，当指令寄存器加载地址 00H时会将该条取指指令加载出来形成取指操作；同理，可以设计出其他所有的微指令；

### 3.5 微程序设计

#### MOV Ri, #data：微程序入口地址 24H
<img src="https://jsd.cdn.zzko.cn/gh/LZHMS/picx-images-hosting@master/ZBlog/PDFImage/image.4912sz3w13.webp" alt="image" />

+ 一条机器指令MOV操作被分解为3条微指令，形成一个微程序；
+ 该段微程序入口地址为 24H，即当执行该条机器指令时，首先由取指共操作取出该条指令，然后根据 IR 寄存器进入到改微程序入口，开始顺序执行每一条微指令；
+ 微程序执行完毕后，再次回到 00H，重新进行取指公操作，得到下一条机器指令对应的微程序；

故此，可以根据指令编码以及机器指令执行特点设计出每一条机器指令对应的微程序，然后根据微程序进行实验验证；

## 四、实验配置
### 4.1 微程序设计
​	在本次实验中，为了进一步验证微控制器工作原理，我设计了3条机器指令：sub Ri, Rj; add Ri，Rj; and Ri, Rj. 其对应的微指令编码如下所示：
```apl
000000000011000100011001111100110111100000000000 --003119F378   00(00h)
100000000011000100011001111100110111100100000010 --803119F379   02(01h)      sub ri, rj 
100000000011000100110001111100110111101100000011 --803131F37B   03(02h)
100000000011000100010001011100110111011100000100 --8031117377   04(03h)
100000000011000100010001011100110111011100000101 --8031117377   05(04h)
100000000011000101110001111100110111101100000110 --803171F37B   06(05h)
100000000011000100110011111100110111101100000111 --803133F37B   07(06h)
100000000011000100110000111100110111101100001000 --803130F37B   08(07h)
100000000011000100110001111100110111100000000000 --803131F378   00(08h)
100000000011000100011001111100110010000100001010 --803119F321   0A(09h)    add ri, rj
100000000011000100110001111100110010001000001011 --803131F322   0B(0Ah)
100000000011000100010001011100110010001100001100 --8031117323   0C(0Bh)
100000000011000100010001011100110010010000000000 --8031117324   00(0Ch)
100000000011000101110001111100110011000100001110 --803171F331   0E(0Dh)    and ri, rj
100000000011000100110011111100110011001000001111 --803133F332   0F(0Eh)
100000000011000100110000111100110011001100010000 --803130F333   10(0Fh)
100000000011000100110001111100110011010000000000 --803131F334   00(10h)
```
### 4.2 微控制器功能设计
针对微控制器的工作原理，在本次实验中设计的功能如下所示：
+ 复位功能：当复位信号有效时，微控制器进行复位，所有寄存器均不存储数据；
+ 使能信号：只有该信号高电平有效时，微控制器才能够正常工作，否则一直保持刚取得的微指令；
+ 指令跳转：该功能使得微控制器可以根据 IR 寄存器中的地址，获取下一条微指令的地址，这使得微控制器可以跳转到不同机器指令的微程序入口，然后继续顺序执行；
+ 指令执行：该功能保证微控制在进入微程序后获取相应的微指令后，可以根据地址译码电路自动获得下一条微指令的地址；

## 五、实验源码
### 5.1 顶层模块设计
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity micro is
Port (clk, rst : in std_logic;
    seg_sel : out std_logic_vector(15 downto 0);
    seg_data : out std_logic_vector(7 downto 0);
    clk_mc,m_ua,cmrom_cs:in std_logic;
    ir:in std_logic_vector(7 downto 2) );
end micro;

architecture Behavioral of micro is
signal showw:std_logic_vector(63 downto 0);

component state is
Port (clk, rst : in std_logic;
        key_in:in std_logic_vector(15 downto 0);
        seg_sel : out std_logic_vector(15 downto 0);
        seg_data : out std_logic_vector(7 downto 0);
        show:in std_logic_vector(63 downto 0) );
end component;

component micro_controller is
Port (clk_mc,m_ua,cmrom_cs:in std_logic;
        ir:in std_logic_vector(7 downto 2);
        arr:out std_logic_vector(7 downto 0);
        next_arr:out std_logic_vector(7 downto 0);
        cm:out std_logic_vector(47 downto 8) );
end component;

begin
    u1: state port map(clk=>clk,
                        rst=>rst,
                        seg_sel=>seg_sel,
                        seg_data=>seg_data,
                        show=>showw,
                        key_in=>x"ffff");
    u2: micro_controller port map(clk_mc=>clk,
                                 m_ua=>m_ua,
                                 cmrom_cs=>cmrom_cs,
                                 ir=>ir,
                                 cm=>showw(39 downto 0),
                                 next_arr => showw(47 downto 40),
                                 arr=>showw(55 downto 48));
end Behavioral;
```
### 5.2 微控制器模块设计
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity micro_controller is
Port (clk_mc,m_ua,cmrom_cs:in std_logic;
    ir:in std_logic_vector(7 downto 2);
    arr:out std_logic_vector(7 downto 0);
    next_arr:out std_logic_vector(7 downto 0);
    cm:out std_logic_vector(47 downto 8) );
end micro_controller;

architecture Behavioral of micro_controller is
    component cmrom is
    Port (m_rom,nrom_en:in std_logic;
        addr:in std_logic_vector(7 downto 0);
        data:out std_logic_vector(47 downto 0) );
    end component;

signal uar:std_logic_vector(7 downto 0) := (others => '0');
signal uir:std_logic_vector(47 downto 0);
signal clkk:std_logic;


begin
    cm1:cmrom port map(m_rom=>cmrom_cs,
                   nrom_en=>'0',
                   addr=>uar,
                   data=>uir);
                   
    cm <= uir(47 downto 8);    --   控制字段
    next_arr <= uir(7 downto 0);    --   下条地址字段
    arr <= uar;    --  当前地址
    
---clkk   50000000   
process(clk_mc)
    variable count: integer range 0 to 60000000;
    begin
        if clk_mc'event and clk_mc='1' then
            count:=count+1;
            if count=50000000 then
                clkk<=not clkk;
                count:=0;
            end if;
        end if;
end process;

process(m_ua,clkk)
    begin
        if rising_edge(clkk) then 
            if cmrom_cs = '1' then
                if m_ua = '1'then
                    uar(5 downto 0) <= ir;
                    uar(7 downto 6) <= "00";
                elsif m_ua='0' then
                    uar<=uir(7 downto 0);
                end if;
            end if;
        end if;
end process;

end Behavioral;
```
### 5.3 控制存储器模块设计
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use std.textio.all;

entity cmrom is
Port (m_rom,nrom_en:in std_logic;
    addr:in std_logic_vector(7 downto 0);
    data:out std_logic_vector(47 downto 0) );
end cmrom;

architecture Behavioral of cmrom is
type matrix is array(integer range<>) of std_logic_vector(47 downto 0);
signal rom:matrix (0 to 2**8-1);
procedure load_rom (signal data_word:out matrix) is
    file romfile:text open read_mode is "D:\zhli\project_15\ucode.txt";
    variable lbuf:line;
    variable i:integer:=0;
    variable fdata:std_logic_vector(47 downto 0);
begin
while not endfile(romfile) loop
    readline(romfile,lbuf);
    read(lbuf,fdata);
    data_word(i)<=fdata;
    i:=i+1;
end loop;
end procedure;

begin
    load_rom(rom);
    data<=rom(conv_integer(addr));
end Behavioral;
```
### 5.4 数码管显示模块设计
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity state is
Port (clk, rst : in std_logic;
    key_in : in std_logic_vector(15 downto 0);
    seg_sel : out std_logic_vector(15 downto 0);
    seg_data : out std_logic_vector(7 downto 0);
    show:in std_logic_vector(63 downto 0) );
end state;

architecture Behavioral of state is
type states is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15);
signal state,next_state:states;
signal show1: std_logic_vector(3 downto 0);
signal rsts,clks: std_logic;
signal cc: std_logic;
signal showw:std_logic_vector(63 downto 0);

component data2seg is
Port (data_in:in std_logic_vector(3 downto 0);
    seg_data:out std_logic_vector(7 downto 0));
end component;

begin
u: data2seg port map(data_in=>show1, seg_data=>seg_data);

    process(clk)
    variable count: integer range 0 to 30000;
    begin
        if clk'event and clk='1' then
            count:=count+1;
            if count=20000 then
            cc<=not cc;
            count:=0;
            end if;
        end if;
    end process;
    
    process(cc,clk,rst)    --复位和状态转移
    begin
    if rst='1' then 
        state<=s0;
        showw<=x"0000000000000000";
    elsif cc'event and cc='1' then
        showw<=show;
        state<=next_state;
    end if;
    end process;
    
    process(state)
    begin
        case state is --数码管输出
        when s0=>if key_in(0)='1' then seg_sel<=x"fffe"; show1<=showw(3 downto 0); else seg_sel<=x"ffff"; end if; next_state<=s1;
        when s1=>if key_in(1)='1' then seg_sel<=x"fffd"; show1<=showw(7 downto 4); else seg_sel<=x"ffff"; end if; next_state<=s2;
        when s2=>if key_in(2)='1' then seg_sel<=x"fffb"; show1<=showw(11 downto 8); else seg_sel<=x"ffff"; end if; next_state<=s3;
        when s3=>if key_in(3)='1' then seg_sel<=x"fff7"; show1<=showw(15 downto 12); else seg_sel<=x"ffff"; end if; next_state<=s4;
        when s4=>if key_in(4)='1' then seg_sel<=x"ffef"; show1<=showw(19 downto 16); else seg_sel<=x"ffff"; end if; next_state<=s5;
        when s5=>if key_in(5)='1' then seg_sel<=x"ffdf"; show1<=showw(23 downto 20); else seg_sel<=x"ffff"; end if; next_state<=s6;
        when s6=>if key_in(6)='1' then seg_sel<=x"ffbf"; show1<=showw(27 downto 24); else seg_sel<=x"ffff"; end if; next_state<=s7;
        when s7=>if key_in(7)='1' then seg_sel<=x"ff7f"; show1<=showw(31 downto 28); else seg_sel<=x"ffff"; end if; next_state<=s8;
        when s8=>if key_in(8)='1' then seg_sel<=x"feff"; show1<=showw(35 downto 32); else seg_sel<=x"ffff"; end if; next_state<=s9; 
        when s9=>if key_in(9)='1' then seg_sel<=x"fdff"; show1<=showw(39 downto 36); else seg_sel<=x"ffff"; end if; next_state<=s10;
        when s10=>if key_in(10)='1' then seg_sel<=x"fbff"; show1<=showw(43 downto 40); else seg_sel<=x"ffff"; end if; next_state<=s11;
        when s11=>if key_in(11)='1' then seg_sel<=x"f7ff"; show1<=showw(47 downto 44); else seg_sel<=x"ffff"; end if; next_state<=s12;
        when s12=>if key_in(12)='1' then seg_sel<=x"efff"; show1<=showw(51 downto 48); else seg_sel<=x"ffff"; end if; next_state<=s13;
        when s13=>if key_in(13)='1' then seg_sel<=x"dfff"; show1<=showw(55 downto 52); else seg_sel<=x"ffff"; end if; next_state<=s14;
        when s14=>if key_in(14)='1' then seg_sel<=x"bfff"; show1<=showw(59 downto 56); else seg_sel<=x"ffff"; end if; next_state<=s15;
        when s15=>if key_in(15)='1' then seg_sel<=x"7fff"; show1<=showw(63 downto 60); else seg_sel<=x"ffff"; end if; next_state<=s0;
        end case;
    end process;

end Behavioral;
```
### 5.5 数码管译码模块设计
```vhdl

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity data2seg is
Port (data_in:in std_logic_vector(3 downto 0);
    seg_data:out std_logic_vector(7 downto 0));
end data2seg;

architecture Behavioral of data2seg is

begin
    process(data_in)
        begin
        case data_in is
            when x"0"=>seg_data<=x"c0";
            when x"1"=>seg_data<=x"f9";
            when x"2"=>seg_data<=x"a4";
            when x"3"=>seg_data<=x"b0";
            when x"4"=>seg_data<=x"99";
            when x"5"=>seg_data<=x"92";
            when x"6"=>seg_data<=x"82";
            when x"7"=>seg_data<=x"f8";
            when x"8"=>seg_data<=x"80";
            when x"9"=>seg_data<=x"90";
            when x"a"=>seg_data<=x"88";
            when x"b"=>seg_data<=x"83";
            when x"c"=>seg_data<=x"c6";
            when x"d"=>seg_data<=x"a1";
            when x"e"=>seg_data<=x"86";
            when x"f"=>seg_data<=x"8e";
            end case;
    end process;

end Behavioral;
```
## 六、仿真配置
``` vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity micro_sim is
   -- Port ( clk : in STD_LOGIC);
end micro_sim;

architecture Behavioral of micro_sim is

component micro is
Port (clk, rst : in std_logic;
    seg_sel : out std_logic_vector(15 downto 0);
    seg_data : out std_logic_vector(7 downto 0);
    clk_mc,m_ua,cmrom_cs:in std_logic;
    ir:in std_logic_vector(7 downto 2) );
end component;

signal clk, rst,clk_mc,m_ua,cmrom_cs: std_logic := '0';
signal seg_sel: std_logic_vector(15 downto 0) := (others=>'0');
signal seg_data: std_logic_vector(7 downto 0) := (others=>'0');
signal ir: std_logic_vector(7 downto 2) := (others=>'0');
constant clk_period : time := 10 ns;

begin
    Micro_Instance: micro
                port map(
                        clk => clk,
                        rst => rst,
                        seg_sel => seg_sel,
                        seg_data => seg_data,
                        clk_mc => clk_mc,
                        m_ua => m_ua,
                        cmrom_cs => cmrom_cs,
                        ir => ir);
    clk <= not clk after clk_period / 2;   -- clk production
    clk_mc <= not clk_mc after clk_period * 8;   -- clk production
    
    process
     begin
            cmrom_cs <= '1';
            -- reset firstly
            rst <= '1';
            wait for clk_period * 16;
            rst <= '0';
            
            -- load the first instruction
            m_ua <= '0';
            wait for clk_period * 16;
            
            -- load ir register
            m_ua <= '1';
            ir <= "000001";
            wait for clk_period  * 16;
            
            -- run sequencely
            m_ua <= '0';
            wait for clk_period  * 48;
            
            cmrom_cs <= '0';
            
     end process;
     
end Behavioral;
```
## 七、实验结果

### 7.1 仿真结果

本次实验中，我通过使用数码管来显示微控制器的功能作用，其中各数码管的功能解释如下：

+ 0-1数码管：未使用，默认显示为00；
+ 2-3数码管：显示当前微指令地址；
+ 4-5数码管：显示下一天微指令地址；
+ 6-15数码管：显示微指令的控制字段；

#### 系统复位状态

<img src="https://jsd.cdn.zzko.cn/gh/LZHMS/picx-images-hosting@master/ZBlog/PDFImage/image.7p3euk5ie.webp" alt="系统复位" />

当系统复位时，即 rst = 1，系统输出为最低为数码管显示 0 其余关闭；

#### 取指令公操作

<img src="https://jsd.cdn.zzko.cn/gh/LZHMS/picx-images-hosting@master/ZBlog/PDFImage/image.syr15lhc8.webp" alt="取指令操作" />

​	根据仿真结果可以看出，其16个数码管的编码值依次为 00 00 00 003119F378，微控制器默认处于取指令操作，所以该条指令下一条微指令仍然回到取指操作；

#### IR实现指令跳转
<img src="https://jsd.cdn.zzko.cn/gh/LZHMS/picx-images-hosting@master/ZBlog/PDFImage/image.99t5ku5a59.webp" alt="image" />

​	根据仿真结果可以看出，其16个数码管的编码值依次为 00 01 02 8031717379，m_ua为高电平，将 IR=01H 对应地址的微指令加载到当前控制器中，所以显示正在执行当前地址为 01 的微指令，其下一条微指令的地址为 02H；

#### 指令顺序执行
<img src="https://jsd.cdn.zzko.cn/gh/LZHMS/picx-images-hosting@master/ZBlog/PDFImage/image.6bgvhc4dqd.webp" alt="image" />

​	根据仿真结果可以看出，当一个微程序执行完毕后，微控制器再次返回到取指操作对应的微指令，等待进入下一条机器指令对应的微程序入口。

### 7.2 板级验证

根据实验进一步验证，可知功能完全正确，如下图示为 IR 加载地址为 03H 的的微指令然后顺序执行一段微程序的结果。

<img src="https://jsd.cdn.zzko.cn/gh/LZHMS/picx-images-hosting@master/ZBlog/PDFImage/162a010ca7d48613a592e2ccb39b2e6.2obbttu7i6.webp" alt="当前地址为03H,下一条地址为04H" />
<img src="https://jsd.cdn.zzko.cn/gh/LZHMS/picx-images-hosting@master/ZBlog/PDFImage/6eb3e289021af33a3ab9a58f9e3cedc.5xafqhiap6.webp" alt="当前地址为04H,下一条地址为05H" />
<img src="https://jsd.cdn.zzko.cn/gh/LZHMS/picx-images-hosting@master/ZBlog/PDFImage/36eb118e7673aa9a2444b6c6b6bfcac.64dnlx4tzm.webp" alt="当前地址为05H,下一条地址为06H" />
<img src="https://jsd.cdn.zzko.cn/gh/LZHMS/picx-images-hosting@master/ZBlog/PDFImage/154d7e41098f4cddcf37b9ce2102837.lvj5rwx8g.webp" alt="当前地址为06H,下一条地址为07H" />
<img src="https://jsd.cdn.zzko.cn/gh/LZHMS/picx-images-hosting@master/ZBlog/PDFImage/6f331eec9a9f5e597af978763e764b7.2h83ye9ty2.webp" alt="当前地址为08H,下一条地址为00H" />
<img src="https://jsd.cdn.zzko.cn/gh/LZHMS/picx-images-hosting@master/ZBlog/PDFImage/3865dff0a0b0fead74c141de3099051.lvj5rxoo8.webp" alt="当前地址为00H,下一条地址为00H" />