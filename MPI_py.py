from mpi4py import MPI
from random import uniform

comm = MPI.COMM_WORLD
#comm is the communicator object. Its methods will be used
#to carry out between processes.

rank = comm.Get_rank()
S = comm.Get_size() #number of processes
N = 10 #number of points

if rank == 0:
    points = tuple([(uniform(0,1), uniform(0,1)) for i in range(N)])
    
    #send
    for i in range(1, S): #from 1 to number of processes
        comm.send(points[0 : i * N // (S-1)], dest=i, tag=i)
    
    #receive
    for i in range(1, S):
        PI, time = comm.recv(source=i, tag=i)
        print("iteration:", i)
        print("value of the number:", PI)
        print("time:", time)
else:
    points = comm.recv(source=0, tag=rank)
    start = MPI.Wtime() #return an elapsed time on the calling processor
    counter = 0
    for x,y in points:
        if x**2 + y**2 <= 1:
            counter += 1
    
    PI = 4*counter / len(points)
    time = MPI.Wtime() - start
    comm.send((PI,time), dest=0, tag=rank)
    
MPI.Finalize()