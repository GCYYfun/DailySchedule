# A development of zCore sycall

## 简介

zCore是一个开源操作系统内核、使用Rust语言开发、是微内核架构、目前处于已发布阶段、可参与开发

这是其发布信息(建议阅读)  
https://zhuanlan.zhihu.com/p/137733625 

## 如何参与

目前时间处于2020年7月1日、正值暑假、同时也在如火如荼的展开着暑期OS学习活动、可参与到OS实习、学习相关内容在完成阶段一的学习后、进而参与加入到阶段二的zCore开发

当然如果本身已经对OS领域很熟悉、且对zCore感兴趣、也可直接参考issues提出的一些任务、clone下来进行补充完善、提交PR

那么接下来、简单介绍一下这次的分享、一次关于syscall的开发过程、

## 一次syscall的开发

这次以 syscall 、 process_write_memory、process_read_memory 举例、介绍下开发过程

### 背景介绍

zcore的syscall的开发、参照了fuchsia的zircon的sycall、

使用了相同的syscall约定、目前用的也是zircon的用户测试用例

### Syscall的调用流程

写一个用户程序  //TODO

在用户程序中通过VDOS调用 sycall // TODO 

放入 zCore    // TODO

运行 程序 // TODO

进入内核 // TODO

处理从用户态来的syscall上下文信息函数  // TODO

调用内核的syscall函数 通过上下文指定的系统调用号 来找具体syscall \\TODO

找到 syscall // TODO

执行 // TODO

