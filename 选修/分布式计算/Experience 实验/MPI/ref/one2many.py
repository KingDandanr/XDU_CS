from mpi4py import MPI

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()

if rank == 0:
    # 主进程向其他所有进程发送消息
    for dest in range(1, size):
        message = f"Hello process {dest} from rank 0"
        comm.send(message, dest=dest, tag=dest)
        print(f"[Rank 0] Sent to Rank {dest}: {message}")
else:
    # 其他进程接收来自rank 0的消息
    received_message = comm.recv(source=0, tag=rank)
    print(f"[Rank {rank}] Received message: {received_message}")