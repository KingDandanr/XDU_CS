在 Windows 平台上运行 Python 编写的 MPI（Message Passing Interface）程序需要搭建一套适合的 MPI 开发环境，主要包括：

---

## ✅ 一、环境准备概述

1. 安装 Python（建议使用 Anaconda）
2. 安装 MPI 实现（如 Microsoft MPI）
3. 安装 `mpi4py` Python 库
4. 配置系统环境变量
5. 使用 `mpiexec` 运行 MPI 程序

---

## ✅ 二、详细步骤

### 1️⃣ 安装 Python（建议使用 Anaconda）

- 推荐使用 [Anaconda](https://www.anaconda.com/) 进行安装，它自带包管理器 `conda`，方便后续操作。
- 安装完后打开 Anaconda Prompt（或 CMD）进行后续操作。

### 2️⃣ 安装 MPI 实现（Microsoft MPI）

- 前往微软官网下载 MS-MPI：
  - 下载地址：https://learn.microsoft.com/en-us/message-passing-interface/microsoft-mpi
- 下载两个组件并依次安装：
  1. **MS-MPI Redistributable Package**
  2. **MS-MPI SDK**

> 安装完成后，`mpiexec.exe` 通常会出现在：
```
C:\Program Files\Microsoft MPI\Bin\
```

### 3️⃣ 配置环境变量

- 将 MS-MPI 安装目录添加到系统环境变量 `PATH` 中，如：
```
C:\Program Files\Microsoft MPI\Bin
```

### 4️⃣ 安装 `mpi4py` 库

打开 Anaconda Prompt 或 CMD，执行以下命令：

```bash
pip install mpi4py
```

或者使用 conda：

```bash
conda install -c conda-forge mpi4py
```

> ✅ 注意：安装 `mpi4py` 时会自动检测并使用系统已安装的 MPI 库（如 MS-MPI），所以一定要先安装 MPI。

### 5️⃣ 验证安装是否成功

编写一个简单的 MPI 程序，例如 `test_mpi.py`：

```python
from mpi4py import MPI

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()

print(f"Hello from rank {rank} of {size}")
```

然后使用以下命令运行（假设使用 4 个进程）：

```bash
mpiexec -n 4 python test_mpi.py
```

你应该能看到类似如下输出（顺序可能不同）：

```
Hello from rank 0 of 4
Hello from rank 1 of 4
Hello from rank 2 of 4
Hello from rank 3 of 4
```

---