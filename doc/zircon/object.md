# Object

Zircon是基于对象的内核。用户模式代码几乎完全通过对象句柄与OS资源交互。可以将句柄视为具有特定OS子系统的活动会话，该子系统的作用域是特定资源。

Zircon积极管理以下资源：

处理器时间
内存和地址空间
设备IO内存
打断
信号和等待

processor time
memory and address spaces
device-io memory
interrupts
signaling and waiting

## Kernel objects for applications
###  IPC 

Channel

```
通道-双向进程间通信

通道是消息的双向传输，包含一定数量的字节数据和一定数量的句柄。



调用使zx_channel_write()一条消息入队，而调用使 zx_channel_read()一条消息出队（如果有排队）

一个线程可以通过zx_object_wait_one()或其他等待机制阻塞到消息待定。

zx_channel_call()在信道的一个方向上使消息入队的呼叫，等待相应的响应，并且使响应消息出队
```

Socket
```
套接字-双向流IPC传输

套接字是双向流传输。与通道不同，套接字只能移动数据（而不是句柄）。

数据通过写入套接字的一端，zx_socket_write()并从的另一端读取zx_socket_read()。

创建后，套接字的两端都是可写和可读的。通过 ZX_SOCKET_SHUTDOWN_READ和ZX_SOCKET_SHUTDOWN_WRITE选项 zx_socket_shutdown()，可以关闭套接字的一端以进行读取和/或写入。
```
FIFO

```
FIFO-先进先出进程间队列

FIFO旨在用作共享内存传输的控制平面。它们的读写操作比套接字或通道更有效 ，但是对元素和缓冲区的大小有严格的限制。
```

### Tasks

Process

```
zircon处理是传统意义上程序的一个实例：一组指令，这些指令将由一个或多个线程执行，并带有一组资源。

流程对象是以下资源的容器：

handle
Virtual Memory Address Regions
Threads 

通常，它与正在执行的代码相关联，直到被强制终止或程序退出为止。

进程归作业所有，从资源和权限限制以及生命周期控制的角度来看，允许将由多个进程组成的应用程序视为一个实体。


zx_process_create() -在工作中创建新进程
zx_process_read_memory() -从指定进程的地址空间读取
zx_process_start() -使新进程开始执行
zx_process_write_memory() -写入指定进程的地址空间
zx_process_exit() -退出当前流程


zx_job_create() -在上级工作中创建新工作


zx_task_create_exception_channel() -监听任务异常


zx_vmar_map() -将内存映射到地址空间范围
zx_vmar_protect() -更改地址空间范围上的权限
zx_vmar_unmap() -从地址空间范围取消映射内存
```
Thread
```
线程-可运行/计算实体

线程对象是代表分时CPU执行上下文的构造。线程对象与特定的进程对象关联，该特定的 进程对象为I / O和计算所需的其他对象提供内存和句柄。

线程是通过调用创建的zx_thread_create()，但只有在zx_thread_start()或被调用时才开始执行zx_process_start()。两个系统调用都将要执行的初始例程的入口点作为参数。

传递给的线程zx_process_start()应该是开始在进程上执行的第一个线程。

线程终止执行：

1.通过调用 zx_thread_exit()
2.通过调用 zx_vmar_unmap_handle_close_thread_exit()
3.通过调用 zx_futex_wake_handle_close_thread_exit()
4.父进程终止时
5.通过zx_task_kill()使用线程的句柄进行调用
在生成没有处理程序或处理程序决定终止线程的异常之后。

zx_thread_create() -在进程中创建新线程
zx_thread_exit() -退出当前线程
zx_thread_read_state() -从线程读取寄存器状态
zx_thread_start() -导致新线程开始执行
zx_thread_write_state() -修改线程的寄存器状态
zx_task_create_exception_channel() -监听任务异常
zx_task_kill() -导致任务停止运行
```
Job

```
job-控制一组流程

job 是 一组 进程 ，可能 还有其他 子 job 。 job 用于 跟踪 执行内核 操作 的 的 特权 （即使用各种选项进行各种syscall），并跟踪和限制基本资源（例如内存，CPU）的消耗 。



zx_job_create() -创建新的子job。
zx_job_set_critical() -将进程设置为对job至关重要。
zx_job_set_policy() -为job中的新进程设置策略。
zx_process_create() -在工作中创建新进程。
zx_task_create_exception_channel() -监听任务异常
zx_task_kill() -使任务停止运行。
```
Task

```text
任务-内核对象（线程，进程和作业）的“可运行”子类

线程，进程和作业对象都是任务。他们具有被暂停，恢复和杀死的能力。


zx_task_create_exception_channel() -监听任务异常
zx_task_kill() -导致任务停止运行

```

### Scheduling

Profile

```

```

### Signaling

Event

Event Pair

Futex

### Memory and address space

Virual Memory Object

Virual Memory Address Region

bus_transaction_initiator

Pager

###  Waiting

Port

Timer

## Kernel objects for applications

Interrupts
    Message Signaled Interrupts

Resource

Debuglog