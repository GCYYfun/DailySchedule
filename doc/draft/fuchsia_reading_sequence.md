# 阅读指南

大家好这里是GCYY 、

为了便于以后同学快速接入参与到OS学习开发中来、

这里 提供一份 阅读顺序 参考、帮助理清顺序

## 第一步 知道内核

https://fuchsia.dev/fuchsia-src/concepts/kernel/concepts

Zircon是支持Fuchsia OS的核心平台

Zircon由微内核（/ zircon / kernel中的源

以及一小部分用户空间服务，驱动程序和库（/ zircon / system /中的源

由系统启动，与硬件对话，加载用户空间进程和运行它们，等等。Fuchsia在此基础上构建了一个更大的OS


Zircon内核提供系统调用来管理进程，线程，虚拟内存，进程间通信，等待对象状态更改和锁定（通过futex）。

## 第二部 zircon 概念

内核管理许多不同类型的对象。那些可以通过系统调用直接访问的是实现Dispatcher接口的C ++类。

这些是在kernel / object中实现的 

### Syscall 

用户空间代码通过系统调用（几乎全部通过Handles）与内核对象进行交互

系统调用由libzircon.so提供


### Handler and Right

### Kernel Object ID

内核中的每个对象都有一个“内核对象ID”或“ koid”。它是一个64位无符号整数，可用于标识对象，并且在运行系统的生命周期内是唯一的。特别是，这意味着永远不会重复使用koid

### Running Code: Jobs, Processes, and Threads.

### Message Passing: Sockets and Channels


### Objects and Signals

线程可以zx_object_wait_one() 用来等待单个句柄上的信号处于活动状态或 zx_object_wait_many()等待多个句柄上的信号。这两个调用都允许超时，即使没有信号挂起，它们也会在超时后返回。

如果线程要等待大量的句柄，则使用端口更为有效，该端口是其他对象可能绑定的对象，因此当在其上声明信号时，端口会接收包含信息的数据包关于待处理的信号。

### Events, Event Pairs.

### Shared Memory: Virtual Memory Objects (VMOs)

虚拟内存对象代表一组物理内存页面或潜在 的页面（将按需延迟创建/填充）


### Address Space Management


### Futexes