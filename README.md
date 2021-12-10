# Parallel Hyperquicksort

The parallel hyperquicksort is a parallel formulation of the quicksort algorithm that takes advantage of the topology of a p-process hypercube connected parallel computer. Let n be the number of elements to be sorted and p = 2d be the number of processes in a d-dimensional hypercube. Each process is assigned a block of n/p elements and the labels of the processes define the global order of the sorted sequence. The algorithm starts by selecting a pivot element, which is broadcast to all processes. Each process, upon receiving the pivot, partitions its local elements into two blocks, one with elements smaller than the pivot and one with elements larger than the pivot. Then the processes connected along the dth communication link exchange appropriate blocks so that one retains elements smaller than the pivot and the other retains elements larger than the pivot. To be more precise, each process with a 0 in the dth bit (the most significant bit) position of the binary representation of its process label retains the smaller elements and each process with a 1 in the dth bit retains the larger elements. After this step, each process in the (d-1)-dimensional hypercube whose dth label bit is 0 will have elements smaller than the pivot and each process in the other (d-1)-dimensional hypercube will have elements larger than the pivot. This procedure is performed recursively in each subcube, splitting the subsequences further. After d such splits – one along each dimension – the sequence is sorted with respect to the global ordering imposed on the processes. This does not mean that the elements at each process are sorted. Therefore, each process sorts its local elements by using sequential quicksort. The theoretical parallel runtime of the algorithm is

![This is an image](https://github.com/nelsonfilipecosta/Parallel-Hyperquicksort/blob/main/Figures/parallel_runtime.png)

and its execution is illustrated in the figure below.

![This is an image](https://github.com/nelsonfilipecosta/Parallel-Hyperquicksort/blob/main/Figures/hypercube_topology.png)

The implementation of this algorithm was based on chapter 9 from the textboox

> Kumar, V., Grama, A., Gupta, A. and Karypis, G. Introduction to parallel computing (Vol. 110). Redwood City, CA: Benjamin/Cummings, 1994.

## Code

Use the Makefile to compile the code and run the following command

```
mpirun -np x hyperquicksort y
```

to sort a random sequence of size y integers using the parallel hyperquicksort algorithm with x processors.
