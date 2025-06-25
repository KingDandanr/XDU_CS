from mpi4py import MPI

comm = MPI.COMM_WORLD
rank = comm.Get_rank()

# Rank 0 准备要广播的数据
if rank == 0:
    data = "Hello from Rank 0"
else:
    data = None

# 所有进程通过 bcast 接收数据（Rank 0 是广播者）
data = comm.bcast(data, root=0)

# 每个进程打印接收到的数据
print(f"[Rank {rank}] received data: {data}")
