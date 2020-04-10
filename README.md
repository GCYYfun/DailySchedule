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

### 事件3：看unc实验指导、试图理解在实现hypervisors的流程

#### 理解：

在一个正常运行的操作系统上、试图开启虚拟化、是由一个在用户态下的程序启动的、这个程序通过调用syscall、来实现在电脑上的分配空间、装载新的操作系统、这个系统通称叫guest、

##### 简要实现流程：  

Step1：实现对CPU支持vmx和扩展分页的检测，了解如何发现CPU是否支持vmx和扩展分页、用以知道是否可虚拟化、  

Step2：通过syscall创建guest、然后把guest的bootloder和kernel复制到guest的物理地址空间中  

Step3：实现vmlaunch和vmresume、用以来启动VM、  

Step4：这时guest可以成功进入运行、但还不可以处理中断、要添加guest的处理中断功能、叫做VM exits、与发出系统调用（例如，使用 int 或 syscall 指令）类似，guest可以使用 vmcall 指令（有时称为hypercalls）以编程方式捕获到host  

Step5：在VM中仅使用vmcall来请求“伪”内存映射、完成实现handle_cpuid  

Step6：当执行I/O时也应补充上I/O的vmcall

这样大概就有一个简单能跑的和hypervisor、以上内容仅有读实验指导书得出的大概理解、没有对代码由过多深入理解、感觉理解程度仅有20%、

### 问题

1、知道hypervisor大致流程后、对代码目前还毫无头绪、同时对于zircon的hypervisor的实现不清楚、  
2、今天时间不够、没能具体的看zircon内容、对zircon还是模糊的    

### 计划

1、通过今天的理解、明天进行一次沟通、印证流程正确与否、  
2、尝试找到zircon的对应部分、去查看代码实现、是否也是这个流程、  
3、进一步阅读zircon的官方文档、  



