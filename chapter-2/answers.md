# Answers to exercises of chapter 2
### Environment
Code run on WSL2 Ubuntu 20.04.6 LTS
AMD Ryzen 5 PRO 4650U with Radeon Graphics @ 2.10 GHz

## 2.1 
add estimate: 1 cycle

## 2.2
- (0 cycles/iteration) The optimized version strips out loop compiling a constant value, 
probably even removing the sum all together as it is not used anywhere in the code besides the loop 
and it is a local variable.
- (2.89 cycles/iteration) The unoptimized version runs too slowly because of loop overhead 
(taking a jump is generally 1 cycle),
unrolling the sum should reduce the loop overhead.

## 2.3
- Unoptimized version ran on 3.13 cycles/iteration, it is approximately the same as before
still I'm quite surprised is not closer, but both values can be approximated to 3 cycles.
Inspecting the assembly code, the sumation loop is absolutely the same, 
so printing the result seems to be slow enough to cause that discrepancy (does it holds as explanation?)
- Optimized version is still able to optimize the loop out to a constant, the asm code loop
is exactly the same that the original one.

## 2.4
- Unoptimized version ran on 10.08 cycles/iteration, quite surprising.
It seems even with -O0 the compiler does some optimization, or probably because
of the volatile, know there is some check to be done before the add so the loop is slower??
Inspecting the assembly the only noticeable change on the loop code is a different location on the stack of some variables, -44(%rbp) rather than -48(%rbp), why should that be slower?
- Optimized version ran now at 1.46 cycles/iteration, the compiler can't anymore
remove the loop as the incr being volatile could have been modified by another 
code in the program, so the compiler cannot guess anymore the result to be constant.
Still is slower than the estimate of 1 cycle because of the loop overhead.
Unrolling the sum, which the compile optimizer is not doing, should help

## 2.5
- Unrolling the sum x10 ran at 0.34 cycles/iteration
- x5 ran at same speed 0.34 cycles/iteration
- x4 ran at slightly slower speed 0.37 cycles/iteration wich can only be accounted
because of loop overhead
- x2 ran at 0.57 cycles/iteration
- x1 ran at 0.56 cycles/iteration. With respect with ##2.4 run the assembly code is the same
so there is a lot o things that should be in the caches as I've run the same code multiple times...

Going fom x1 to x2 didn't improve dramatically the speed, going to x4 improved it a lot.
Going from x4 to x10 didn't scratch any cycle.
It appears that the CPU I'm running on has 4 add units so 4 adds are able to execute
in the same cycle effectively reducing the time.

Still the optimization give an erroneous cycle execution count for an add.

### Removing loop overhead with 2 loops: 
- x4 adds in one loop and x5 loops in another loop gives 0.02 cycles/iteration per add
we dont have anymore the loop overhead, but we have overlapping adds wich give a
better time for one add
- x4 and x8 adds in diffetent loops gives 0.02 cycles/iteration

At this point we are measuring other thing than adds.
Some optimization is overlapping adds.

I believe there is something wrong in my calculation here.

### Removing 1 associativity optimization
Compiling with mystery1_2.5_x4 with -fno-tree-reassoc still gives 0.54 cycles/iteration

### Conclusion
addq takes 1 cycle

## 2.6
### 1 iteration
21 cycles/iteration: too much loop overhead to be able to measure effectively an add

### 10 iteration
4.20 cycles/iteration: still too much overhead but getting closer

### 100 iteration
4.83 cycles/iteration: surprisingly slower than previous but there is still too much overhead

### 10_000 iterations
0.57 cycles/iteration: it seems to be enough iterations to get rid of the overhead

### 100_000_000
0.55 cycles/iteration: marginal improvement, after this point we cannot do better.

## 2.7
### Estimates
addq: 1 cycle
mulq: 4 cycles
divq: 8 cycles
fadd: 2 cycles
fmul: 8 cycles
fdiv: 16 cycles

## 2.8

### Measurements
addq: 100000 iterations, 87423 cycles, 0.87 cycles/iteration
mulq: 100000 iterations, 259812 cycles, 2.60 cycles/iteration
divq: 100000 iterations, 1266951 cycles, 12.67 cycles/iteration, keeping the quotient greater than 0 by adding 64u after the 4 divs, as the add goes to another port unit it should not have a lot of overhead for the divq

fadd: 100000 iterations, 259602 cycles, 2.60 cycles/iteration
fmul: 100000 iterations, 262941 cycles, 2.63 cycles/iteration
fdiv: 100000 iterations, 1158801 cycles, 11.59 cycles/iteration, fdiv goes down to 0 after only ~1000 depending on incrf iterations, don't know if the CPU optimizes the division after that.

## 2.9
./mystery1_2.5_x4_all_overlflow

fmul: 1000000 iterations, 2673888 cycles, 2.67 cycles/iteration
fdiv: 1000000 iterations, 11722536 cycles, 11.72 cycles/iteration

There were no noticable change