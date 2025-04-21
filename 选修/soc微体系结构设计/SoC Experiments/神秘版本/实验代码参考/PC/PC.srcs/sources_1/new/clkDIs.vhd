library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clkDIs is
    port(
        clk: in std_logic;
        clk_seg: out std_logic;
        clk_pc: out std_logic
    );
end clkDIs;

architecture Behavioral of clkDIs is
    signal clk_seg_locker, clk_pc_locker: std_logic:='0';  --控制数码管刷新和PC计数器+1的信号
begin
    clk_seg <= clk_seg_locker;
    clk_pc <= clk_pc_locker;

    process(clk)
        variable cnt_seg, cnt_pc: integer:=0;       --数码管计数器和PC计数器初值为0
        constant seg_max: integer:=1;               --数码管计数器最大值为1
        constant pc_max: integer:=50000000;         --PC计数器最大值为1000 0000
    begin
        if clk'event and clk='1' then               --时钟信号上升沿有效
            cnt_seg := cnt_seg+1;                   --数码管计数器+1
            cnt_pc := cnt_pc+1;                     --PC计数器+1
            if cnt_seg=seg_max then                 --数码管计数器达到最大值
                clk_seg_locker <= not clk_seg_locker;--数码管锁定信号翻转
                cnt_seg:=0;                         --数码管计数器清零
            end if;
            if cnt_pc=pc_max then                   --PC计数器达到最大值
                clk_pc_locker <= not clk_pc_locker; --PC锁定信号翻转
                cnt_pc:=0;                          --PC计数器清零
            end if;
        end if;
    end process;

end Behavioral;
