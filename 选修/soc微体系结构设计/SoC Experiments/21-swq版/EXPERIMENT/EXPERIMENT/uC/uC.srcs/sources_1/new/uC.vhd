----------------------------------------------------------------------------------
-- Engineer: switch_swq
-- Create Date: 2024/04/24 16:22:50
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uC is
    Port(
        clk_uC:in std_logic;    --微程序控制器时钟信号
        nreset:in std_logic;    --复位信号
        M_uA:in std_logic;      --微地址控制信号
        IR:in std_logic_vector(7 downto 2); --IR操作码信息
        CMROM_CS:in std_logic;  --控制存储器选通信号
        
        CM:out std_logic_vector(47 downto 8)    --控制信号输出
    );
end uC;

architecture Behavioral of uC is
component uC_uA
    Port(
        clk:in std_logic;
        nreset:in std_logic;    --复位信号
        M_uA:in std_logic;
        IR:in std_logic_vector(7 downto 2);     --IR操作码信息
        uA_in:in std_logic_vector(7 downto 0);  --uIR传送的微地址
        
        uA_out:out std_logic_vector(7 downto 0) --下一条微指令的地址
    );
end component;
component uC_uAR
    Port(
        clk:in std_logic;
        nreset: in std_logic;
        uAR_in:in std_logic_vector(7 downto 0);  --uA传送的微地址
        
        uAR_out:out std_logic_vector(7 downto 0) --送至uCM的地址
    );
end component;
component uC_CM
    generic(
        width:integer := 48;    --位宽
        depth:integer := 8      --深度
    );
    port(
        clk:in std_logic;
        addr:in std_logic_vector(depth-1 downto 0);     ----uC_ROM地址
        CMROM_CS:in std_logic;  --uC_ROM输出使能
        
        data_out:out std_logic_vector(width-1 downto 0) --uC_ROM输出
    );
end component;
component uC_uIR
  Port (
    clk:in std_logic;
    CM:in std_logic_vector(47 downto 0);
    
    uA:out std_logic_vector(7 downto 0);
    uI:out std_logic_vector(47 downto 8)
  );
end component;

signal uA_in,uA_out,uAR_out:std_logic_vector(7 downto 0); 
signal CM_line:std_logic_vector(47 downto 0);

begin

uC_uA_inst:uC_uA port map(clk_uC,nreset,M_uA,IR,uA_in,uA_out);
uC_uAR_inst:uC_uAR port map(clk_uC,nreset,uA_out,uAR_out);
uC_uCM_inst:uC_CM generic map(48,8)port map(clk_uC,uAR_out,CMROM_CS,CM_line);
uC_uIR_inst:uC_uIR port map(clk_uC,CM_line,uA_in,CM);

end Behavioral;
