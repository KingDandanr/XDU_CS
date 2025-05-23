# SOC期末复习

## 课堂讲义解析与习题

**SOC** 
片上系统（System on Chip,SoC），是指在单一芯片上集成了数字电路、模拟电路、信号采集 和转换电路、存储器、MPU、MCU、DSP、 MPEG等，实现了一个系统的功能

**基本构成**
嵌入式处理器核（如MPU、MCU或DSP） 
存储器（如SRAM、SDRAM、Flash ROM） （Random Access Memory）（Read-Only Memory）
专用功能模块（如ADC、DAC、PLL、2D/3D图 形运算单元） 
I/O接口模块（如USB、UART、Ethernet等）等 多种功能模块 
片内总线（AMBA、Wishbone、Avalon等）

![1.1](SOC期末复习.assets/1.1.png)	

**SoC类型**
计算控制型 
通信网络型 
信号处理型

![计算控制型](SOC期末复习.assets/计算控制型.png)

![信号处理型](SOC期末复习.assets/信号处理型.png)

![1.2](SOC期末复习.assets/1.2.png)	

**SoC系统级研究内容** ◆软硬件协同设计技术  ◆ 设计重用技术 ◆与底层相结合设计技术

**设计重用技术**
基于IP核的模块级重用
基于平台的系统级重用

IP核是指经过反复验证过的、具有特定功能的， 可重复利用的逻辑块或数据块，用于专用集成电路 （ASIC）或者可编辑逻辑器件（FPGA）。

![IP核](SOC期末复习.assets/ip核分类.png)

![1.3](SOC期末复习.assets/1.3.png)	

**低功耗设计技术** 
芯片功耗主要由开关功耗、短路功耗和漏电流功耗等组成
◆工艺级低功耗技术
降低电源供电电压，减少跳变功耗
多阈值工艺 MTCMOS
变阈值工艺VTCMOS
◆电路级低功耗技术 减摆幅   电荷再循环总线结构
◆逻辑（门）级低功耗技术
主要通过低电压实现低功耗技术 
◆RTL级（寄存器传输级）低功耗技术 
主要从降低不希望的跳变 入手
◆体系结构级低功耗技术  并行技术 • 流水线技术 • 预计算技术
◆算法级低功耗技术   总线翻转译码技术 • 编码技术
◆系统级低功耗技术  门控时钟技术 • 异步电路技术

![1.4](SOC期末复习.assets/1.4.png)	

![image-20250514021611424](SOC期末复习.assets/系统描述模型.png)

![1.5](SOC期末复习.assets/1.5.png)

![image-20250514021748041](SOC期末复习.assets/软硬件划分.png)

![1.6](SOC期末复习.assets/1.6.png)

**关键技术** 
系统建模 
软硬件划分技术 
软硬件协同综合 
软硬件协同仿真与验证

![image-20250514022227718](SOC期末复习.assets/软硬件协同综合.png)

![image-20250514022704674](SOC期末复习.assets/仿真与验证.png)

![image-20250514022752882](SOC期末复习.assets/三盒.png)

![1.7](SOC期末复习.assets/1.7.png)	

**总线结构**
对SoC上芯核和电路模块等的互连
单总线、多总线和片上网络（NoP）的方式

**soc系统设计方法**  自顶向下 自底向上 上下结合

![image-20250514023155127](SOC期末复习.assets/SOC片上总线.png)

![1.8](SOC期末复习.assets/1.8.png)	

![image-20250514023313597](SOC期末复习.assets/AMBA.png)

![image-20250514023344522](SOC期末复习.assets/AXI.png)

![1.9](SOC期末复习.assets/1.9.png)	

其中**OPC、WishBone**是真正可以免费使用的，其它三种都是声称免费但是需要授权协议的

![1.10](SOC期末复习.assets/1.10.png)	

![image-20250514023512363](SOC期末复习.assets/PLB.png)

![image-20250514023534298](SOC期末复习.assets/OPB.png)

![image-20250514023554557](SOC期末复习.assets/DCR.png)

![image-20250514023648051](SOC期末复习.assets/总线性能比较.png)

![image-20250514025806359](SOC期末复习.assets/常用VHDL概述.png)

![image-20250514030605670](SOC期末复习.assets/VHDL程序基本结构.png)

![image-20250514031348876](SOC期末复习.assets/程序结构.png)

![image-20250514032128694](SOC期末复习.assets/类属说明.png)

类属常用于定义： 实体端口的大小、 设计实体的物理特性、 总线宽度、 元件例化的数量等

![image-20250514032232118](SOC期末复习.assets/端口声明.png)



![1.5.1](SOC期末复习.assets/1.5.1.png)	



![1.5.2](SOC期末复习.assets/1.5.2.png)	

![1.5.3](SOC期末复习.assets/1.5.3.png)	

![1.5.4](SOC期末复习.assets/1.5.4.png)	

![2.1](SOC期末复习.assets/2.1.png)	

![2.2](SOC期末复习.assets/2.2.png)	

![2.3](SOC期末复习.assets/2.3.png)	

![2.4](SOC期末复习.assets/2.4.png)	

![2.5](SOC期末复习.assets/2.5.png)	

![2.6](SOC期末复习.assets/2.6.png)	

![2.7](SOC期末复习.assets/2.7.png)	

![2.8](SOC期末复习.assets/2.8.png)	

![2.9](SOC期末复习.assets/2.9.png)	

![2.10](SOC期末复习.assets/2.10.png)	

<img src="SOC期末复习.assets/2.11.png" alt="2.11" style="zoom:150%;" />

![2.12](SOC期末复习.assets/2.12.png)

![2.13](SOC期末复习.assets/2.13.png)

![2.14](SOC期末复习.assets/2.14.png)

![2.15](SOC期末复习.assets/2.15.png)

![2.16](SOC期末复习.assets/2.16.png)

![2.17](SOC期末复习.assets/2.17.png)

![3.1](SOC期末复习.assets/3.1.png)

![4.1](SOC期末复习.assets/4.1.png)

![4.2](SOC期末复习.assets/4.2.png)

![4.3](SOC期末复习.assets/4.3.png)

![4.4](SOC期末复习.assets/4.4.png)

![5.1](SOC期末复习.assets/5.1.png)

![5.2](SOC期末复习.assets/5.2.png)

![5.3](SOC期末复习.assets/5.3.png)

![5.4](SOC期末复习.assets/5.4.png)

![6.1](SOC期末复习.assets/6.1.png)

![6.2](SOC期末复习.assets/6.2.png)

![6.3](SOC期末复习.assets/6.3.png)

![6.4](SOC期末复习.assets/6.4.png)

![6.5](SOC期末复习.assets/6.5.png)

![6.6](SOC期末复习.assets/6.6.png)

![6.7](SOC期末复习.assets/6.7.png)

![6.8](SOC期末复习.assets/6.8.png)

![6.9](SOC期末复习.assets/6.9.png)

![6.10](SOC期末复习.assets/6.10.png)

![6.11](SOC期末复习.assets/6.11.png)

![6.12](SOC期末复习.assets/6.12.png)

![6.13](SOC期末复习.assets/6.13.png)

![6.14](SOC期末复习.assets/6.14.png)

![6.15](SOC期末复习.assets/6.15.png)

![6.16](SOC期末复习.assets/6.16.png)