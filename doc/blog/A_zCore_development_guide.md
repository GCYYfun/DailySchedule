# A_zCore_participating_guide

## 如何开始 参与到 zcore 的活动 中来


如果 你对 zcore 感兴趣 并且 想 参与 到 zcore 的 活动 中来 继续 寻找 乐趣 , 那么 这里 可以 提供 一些 帮助.

首先 你需要 拥有 一些 准备 环境 , 比如 你的 系统 最好是 linux系、会 方便 一些 、举例 系统 为 ubuntu 20.04 、wsl2 也可以  

其次 你需要 安装 有 git 和 git-lfs ， 这样 就可以获取 到 zcore 的 代码了

参照 在 zcore 项目 https://github.com/rcore-os/zCore  中 的 README.md  Getting started 小节 有详细 说明

这里 简要 说明一下 ， 要运行 zcore 需要 安装 rust  语言 、因为 rust 开发的 ， 需要qemu 模拟器、因为是 基于 qemu 运行 的 ， 这时 只要 参照 文档 clone  下来 就基本 可运行

目前 有 几种 运行 方式 ： 

基于 用户态 运行 的 方式 

linux syscall 实现
```
cargo run --release -p linux-loader /bin/busybox [args]
```
zircon syscall 实现
```
cargo run --release -p zircon-loader prebuilt/zircon/x64
```

基于 qemu 运行 的 方式

linux syscall 实现
```
make image
cd zCore && make run mode=release linux=1 [graphic=on] [accel=1]
```

zircon syscall 实现
```
cd zCore && make run mode=release [graphic=on] [accel=1]
```


这就 可以 运行起来 这个 项目 到 shell 阶段

参与 工作 也是 从 这里 开始的 

我们大致 可以 把 项目 分为 两部分

os 的 对外 接口 的 改进完善 、也就是 os 与 用户态交互的 syscall 部分、

os 内部各功能的 开发实现、内核里的各个模块 添加改进与完善

开始 还是 从 接口部分 入手 会是 一个比较 平滑的 过渡



## 如何 参与 syscall

首先 要 知道 目前 是 什么 情况了

zcore 中 有 两套 syscall 一个 是 linux的 一个 是 zircon 的

先说 zircon 的 

一共 有 154 个 syscall

按 zircon 的 object 区分

| syscall type | count |
|--|--|
| Handles | 4 |
| Objects | 10 |
| Threads | 5 |
| Processes | 5 |
| Jobs | 3 |
| Tasks | 3 |
| Profiles | 1 |
| Exceptions | 2 |
| Channels | 7 |
| Sockets | 4 |
| Stream | 6 |
| Fifos | 3 |
| Events and Event Pairs | 3 |
| Ports | 4 |
| Futexes | 3 |
| Virtual Memory Objects (VMOs) | 10 |
| Virtual Memory Address Regions (VMARs) | 6 |
| Userspace Pagers | 5 |
| Cryptographically Secure RNG | 2 |
| Time | 7 |
| Timers | 3 |
| Hypervisor guests | 2 |
| Virtual CPUs | 6 |
| Global system information | 5 |
| Debug Logging | 6 |
| Multi-function | 2 |
| System | 3 |
| DDK | 14 |
| Display drivers | 2 |
| Tracing | 4 |
| Others/Work in progress | 14 |

共 31个 对象

- 100% Finished （已经完成） = 61  
- XX%  0<XX<100% (部分完成/不完善) = 56
- 0%  （完全没做）= 37

完全 没有 实现的 如下 所示

```
    // 1 Handles 4/4

    // 2 Objects 9/10
 
    Sys::OBJECT_SET_PROFILE => unimplemented!("object_set_property"),


    // 3 Threads 5/5

    // 4 Processes 5/5


    // 5 Jobs 3/3
 
    // 6 Tasks (Thread, Process, or Job) 3/3

    // 7 Profiles 0/1
    Sys::PROFILE_CREATE => unimplemented!("profile_create"),

    // 8 Exceptions 2/2


    // 9 Channels 5/7
    Sys::CHANNEL_CALL => unimplemented!("channel_call")
    Sys::CHANNEL_CALL_ETC => unimplemented!("channel_call_ETC")


    // 10 Sockets 4/4


    // 11 Stream 6/6


    // 12 Fifos 3/3

    // 13 Events and Event Pairs 3/3


    // 14 Ports 3/4
    Sys::PORT_CANCEL => {
        error!("Skip PORT_CANCEL");
        Ok(())
    }

    // 15 Futexes 4/3



    // 16 Virtual Memory Objects (VMOs) 11/10

    // 17 Virtual Memory Address Regions (VMARs) 5/6

    Sys::VMAR_OP_RANGE => unimplemented!("vmar_op_range"),


    // 18 Userspace Pagers 0/5
    Sys::PAGER_CREATE => unimplemented!("pager_create"),
    Sys::PAGER_CREATE_VMO => unimplemented!("pager_create_vmo"),
    Sys::PAGER_DETACH_VMO => unimplemented!("pager_detach_vmo"),
    Sys::PAGER_SUPPLY_PAGES => unimplemented!("pager_supply_pages"),
    Sys::PAGER_OP_RANGE => unimplemented!("pager_op_range"),

    // 19 Cryptographically Secure RNG 0/2
    Sys::CPRNG_ADD_ENTROPY => unimplemented!("cprng_add_entropy"),
    Sys::CPRNG_DRAW => unimplemented!("cprng_draw")

    // 20 Time 0/7

    Sys::CLOCK_GET_MONOTONIC => unimplemented!("clock_get_monotonic"),
    Sys::TICKS_GET => unimplemented!("ticks_get"),
    Sys::TICKS_PER_SECOND => unimplemented!("ticks_per_second"),
    Sys::DEADLINE_AFTER => unimplemented!("deadline_after"),


    // 21 Timers 3/3

    // 22 Hypervisor guests 2/2


    // 23 Virtual CPUs 5/6

    Sys::INTERRUPT_BIND_VCPU => unimplemented!("interrupt_bind_vcpu"), 

    // 24 Global system information 0/5
    Sys::SYSTEM_GET_DCACHE_LINE_SIZE => unimplemented!("system_get_dcache_line_size"),
    Sys::SYSTEM_GET_FEATURES => unimplemented!("system_get_features"),
    Sys::SYSTEM_GET_NUM_CPUS => unimplemented!("system_get_num_cpus"),
    Sys::SYSTEM_GET_PHYSMEM => unimplemented!("system_get_physmem"),
    Sys::SYSTEM_GET_VERSION_STRING => unimplemented!("system_get_version_string"),

    // 25 Debug Logging 5/6

    Sys::DEBUG_SEND_COMMAND => unimplemented!("debug_send_command"),

    // 26 Multi-function 2/2


    // 27 System 0/3
    Sys::SYSTEM_MEXEC => unimplemented!("system_mexec"),
    Sys::SYSTEM_MEXEC_PAYLOAD_GET => unimplemented!("system_mexec_payload_get"),
    Sys::SYSTEM_POWERCTL => unimplemented!("system_powerctl"),

    // 28 DDK 13/14
    Sys::CACHE_FLUSH => unimplemented!("cache_flush"),


    Sys::SMC_CALL => unimplemented!("smc_call"),

    // 29 Display drivers
    Sys::FRAMEBUFFER_GET_INFO => unimplemented!("framebuffer_get_info"),
    Sys::FRAMEBUFFER_SET_RANGE => unimplemented!("framebugger_set_range"),

    // 30 Tracing
    Sys::KTRACE_READ => unimplemented!("ktrace_control"),
    Sys::KTRACE_CONTROL => unimplemented!("ktrace_read"),
    Sys::KTRACE_WRITE => unimplemented!("ktrace_write"),
    Sys::MTRACE_CONTROL => unimplemented!("mtrace_control"),

    // 31 Others/Work in progress  2/14
    Sys::IOPORTS_RELEASE => unimplemented!("ioports_release"),
    Sys::PCI_RESET_DEVICE => unimplemented!("pci_reset_device"),
```

