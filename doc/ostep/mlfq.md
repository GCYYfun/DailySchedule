# Multi-level Feedback Queue (MLFQ)

## Introduction

The Multi-level Feedback Queue (MLFQ) scheduler was first described by Corbato et al.
多级反馈队列调度算法
最开始由 Corbato 描述


in 1962 in a system
known as the Compatible Time-Sharing System (CTSS), and this work,
along with later work on Multics, led the ACM to award Corbato its
highest honor, the Turing Award.

1962，在一个叫做CTSS(兼容分时系统)的系统上，这个工作、以及后来的在multics的工作,
Corbato、获得ACM授予的图灵奖


The fundamental problem MLFQ tries to address is two-fold。

多级反馈队列 主要解决 两个基本问题

First, it
would like to optimize turnaround time

第一 mlfq 希望 优化 周转时间

(使一个job完成的尽量快)



Second, MLFQ would like to make
a system feel responsive to interactive users

第二 mlfq 希望 对用户交互响应

(使job响应时间短)



MLFQ: Basic Rules

Thus, we arrive at the first two basic rules for MLFQ:  
```
• Rule 1: If Priority(A) > Priority(B), A runs (B doesn’t).  
• Rule 2: If Priority(A) = Priority(B), A & B run in RR.  
• Rule 3: When a job enters the system, it is placed at the highest priority (the topmost queue).  
• Rule 4a: If a job uses up an entire time slice while running, its priority is reduced (i.e., it moves down one queue).  
• Rule 4b: If a job gives up the CPU before the time slice is up, it stays at the same priority level.  
```