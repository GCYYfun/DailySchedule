# zircon 系统调用

## Handles
handle_close-关闭一个句柄
handle_close_many-关闭多个句柄
handle_duplicate-创建重复的句柄（可选地，减少权限）
handle_replace-创建一个新的句柄（可选地，减少权限）并销毁旧的句柄
## Objects
object_get_child-通过对象的对象找到子对象
object_get_info-获取有关对象的信息·
object_get_property-读取对象属性·
object_set_profile-将配置文件应用于线程 *
object_set_property-修改对象属性·
object_signal-设置或清除对象上的用户信号·
object_signal_peer-设置或清除另一端的用户信号·
object_wait_many-等待多个对象上的信号·
object_wait_one-等待一个对象上的信号·
object_wait_async-信号更改的异步通知·
## Threads
thread_create-在进程中创建新线程
thread_exit-退出当前线程
thread_read_state-从线程读取寄存器状态
thread_start-导致新线程开始执行
thread_write_state-修改线程的寄存器状态
## Processes
process_create-在作业中创建新流程
process_read_memory-从进程的地址空间读取
process_start-使新进程开始执行
process_write_memory-写入进程的地址空间
process_exit-退出当前进程
## Jobs
job_create-在工作中创建新工作
job_set_critical-将流程设置为对作业至关重要
job_set_policy-修改作业及其后代的策略
## Tasks (Thread, Process, or Job)
task_create_exception_channel-在任务上创建异常通道
task_kill-导致任务停止运行
task_suspend-导致任务被挂起
## Profiles
profile_create-创建一个新的配置文件对象
## Exceptions
exception_get_thread-为异常线程创建一个句柄
exception_get_process-为异常进程创建一个句柄
## Channels
channel_call-同步发送消息并接收回复
channel_call_etc-同步发送消息并接收带有句柄信息的回复
channel_create-创建一个新频道
channel_read-接收来自频道的消息
channel_read_etc-从通道接收带有句柄信息的消息
channel_write-将消息写入通道
channel_write_etc-将消息写入通道并修改句柄
## Sockets
socket_create-创建一个新的套接字
socket_read-从套接字读取数据
socket_shutdown-防止读写
socket_write-将数据写入套接字
## Stream
zx_stream_create() -从VMO创建流
zx_stream_readv() -以当前寻道偏移量从流中读取数据
zx_stream_readv_at() -以给定的偏移量从流中读取数据
zx_stream_writev() -以当前寻道偏移量将数据写入流
zx_stream_writev_at() -以给定的偏移量将数据写入流
zx_stream_seek() -修改流的当前寻道偏移量
## Fifos
fifo_create-创建一个新的fifo
fifo_read-从fifo读取数据
fifo_write-将数据写入fifo
## Events and Event Pairs
event_create-创建一个事件
eventpair_create-创建一对关联的事件
system_get_event-检索系统事件的句柄
## Ports
port_create-创建一个端口
port_queue-将数据包发送到端口
port_wait-等待数据包到达端口
port_cancel-从async_wait取消通知
## Futexes
futex_wait-等待一个futex
futex_wake-在futex上唤醒服务员
futex_requeue-唤醒一些服务员并重新排队其他服务员
## Virtual Memory Objects (VMOs)
vmo_create-创建一个新的vmo
vmo_read-从vmo读取
vmo_write-写入vmo
vmo_create_child-创建vmo的子级
vmo_get_size-获取vmo的大小
vmo_set_size-调整vmo的大小
vmo_op_range-在vmo的范围上执行操作
vmo_replace_as_executable-向vmo添加执行权限
vmo_create_physical-创建一个VM对象，该对象引用物理内存的特定连续范围
vmo_set_cache_policy-为VMO保留的页面设置缓存策略
## Virtual Memory Address Regions (VMARs)
vmar_allocate-创建一个新的子VMAR
vmar_map-将VMO映射到进程
vmar_unmap-从进程取消映射内存区域
vmar_protect-调整内存访问权限
vmar_op_range-对映射到VMAR范围中的VMO执行操作
vmar_destroy-销毁VMAR及其所有子项
## Userspace Pagers
pager_create-创建一个新的寻呼机对象
pager_create_vmo-创建一个寻呼机拥有的vmo
pager_detach_vmo-从vmo分离寻呼机
pager_supply_pages-将页面供应到寻呼机拥有的vmo中
pager_op_range-对具有寻呼机的vmo的范围执行操作
## Cryptographically Secure RNG
cprng_add_entropy
cprng_draw
## Time
nanosleep-睡眠数纳秒
clock_get-读取系统时钟
clock_get_monotonic-读取单调系统时钟
ticks_get-读取高精度计时器刻度
ticks_per_second-每秒读取高精度计时器的刻度数
deadline_after -将相对于现在的时间转换为绝对期限
clock_adjust
## Timers
timer_create-创建一个计时器对象
timer_set-启动计时器
timer_cancel-取消计时器
## Hypervisor guests
guest_create-创建虚拟机监控程序来宾
guest_set_trap-在虚拟机管理程序来宾中设置陷阱
## Virtual CPUs
vcpu_create-创建一个虚拟cpu
vcpu_resume-恢复执行虚拟cpu
vcpu_interrupt-在虚拟cpu上引发中断
vcpu_read_state-从虚拟cpu读取状态
vcpu_write_state-将状态写入虚拟cpu
interrupt_bind_vcpu-将中断对象绑定到VCPU
## Global system information
system_get_dcache_line_size
system_get_features-获取特定于硬件的功能
system_get_num_cpus-获取CPU数量
system_get_physmem-获取物理内存大小
system_get_version_string-获取版本字符串
## Debug Logging
debuglog_create-创建内核管理的debuglog读取器或写入器
debuglog_write-将日志条目写入debuglog
debuglog_read-从debuglog读取日志条目
debug_read-待办事项（fxbug.dev/32938）
debug_write -TODO（fxbug.dev/32938）
debug_send_command -TODO（fxbug.dev/32938）
## Multi-function
vmar_unmap_handle_close_thread_exit-三合一
futex_wake_handle_close_thread_exit-三合一
## System
system_mexec-使用新的内核和引导映像软重启系统
system_mexec_payload_get-返回一个ZBI，其中包含启动该系统所需的ZBI条目
system_powerctl
## DDK
bti_create-创建一个新的总线事务启动器
bti_pin-固定页面并授予设备访问权限
bti_release_quarantine-释放所有隔离的PMT
cache_flush-刷新CPU数据和/或指令缓存
interrupt_ack-确认中断对象
interrupt_bind-将中断对象绑定到端口
interrupt_create-创建物理或虚拟中断对象
interrupt_destroy-销毁中断对象
interrupt_trigger-触发虚拟中断对象
interrupt_wait-等待中断对象
iommu_create-在内核中创建一个新的IOMMU对象
pmt_unpin-取消固定页面并撤消设备对其的访问
resource_create-创建资源对象
smc_call-从用户空间进行SMC呼叫
## Display drivers
framebuffer_get_info
framebugger_set_range
## Tracing
ktrace_control
ktrace_read
ktrace_write
mtrace_control
## Others/Work in progress
ioports_release

pc_firmware_tables

pci_add_subtract_io_range

pci_cfg_pio_rw

pci_config_read

pci_config_write

pci_enable_bus_master

pci_get_bar

pci_get_nth_device

pci_init

pci_map_interrupt

pci_query_irq_mode

pci_reset_device

pci_set_irq_mode

syscall_test_0

syscall_test_1

syscall_test_2

syscall_test_3

syscall_test_4

syscall_test_5

syscall_test_6

syscall_test_7

syscall_test_8

syscall_test_wrapper

syscall_test_handle_create

系统调用生成
Syscall支持由生成//zircon/syscalls。首先运行该目录中的FIDL文件fidlc，生成中间格式。这种中间格式被kazoo占用，后者以多种语言为内核和用户空间生成输出。此输出包括用于内核和用户空间的C或C ++头，系统调用入口点，其他语言绑定，等等。

该工具作为构建的一部分被调用，而不是检查其输出。