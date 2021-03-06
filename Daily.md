# Daliy LOG

## 序言

没什么序言、但之前的记录在这里...[之前记录](annals/2020/README.md)


# New 

## 辛丑牛年 （2021-03-03）周三

1. 修改ld、asm
2. 整理代码
3. 实验截图   
![smp](picture/smp.PNG)

## 辛丑牛年 （2021-03-02）周二

1. 学习多核调度
1. OSTEP 完成fork模块 (完成)

## 辛丑牛年 （2021-03-01）周一

1. riscv 使用 smp启动
1. OSTEP 修改fork模块 (未完成)

## 辛丑牛年 （2021-02-28）周日
关于 riscv 的 文档

1. riscv 的 isa 文档
https://github.com/riscv/riscv-isa-manual  
两个：特权级 非特权级
2. riscv 的 asm 文档
https://github.com/riscv/riscv-asm-manual/blob/master/riscv-asm.md  
西数视频教程（中字）：https://www.bilibili.com/video/BV1eJ411t7JS/?spm_id_from=333.788.videocard.8  
3. riscv 的 plic 文档
https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc
4. riscv 的 sbi 文档
https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc

## 辛丑牛年 （2021-02-27）周六
1. 人生一片黑暗...看 opensbi 、仿写bootloader
## 辛丑牛年 （2021-02-26）周五
1. 仿写一个executor、使用executor
## 辛丑牛年 （2021-02-25）周四
1. 练习 rust async
## 辛丑牛年 （2021-02-24）周三
1. 看 rust async 相关内容

## 辛丑牛年 （2021-02-23）周二
1. 做 rcore-rCore-Tutorial-v3
## 辛丑牛年 （2021-02-22）周一
1. OSTEP 测试运行 多级反馈队列
1. 读rcore文档

## 辛丑牛年 （2021-02-21）周日
1. OSTEP 测试现有模块 补充文档

## 辛丑牛年 （2021-02-20）周六
1. OSTEP 添加fork模块 (未完成)

## 辛丑牛年 （2021-02-19）周五
1. OSTEP 迁移

## 辛丑牛年 （2021-02-18）周四
1. OSTEP 迁移

## 辛丑牛年 （2021-02-17）周三
1. OSTEP 迁移

## 辛丑牛年 正月初五 初五 （2021-02-16）周二

更新一部分  记录在 昨天的 表里 ↓


## 辛丑牛年 正月初四 初四 （2021-02-15）周一

ostep python 项目有许多更新

根据旧项目 参考 python 迁移新项目 中...

List 如下

### Virtualization

Chapter | What To Do | Status |
--------|----------- | ------ |
[Abstraction: Processes](http://www.cs.wisc.edu/~remzi/OSTEP/cpu-intro.pdf) | Run [process-run.py](cpu-intro)|✔️
[Process API](http://www.cs.wisc.edu/~remzi/OSTEP/cpu-api.pdf) | Run [fork.py](cpu-api) and write some code|❌
[Direct Execution](http://www.cs.wisc.edu/~remzi/OSTEP/cpu-mechanisms.pdf) | Write some code
[Scheduling Basics](http://www.cs.wisc.edu/~remzi/OSTEP/cpu-sched.pdf) | Run [scheduler.py](cpu-sched)|✔️
[MLFQ Scheduling](http://www.cs.wisc.edu/~remzi/OSTEP/cpu-sched-mlfq.pdf)	| Run [mlfq.py](cpu-sched-mlfq)|✔️
[Lottery Scheduling](http://www.cs.wisc.edu/~remzi/OSTEP/cpu-sched-lottery.pdf) | Run [lottery.py](cpu-sched-lottery)|✔️
[Multiprocessor Scheduling](http://www.cs.wisc.edu/~remzi/OSTEP/cpu-sched-multi.pdf) | Run [multi.py](cpu-sched-multi)|❌
[Abstraction: Address Spaces](http://www.cs.wisc.edu/~remzi/OSTEP/vm-intro.pdf) | Write some code
[VM API](http://www.cs.wisc.edu/~remzi/OSTEP/vm-api.pdf) | Write some code
[Relocation](http://www.cs.wisc.edu/~remzi/OSTEP/vm-mechanism.pdf) | Run [relocation.py](vm-mechanism)|✔️
[Segmentation](http://www.cs.wisc.edu/~remzi/OSTEP/vm-segmentation.pdf) | Run [segmentation.py](vm-segmentation)|✔️
[Free Space](http://www.cs.wisc.edu/~remzi/OSTEP/vm-freespace.pdf) | Run [malloc.py](vm-freespace)|✔️
[Paging](http://www.cs.wisc.edu/~remzi/OSTEP/vm-paging.pdf) | Run [paging-linear-translate.py](vm-paging)|✔️
[TLBs](http://www.cs.wisc.edu/~remzi/OSTEP/vm-tlbs.pdf) | Write some code
[Multi-level Paging](http://www.cs.wisc.edu/~remzi/OSTEP/vm-smalltables.pdf) | Run [paging-multilevel-translate.py](vm-smalltables)|✔️
[Paging Mechanism](http://www.cs.wisc.edu/~remzi/OSTEP/vm-beyondphys.pdf) | Run [mem.c](vm-beyondphys)|❌
[Paging Policy](http://www.cs.wisc.edu/~remzi/OSTEP/vm-beyondphys-policy.pdf) | Run [paging-policy.py](vm-beyondphys-policy)|✔️
[Complete VM](http://www.cs.wisc.edu/~remzi/OSTEP/vm-complete.pdf) | No homework (yet)|

### Concurrency

Chapter | What To Do | Status |
--------|----------- | ------ |
[Threads Intro](http://www.cs.wisc.edu/~remzi/OSTEP/threads-intro.pdf) | Run [x86.py](threads-intro)|🚧
[Thread API](http://www.cs.wisc.edu/~remzi/OSTEP/threads-api.pdf)	| Run [some C code](threads-api)|❌
[Locks](http://www.cs.wisc.edu/~remzi/OSTEP/threads-locks.pdf)	| Run [x86.py](threads-locks)|🚧
[Lock Usage](http://www.cs.wisc.edu/~remzi/OSTEP/threads-locks-usage.pdf) | Write some code
[Condition Variables](http://www.cs.wisc.edu/~remzi/OSTEP/threads-cv.pdf) | Run [some C code](threads-cv)|❌
[Semaphores](http://www.cs.wisc.edu/~remzi/OSTEP/threads-sema.pdf) | Read and write [some code](threads-sema)
[Concurrency Bugs](http://www.cs.wisc.edu/~remzi/OSTEP/threads-bugs.pdf) | Run [some C code](threads-bugs)|❌
[Event-based Concurrency](http://www.cs.wisc.edu/~remzi/OSTEP/threads-events.pdf) | Write some code

### Persistence

Chapter | What To Do | Status |
--------|----------- | ------ |
[I/O Devices](http://www.cs.wisc.edu/~remzi/OSTEP/file-devices.pdf) | No homework (yet)
[Hard Disk Drives](http://www.cs.wisc.edu/~remzi/OSTEP/file-disks.pdf) | Run [disk.py](file-disks)|❌
[RAID](http://www.cs.wisc.edu/~remzi/OSTEP/file-raid.pdf) | Run [raid.py](file-raid)|✔️
[FS Intro](http://www.cs.wisc.edu/~remzi/OSTEP/file-intro.pdf) | Write some code
[FS Implementation](http://www.cs.wisc.edu/~remzi/OSTEP/file-implementation.pdf) | Run [vsfs.py](file-implementation)|✔️
[Fast File System](http://www.cs.wisc.edu/~remzi/OSTEP/file-ffs.pdf) | Run [ffs.py](file-ffs)|❌
[Crash Consistency and Journaling](http://www.cs.wisc.edu/~remzi/OSTEP/file-journaling.pdf) | Run [fsck.py](file-journaling)|❌
[Log-Structured File Systems](http://www.cs.wisc.edu/~remzi/OSTEP/file-lfs.pdf) | Run [lfs.py](file-lfs)|❌
[Solid-State Disk Drives](http://www.cs.wisc.edu/~remzi/OSTEP/file-ssd.pdf) | Run [ssd.py](file-ssd)|❌
[Data Integrity](http://www.cs.wisc.edu/~remzi/OSTEP/file-integrity.pdf) | Run [checksum.py](file-integrity) and Write some code|❌
[Distributed Intro](http://www.cs.wisc.edu/~remzi/OSTEP/dist-intro.pdf) | Write some code
[NFS](http://www.cs.wisc.edu/~remzi/OSTEP/dist-nfs.pdf) | Write some analysis code
[AFS](http://www.cs.wisc.edu/~remzi/OSTEP/dist-afs.pdf) | Run [afs.py](dist-afs)|✔️


## 辛丑牛年 正月初三 初三 （2021-02-14）周日
## 辛丑牛年 正月初二 初二 （2021-02-13）周六
## 辛丑牛年 正月初一 春节 （2021-02-12）周五
## 庚子鼠年 腊月三十 除夕 （2021-02-11）周四