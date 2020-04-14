# DailySchedule

目录  

[Day 0](#Day0)  
[Day 1   (2020-04-10)](#Day1)   
[Day 2   (2020-04-11)](#Day2)   
[Day 3   (2020-04-12)](#Day3)  
[Day 4   (2020-04-13)](#Day4)  
[Day 5   (2020-04-14)](#Day5)  

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

这样大概就有一个简单和能跑的hypervisor、以上内容仅有读实验指导书得出的大概理解、没有对代码由过多深入理解、感觉理解程度仅有20%、

### 问题

1、知道hypervisor大致流程后、对代码目前还毫无头绪、同时对于zircon的hypervisor的实现不清楚、  
2、今天时间不够、没能具体的看zircon内容、对zircon还是模糊的    

### 计划

1、通过今天的理解、明天进行一次沟通、印证流程正确与否、  
2、尝试找到zircon的对应部分、去查看代码实现、是否也是这个流程、  
3、进一步阅读zircon的官方文档、  


<span id="Day2"></span>
## Day 2 （2020-04-11）

由于周末觉得叨扰别人不适合、计划调整为补充背景知识

### 事件1：通过aos视频再次理解学习Hypervisor

经过这两天的整理的信息、再次看一遍视频、有了一些新的理解、对hypervisor概念和做法有了初步认识、 

### 事件2：查看zircon的文档、

通过科学上网进入 https://fuchsia.dev/fuchsia-src/concepts/kernel 阅读文档、试图理解zircon都说的什么、怎么组成的、结构是什么样的、发现很多概念不清楚、有很多东西不知道作用、需要反复阅读与查阅资料补充、目前还没有系统的认识、

### 问题

1、无法很快的理解zircon、准备持续一小段时间看看结果、  
2、因为还没摸清zircon的结构、也没能很好的找到zircon实现hypervisor部分代码逻辑、  

### 计划

1、继续在学下zircon的文档、搞清楚个大概、理解下怎么运行、  
2、准备周一在沟通交流下、   

<span id="Day3"></span>
## Day 3 （2020-04-12）

Errr..今天处理了一些杂事、没能正经营业、接下来要抓紧时间了、  

<span id="Day4"></span>
## Day 4 （2020-04-13）周一

### 事件1：继续学习hypervisor

再次参考https://www.cs.unc.edu/~porter/courses/comp790/s17/labs.html 一个小型的hypervisor构建过程、结合代码理解hypervisor、并制作一个简单流程图帮助理解、  
![启动VMM流程图](https://github.com/GCYYfun/DailySchedule/blob/master/VMM%E5%90%AF%E5%8A%A8%E6%B5%81%E7%A8%8B%E5%9B%BE.png?raw=true)

理解vmcs的作用及需要设置的大概内容、艰难阅读intel手册、效率不够理想、对此感到沮丧、

### 事件2：继续学习理解zircon

阅读了关于zircon、kernel部分的概念、对zircon大概有了一个认知、并确认了体量很大、还有对很多内容理解不到位、认为这个方法不有效、决定找rj取取经、加快对zircon的学习、


### 问题

1、对hypervisor大体认识有了、细节不够、包括很多intel手册内容、也不清楚、   
2、又看了zircon的结构、还是不能清晰代码逻辑、知道中间缺着一些内容、但具体什么不清楚、需要一点一点查、  

### 计划

1、找rj交流下zircon的内容、  
2、在对zircon有了一定认识后在去交流hypervisor、syscall、  


<span id="Day5"></span>
## Day 5 （2020-04-14）周二

### 评估后新短期计划

预计时间: 两个星期  

预计内容: 
```
   1、Blog OS 
   2、rCore_tutorial
   3、hypervisor lab
   4、zcore 
```
时间分配:  
1、重新温习熟悉Blog os内容 （3天）  
2、重新温习掌握rcore_tutorial内容 （4天）  
3、理解尝试完成hypervisor lab（3天）  
4、run起zcore、并理解项目 （4天）  

预计十四天左右、上下浮动不应超过太多、要求保质保量、稳步进行、
