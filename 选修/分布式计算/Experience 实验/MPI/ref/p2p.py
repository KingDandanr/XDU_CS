from mpi4py import MPI

comm = MPI.COMM_WORLD
rank = comm.Get_rank()

if rank == 0:
    data = "Hello from rank 0"
    comm.send(data, dest=1, tag=99)
    print(f"[Rank 0] Sent message: {data}")
elif rank == 1:
    received_data = comm.recv(source=0, tag=99)
    print(f"[Rank 1] Received message: {received_data}")