# DailySchedule

目录  

[Day 0](#Day0)  
[Day 1](#Day1)

<span id="Day0"></span>
## Day 0

### 事件1： 沟通获取项目信息

信息内容：  
hypervisor方向，目的是准备在rcore上实现一个简单的type2的hypervisor，参考的是zcore中的实现  
https://github.com/PanQL/zircon/blob/master/docs/syscalls.md#hypervisor-guests  

syscall方向，目的是补全syscall，让fuchsia的用户态应用在上面启动，具体的参考zCore那个仓库里面的wiki和代码  
https://github.com/rcore-os/zCore/wiki/Status:-Syscalls   

### 事件2：浏览文档

经过查看，第一个文档是Zircon System Calls的详细说明、第二个文档是zcore待补全的syscall的列表  

### 问题：

尚不清楚、实现hypervisor和补全syscall的具体思路与做法、

### 预计计划：  

1、再次沟通了解实现思路与具体做法、所需背景知识、  
2、开发环境搭建与准备、  
3、沟通了解zcore整体结构、  

<span id="Day1"></span>
## Day 1 （2020-04-10）


### 事件1： 沟通hypervisor实现流程

沟通后、因为对这方面没有太多知识储备支撑、建议先参考https://www.cs.unc.edu/~porter/courses/comp790/s17/labs.html 一个小型的hypervisor构建过程进行理解学习、

### 事件2: 科学上网、浏览Fuchsia文档结构

根据理解、在zcore上补全syscall的工作、似乎是参照zircon进行的、所以需要理解zircon的内容和运作、

