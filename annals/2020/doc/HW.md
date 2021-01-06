# Home Work

## Target Specification

Q: 什么是 Target Specification  
A：是一个 用来 定义规范 的文件

Q: 干什么用的  
A: 传给编译器、用于指定目标平台体系结构的特定格式

Q: 格式样子  
A: \<arch>\<sub>-\<vendor>-\<sys>-\<abi>

Q: 具体规定了什么  
A:  

```text
arch = cpu的架构, 比如 x86_64, i686, arm, thumb, mips, 等等.

sub = The CPU sub-architecture, for example arm has v7, v7s, v5te, etc. // 没懂

vendor = 厂商, 比如 unknown, apple, pc, nvidia, 等等.

sys = 系统的名字, 比如 linux, windows, darwin, 等等. none 是专门用于没有OS的裸机.

abi = 应用二进制接口, 比如 gnu, android, eabi, 等等.

```

举个例子

```text
{
  "llvm-target": "x86_64-unknown-none",
  "data-layout": "e-m:e-i64:64-f80:128-n8:16:32:64-S128",
  "arch": "x86_64",
  "target-endian": "little",
  "target-pointer-width": "64",
  "target-c-int-width": "32",
  "os": "none",
  "executables": true,
  "linker-flavor": "ld.lld",
  "linker": "rust-lld",
  "panic-strategy": "abort",
  "disable-redzone": true,
  "features": "-mmx,-sse,+soft-float"
}
```

Q: 不用这个json怎么完成这些事情
A: 不知道、一头雾水

----------------------

摸索中 发现了一些东西

> 重要概念一、cross-compiler

知道什么是cross-compiler么  

A: 交叉编译器是在平台A（主机）上运行但为平台B（目标）生成可执行文件的编译器

为什么使用交叉编译器  

A: 除非您在自己的操作系统上进行开发，否则需要使用交叉编译器  

编译器必须知道正确的目标平台（CPU，操作系统）才好

使用
> gcc  -dumpmachine
可查看编译器默认正在为谁创建代码

这个时候是不是有了一丝明悟、搞了半天好像是不知道什么是cross-compiler才对Target Specification没有什么想法、

继续研究一下刚才的问题、我不用那个json、怎么达到想要的效果、

A: 一个朴素的想法、直接把这些参数传给编译器就应该可以了吧、

那么新的问题又来了、

你来说说 刚才说了半天的编译器、到底有什么吧

A: 我也不是很了解历史、但看wiki上说需要 binutils 和 GCC

什么是binutils

A: 在官网上找到 GNU Binutils  
GNU Binutils是二进制工具的集合.  
主要的是：  
ld -GNU链接器  
as -GNU汇编器  
但它们还包括：  
```
addr2line - Converts addresses into filenames and line numbers.
ar - A utility for creating, modifying and extracting from archives.
c++filt - Filter to demangle encoded C++ symbols.
dlltool - Creates files for building and using DLLs.
gold - A new, faster, ELF only linker, still in beta test.
gprof - Displays profiling information.
nlmconv - Converts object code into an NLM.
nm - Lists symbols from object files.
objcopy - Copies and translates object files.
objdump - Displays information from object files.
ranlib - Generates an index to the contents of an archive.
readelf - Displays information from any ELF format object file.
size - Lists the section sizes of an object or archive file.
strings - Lists printable strings from files.
strip - Discards symbols.
windmc - A Windows compatible message compiler.
windres - A compiler for Windows resource files.
```

这样来看就很眼熟了、好像串起来了、

这个问题大概有了轮廓、  

我们为了制作一个OS 首先需要一个交叉编译器  
目的是 它提供 为不同平台编译程序的功能  

那么我们说的Target Specification实际上是规定好 目标平台的一些信息用的、所以当作参数进行传递给到读取这些信息的位置、也可以达到效果、

经过查看 一般实现方式是通过 写在makefile里

make编译时 设置的、 (对于C来说

可能分别要设置、  
GCC  
ld  
as  
一系列东西、估计要做很多查询

参考  
https://wiki.osdev.org/Bare_Bones#Booting_the_Operating_System


补:
```
LLVM
在编译之前我们需要了解以下LLVM的一些参数

Target Triple
使用target triple字符串描述要编译的目标机器语法格式如下

ARCHITECTURE-VENDOR-OPERATING_SYSTEM
ARCHITECTURE-VENDOR-OPERATING_SYSTEM-ENVIRONMENT

这样LLVM在编译的时候会将它传递到后端,以便LLVM为适当的体系结构生成代码

因为我们的程序要在裸机上直接运行,所以就不能使用本机系统的target triple我们可以使用llvm-target=x86_64-unknown-none即可,我们没有指定平台所以我们需要提供其他参数来告诉LLVM如何编译
```
```
Data layout
e-m:e-i64:64-f80:128-n8:16:32:64-S128
```

## 物理地址

分为 I/O 地址 和 内存地址


## 计算机模式

实模式（Real Mode）
保护模式（Protected Mode）
虚拟8086模式（Virtual 8086 Mode）？？？

```text
虚拟8086模式是指利用一种硬件虚拟化技术，在i386的芯片上模拟出多个8086芯片。当处理器进入保护模式后，基于实模式的应用就不能直接运行了，采用虚拟8086模式，则可以让这些实模式的应用运行在基于保护模式的操作系统上，因此这种模式也被称为Virtual Real Mode。
```

Long Mode so-called (IA-32e Mode)  

传统的三种模式则被统称为Legacy Mode
Long Mode又分为2种子模式，分别是64位长模式（64-Bit Mode）和64位兼容模式（Compatibility Mode）。  

### 从Lagacy Mode到Long Mode  

置位EFER寄存器的LME位可以使能long mode。由于long mode要求paging必须开启，所以在进入long mode之前，还需要置位CR0寄存器的PG位。通过设置code segment的L位可在64-Bit Mode和Compatibility Mode之间切换。

### 不同模式下的内存管理

实模式下只有shift-and-add方式的segmentation，没有paging，80286保护模式下只有table-based方式的segmentation，也没有paging。80386及其之后的处理器同时有table-based方式的segmentation和paging，其中paging是可选的。

参考：
https://zhuanlan.zhihu.com/p/69334474

### 控制寄存器

CR0

----------------------------------------
31|30|29|28|27|26|25|24|23|22|21|20|19|18|17|16|15|14|13|12|11|10|9|8|7|6|5|4|3|2|1|0|
--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-|-|-|-|-|-|-|-|-|-|
PG|CD|NW|--|--|--|--|--|--|--|--|--|--|AM|--|WP|--|--|--|--|--|--|-|-|-|-|NE|ET|TS|EM|MP|PE|

31 PG: Paging  |0 不分页 、1 分页  
30 CD: Cache Disable  
0 PE: protection Enable |0实模式 、 1保护模式  

CR2

存放发生页错误时的虚拟地址

CR3

用来存放最高级页目录地址(物理地址），各级页表项中存放的也是物理地址

CR4

----------------------------------------
31|30|29|28|27|26|25|24|23|22|21|20|19|18|17|16|15|14|13|12|11|10|9|8|7|6|5|4|3|2|1|0|
--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-|-|-|-|-|-|-|-|-|-|
--|--|--|--|--|--|--|--|--|--|--|--|--|OSXSAVE|--|--|--|--|--|--|--|OSXMMEXCPT|OSFXSR|PCE|PGE|MCE|PAE|PSE|DE|TSD|PVI|VME|

0 VME Virtual-8086 Mode Extensions (VME) Bit. Bit0. Setting VME to 1 enables hardware-supported

Extended Feature Enable Register (EFER)

----------------------------------------
31|30|29|28|27|26|25|24|23|22|21|20|19|18|17|16|15|14|13|12|11|10|9|8|7|6|5|4|3|2|1|0|
--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-|-|-|-|-|-|-|-|-|-|
--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|FFXSR|LMSLE|SVME|NXE|LMA|-|LME|-|-|-|-|-|-|-|SCE|

8 Long Mode Enable (LME) Bit. Bit 8. LME=1,启用longmode，注意必须先将CR0.PG=0后才能设置LME=1,然后再设置CR0.PG=1，则进入longmode。LME=0 ，使用legacy mode。

参考
https://blog.csdn.net/qq_37414405/article/details/84487591

### GDT&IDT

https://blog.csdn.net/qq_41698827/article/details/103474771


### 内存布局

进程布局

|Stack ↓  
|  
|Memory Mapping Segment ↓  
|  
|Heap ↑  
|  
|BSS Segment  
|Data Segment  
|Text Segment  

text 段包含了当前运行进程的二进制代码  
data 段存储已初始化的全局变量  
bss 段存储未初始化的全局变量  
heap 段存储动态分配的内存中的数据  
stack 段用于保存局部变量和实现函数/过程调用的上下文  
mmap 系统调用映射出来的

64位空间

FFFF_FFFF_FFFF_FFFF
↑
↓
FFFF_8000_0000_0000
Empty
0000_7FFF_FFFF_FFFF 128Ti
↑
↓
0000_0000_0000_0000

32位

FFFF_FFFF
C000_0000 3G
8000_0000 2G
0000_0000

参考
https://zhuanlan.zhihu.com/p/67936075

## 流程

1、上电 0xFFFF0 jump  
2、7c00 加载 bootloader  
3、bootloader 负责模式切换 、加载内核  
4、内核 要准备 栈、页、gdt
