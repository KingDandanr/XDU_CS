from mpi4py import MPI

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()

N = 100  # 假设 N 总是能被 size 整除
chunk_size = N // size

# 每个进程计算自己负责的区间
start = rank * chunk_size + 1
end = start + chunk_size - 1

# 用普通循环求和
partial_sum = 0
for i in range(start, end + 1):
    partial_sum += i

if rank == 0:
    total = partial_sum
    for src in range(1, size):
        recv_sum = comm.recv(source=src, tag=src)
        total += recv_sum
    print(f"[Rank 0] Total sum of 1 to {N} is {total}")
else:
    comm.send(partial_sum, dest=0, tag=rank)
