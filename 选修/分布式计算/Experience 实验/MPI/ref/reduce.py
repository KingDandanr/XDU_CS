from mpi4py import MPI

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()

N = 100  # 假设 N 可以被 size 整除
chunk_size = N // size

# 每个进程计算负责的区间
start = rank * chunk_size + 1
end = start + chunk_size - 1

# 局部求和
partial_sum = 0
for i in range(start, end + 1):
    partial_sum += i

# 使用 reduce 聚合所有进程的 partial_sum 到 rank 0
total_sum = comm.reduce(partial_sum, op=MPI.SUM, root=0)

if rank == 0:
    print(f"[Rank 0] Total sum of 1 to {N} is {total_sum}")
