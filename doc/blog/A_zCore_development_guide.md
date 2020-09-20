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

### zircon syscall 的  情况

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

- 100% Finished （已经完成） = 61 ++  (不完全统计)
- XX%  0<XX<100% (部分完成/不完善) = 56 -- (不完全统计)
- 0%  （完全没做）= 37       (完全统计)

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

测试 用例 情况 统计 

目前大约 有 290 和 测试 用例 没有 通过 [错误log信息](info.txt)


问题 出现 在 有的 syscall 没有实现

或者 有的 topic 没有定义

或者 实现 有些 边界 没有 catch 

其中 内存 和 进程 部分  占有 100 个左右

剩下 的 其他 功能 占有 60左右

get info 有 38 个 左右

pager 92个 

```
unimplemented 111 

unimplemented: PAGER_CREATE 82 + 

unimplemented: PROFILE_CREATE 19 +

unimplemented: IOPORTS_RELEASE 3

unimplemented: VMAR_OP_RANGE 6

unimplemented: COUNT ？？？？ 


pager 92

getinfo 38 zircon/system/utest/core/object-info


topic  10

// 内存 42

VmoTestCase 13 

VmoClone2TestCase 3

VmoSliceTestCase 1

vmar 22 

MemoryMappingTest 3


// 进程 57

ProcessTest 15

Threads 20

ThreadGetInfoTest 8

JobTest 14


// port 7

PortTest 5   PORT_CANCEL

PortStressTest 2 PORT_CANCEL


// 杂七杂八 51

PROFILE_CREATE 19

systemEvent 9

SocketTest 2

resource 11

BadAccessTest 4

DefaultExceptionHandlerTest 1

HandleCloseTest.ManyDuplicateTest  1

SyncMutex.NoRecursion  1

Bti 2 
```

这些 信息 要怎么 使用 报错 信息 来帮助 开发

参见 [fix](A_core_test_fix_introduction.md)


补全 改进 syscall 是 有 一定 套路 但是 更 具体的 需要 对 那个 object 有一些 了解 、建议 根据 object 选择 一些 syscall 进行 完善

比如 SocketTest 就属于 socket object 而且只有两个 、看起来 应该 比较容易 上手 

可以 切片式的 去 看下 那个 object 进而 查找问题

那...举个例子 就去看下 这个 socket

```

197 ============================== SocketTest.ReadIntoBadBuffer ==============================
[ RUN      ] SocketTest.ReadIntoBadBuffer
../../zircon/system/utest/core/socket/socket.cc:715: Failure: Expected zx::vmar::root_self()->map(0, vmo, 0, kSize, 0, &addr) is ZX_OK. 
    Expected: ZX_OK
    Which is: ZX_OK(0)
    Actual  : zx::vmar::root_self()->map(0, vmo, 0, kSize, 0, &addr)
    Which is: ZX_ERR_INVALID_ARGS(-10)
[  FAILED  ] SocketTest.ReadIntoBadBuffer (2 ms)
============================== End ==============================


198 ============================== SocketTest.WriteFromBadBuffer ==============================
[ RUN      ] SocketTest.WriteFromBadBuffer
../../zircon/system/utest/core/socket/socket.cc:750: Failure: Expected zx::vmar::root_self()->map(0, vmo, 0, kSize, 0, &addr) is ZX_OK. 
    Expected: ZX_OK
    Which is: ZX_OK(0)
    Actual  : zx::vmar::root_self()->map(0, vmo, 0, kSize, 0, &addr)
    Which is: ZX_ERR_INVALID_ARGS(-10)
[  FAILED  ] SocketTest.WriteFromBadBuffer (3 ms)
============================== End ==============================
```

啊 、看到 这个 报错 信息 发现 好像 跟 socket 没什么 关系、像是 vmar map 的 问题

根据提示 去 到 fuchsia 代码里 看看这两行

方便起见 我把 fuchsia 的 代码 展示再这里


```
703    TEST(SocketTest, ReadIntoBadBuffer) {
704      zx::socket a, b;
705      ASSERT_OK(zx::socket::create(0, &a, &b));
706
707      ASSERT_OK(a.write(0, "A", 1, nullptr));
708      constexpr size_t kSize = 4096;
709      zx::vmo vmo;
710      ASSERT_OK(zx::vmo::create(kSize, 0, &vmo));
711    
712      zx_vaddr_t addr;
713    
714      // Note, no options means the buffer is not writable.
715      ASSERT_OK(zx::vmar::root_self()->map(0, vmo, 0, kSize, 0, &addr));
716    
717      size_t actual = 99;
718      void* buffer = reinterpret_cast<void*>(addr);
719      ASSERT_NE(nullptr, buffer);
720    
721      // Will fail because buffer points at memory that isn't writable.
722      EXPECT_EQ(ZX_ERR_INVALID_ARGS, b.read(0, buffer, 1, &actual));
723    
724      // See that it's unmodified.
725      //
726      // N.B. this test is actually stricter than what is promised by the interface.  The contract
727      // does not explicitly promise that |actual| is unmodified on error.  If you find that this test
728      // has failed, it does not necessarily indicate a bug.
729      EXPECT_EQ(99, actual);
730    }





739    TEST(SocketTest, WriteFromBadBuffer) {
740      zx::socket a, b;
741      ASSERT_OK(zx::socket::create(0, &a, &b));
742
743      constexpr size_t kSize = 4096;
744      zx::vmo vmo;
745      ASSERT_OK(zx::vmo::create(kSize, 0, &vmo));
746
747      zx_vaddr_t addr;
748
749      // Note, no options means the buffer is not readable.
750      ASSERT_OK(zx::vmar::root_self()->map(0, vmo, 0, kSize, 0, &addr));
751
752      void* buffer = reinterpret_cast<void*>(addr);
753      ASSERT_NE(nullptr, buffer);
754
755      // Will fail because buffer points at memory that isn't readable.
756      size_t actual;
757      EXPECT_EQ(ZX_ERR_INVALID_ARGS, b.write(0, buffer, 1, &actual));
758        }
```

找到 715 和 750 

如下

```
715    // Note, no options means the buffer is not writable.
  ASSERT_OK(zx::vmar::root_self()->map(0, vmo, 0, kSize, 0, &addr));

750    // Note, no options means the buffer is not readable.
  ASSERT_OK(zx::vmar::root_self()->map(0, vmo, 0, kSize, 0, &addr));
```

看来 跟这个 测试 名字 一样 就是对 读写 的一些 边界 条件 作 测试 最后 验证 socket 是否能正常读写

这里是 不给 读写 权限 看看 是否 可以 通过

再接下来 就是 深入 的 去看 zcore的源代码 、也可找fuchsia C++ 代码作参考、

需要 对 socket 和 vmar 有一些 了解 、更便于开发

那我们 顺便 在 来看下  Socket 这个 对象

```
Socket
NAME
Socket - Bidirectional streaming IPC transport

SYNOPSIS
Sockets are a bidirectional stream transport. Unlike channels, sockets only move data (not handles).

DESCRIPTION
Data is written into one end of a socket via zx_socket_write() and read from the opposing end via zx_socket_read().

Upon creation, both ends of the socket are writable and readable. Via the ZX_SOCKET_SHUTDOWN_READ and ZX_SOCKET_SHUTDOWN_WRITE options to zx_socket_shutdown(), one end of the socket can be closed for reading and/or writing.


Socket
名称
Socket-双向流IPC传输

概要
Socket是双向流传输。与channels不同，socket只能移动数据（而不移动handles）。

描述
数据通过zx_socket_write()被写入socket的一端，并从的另一端用zx_socket_read()读取。

创建后，socket的两端都是可写和可读的。zx_socket_shutdown() 通过用 ZX_SOCKET_SHUTDOWN_READ和ZX_SOCKET_SHUTDOWN_WRITE选项 ，来控制Socket关闭和打开一端的读取和写入。


```

根据 object 的 意思 看zcore 实现、补充完善syscll、

在这个测试用例 里 也 涉及到 socket 读写的syscall 

可以 查阅   socket_read 具体 定义  
https://fuchsia.dev/fuchsia-src/reference/syscalls/socket_read

可以 查阅   socket_write 具体 定义  
https://fuchsia.dev/fuchsia-src/reference/syscalls/socket_write


在 这个 页面 查 所有object 

https://fuchsia.dev/fuchsia-src/reference/kernel_objects/objects

在 这个 页面 查 所有syscall

https://fuchsia.dev/fuchsia-src/reference/syscalls


这里就不 详细 展开了、内容 很多 导致 混乱


### linux  syscall 的 情况


rcore 实现  
不到 172 个 （包括 显式标注的未实现的syscall）
 
zcore 实现 
不到 149  个 （包括 显式标注的未实现syscall）

有  30个 rcore  实现 但 zcore 还未 完成

如下 
```

            SYS_RT_SIGRETURN => self.sys_rt_sigreturn(),
            SYS_KILL => self.sys_kill(args[0] as isize, args[1]),


            // socket
            SYS_SOCKET =>
            SYS_CONNECT => 
            SYS_ACCEPT => 
            SYS_ACCEPT4 => 
            SYS_SENDTO 
            SYS_RECVFROM => 
            SYS_RECVMSG => 
            SYS_SHUTDOWN => 
            SYS_BIND => 
            SYS_LISTEN => 
            SYS_GETSOCKNAME => 
            SYS_GETPEERNAME => 
            SYS_SETSOCKOPT => 
            SYS_GETSOCKOPT => 

            // process

            SYS_TKILL => 


            // system
            SYS_GETPGID => 
            SYS_SETPGID => 
            SYS_SETPRIORITY => 
            SYS_REBOOT =>

            // kernel module
            SYS_INIT_MODULE =>
            SYS_FINIT_MODULE =>
            SYS_DELETE_MODULE => 

            // custom
            SYS_MAP_PCI_DEVICE => 
            SYS_GET_PADDR =>

    }

    async fn x86_64_syscall(&mut self, id: usize, args: [usize; 6]) -> Option<SysResult> {
        let ret = match id {
            SYS_SYMLINK => self.sys_symlink(args[0] as *const u8, args[1] as *const u8),
            SYS_EPOLL_CREATE => self.sys_epoll_create(args[0]),
            SYS_EPOLL_WAIT => {
                self.sys_epoll_wait(args[0], args[1] as *mut EpollEvent, args[2], args[3])
            }
        }

```
可以根据 这个 列表 在去 具体 查看 这些 syscall 的 实现 进度

这里 给出 libc-test的 测试 结果

根 据 失败的 测例 去找 源代码 看是 那里 除了问题

失败
```
FAILED:
/libc-test/src/functional/socket.exe
/libc-test/src/functional/ipc_sem.exe
/libc-test/src/regression/pthread-robust-detach.exe
/libc-test/src/functional/ipc_msg.exe
/libc-test/src/functional/utime.exe
/libc-test/src/math/fmal.exe
/libc-test/src/functional/tls_align.exe
/libc-test/src/math/powf.exe
/libc-test/src/functional/strtod_long.exe
/libc-test/src/functional/strptime.exe
/libc-test/src/functional/ipc_shm.exe
/libc-test/src/regression/getpwnam_r-crash.exe
/libc-test/src/regression/pthread_exit-dtor.exe
/libc-test/src/regression/sigreturn.exe
/libc-test/src/functional/pthread_cancel-points.exe
/libc-test/src/functional/pthread_robust.exe
/libc-test/src/functional/fcntl.exe
/libc-test/src/common/runtest.exe
/libc-test/src/regression/pthread_atfork-errno-clobber.exe
/libc-test/src/regression/getpwnam_r-errno.exe
/libc-test/src/regression/daemon-failure.exe
/libc-test/src/functional/vfork.exe
/libc-test/src/regression/fflush-exit.exe
/libc-test/src/functional/tls_align_dlopen.exe
/libc-test/src/regression/statvfs.exe
```

超时
```
TIMEOUT:
/libc-test/src/regression/pthread_cond_wait-cancel_ignored.exe
/libc-test/src/functional/tls_local_exec.exe
/libc-test/src/functional/pthread_mutex.exe
/libc-test/src/functional/pthread_mutex_pi.exe
/libc-test/src/functional/wcsstr.exe
/libc-test/src/regression/pthread_cond-smasher.exe
/libc-test/src/functional/time.exe
/libc-test/src/functional/dirname.exe
/libc-test/src/functional/inet_pton.exe
/libc-test/src/functional/pthread_cancel.exe
/libc-test/src/functional/sem_open.exe
/libc-test/src/functional/search_lsearch.exe
/libc-test/src/regression/pthread_once-deadlock.exe
/libc-test/src/regression/pthread_condattr_setclock.exe
/libc-test/src/regression/raise-race.exe
/libc-test/src/functional/tls_init_dlopen.exe
/libc-test/src/functional/string_strstr.exe
```


比如 /libc-test/src/functional/socket.exe

libc-test 代码 
```
int main(void)
{
	struct sockaddr_in sa = { .sin_family = AF_INET };
	int s, c, t;
	char buf[100];

	TESTE((s=socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP))>=0);
	TESTE(bind(s, (void *)&sa, sizeof sa)==0);
	TESTE(getsockname(s, (void *)&sa, (socklen_t[]){sizeof sa})==0);

	TESTE(setsockopt(s, SOL_SOCKET, SO_RCVTIMEO,
		&(struct timeval){.tv_usec=1}, sizeof(struct timeval))==0);

	TESTE((c=socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP))>=0);
	sa.sin_addr.s_addr = htonl(0x7f000001);
	TESTE(sendto(c, "x", 1, 0, (void *)&sa, sizeof sa)==1);
	TESTE(recvfrom(s, buf, sizeof buf, 0, (void *)&sa, (socklen_t[]){sizeof sa})==1);
	TEST(buf[0]=='x', "'%c'\n", buf[0]);

	close(c);
	close(s);

	memset(&sa, 0, sizeof sa);
	sa.sin_family = AF_INET;
	TESTE((s=socket(PF_INET, SOCK_STREAM|SOCK_CLOEXEC, IPPROTO_TCP))>=0);
	TEST(fcntl(s, F_GETFD)&FD_CLOEXEC, "SOCK_CLOEXEC did not work\n");
	TESTE(bind(s, (void *)&sa, sizeof sa)==0);
	TESTE(getsockname(s, (void *)&sa, (socklen_t[]){sizeof sa})==0);
	sa.sin_addr.s_addr = htonl(0x7f000001);

	TESTE(listen(s, 1)==0);

	TESTE((c=socket(PF_INET, SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP))>=0);
	TEST(fcntl(c, F_GETFL)&O_NONBLOCK, "SOCK_NONBLOCK did not work\n");

	TESTE(connect(c, (void *)&sa, sizeof sa)==0 || errno==EINPROGRESS);

	TESTE((t=accept(s, (void *)&sa, &(socklen_t){sizeof sa}))>=0);

	close(t);
	close(c);
	close(s);

	return t_status;
}

```

在其中 找出 可能 的 错误 

看测试用例 调用了 什么 syscall

比如这个 可能就有 

```
41 socket
49 bind
51 getsockname
54 setsockopt
44 sendto
45 recvfrom
3 close
72 fcntl
50 listen
43 accept

```

这些 syscall 排查改进和完善

## 操作

### linux

在 zcore 的 根目录下 直接 运行 

```
cargo run --release -p linux-loader /libc-test/src/functional/socket.exe
```

就会 得到 如下 的 结果

```
Finished release [optimized] target(s) in 1m 30s
     Running `target/release/linux-loader /libc-test/src/functional/socket.exe`
[ERROR][2] unknown syscall: SOCKET. exit...
```

正如 我们 上面 所 列举的 、确实 socket syscall 是 没有 实现的

一开始 可以 用 这样的 方法 、来 逐步 推进、先简单 的 把 zcore 根 rcore 对齐、然后 继续 根据 需要 支持的 应用 、来补充 添加 更多 的 syscall

以防万一 、不失一般性、我们 可以 在试一个

```
cargo run --release -p linux-loader /libc-test/src/regression/statvfs.exe
```

结果 如下

```
Finished release [optimized] target(s) in 0.07s
     Running `target/release/linux-loader /libc-test/src/regression/statvfs.exe`
src/regression/statvfs.c:14: statvfs("/") failed: Permission denied
src/regression/statvfs.c:16: / has bogus f_bsize: 0
src/regression/statvfs.c:26: / has 0 file nodes
src/regression/statvfs.c:28: / has more free file nodes (8) than total file nodes (0)
src/regression/statvfs.c:34: / has bogus f_namemax: 1
```

这个结果 很友好、给出了 报错 位置、同理 还是去 找到 测试用例文件、阅读代码 、debug

### zircon

zcore的 readme 已经 有 写出

简单提一下

测试 （不会 崩溃 的） 全部 测试用例

使用 这种 方式 
```
pip3 install pexpect
cd scripts && python3 core-tests.py
```

如果 你单独 想 测一个

使用  这种 方式， 但测试用例不对、有可能 引起崩溃

```sh
cd zCore && make test mode=release [accel=1] test_filter='Channel.*'
```

如果 全部 都想 测试 请 参见 上面 提到的 fix、注册到maillist

请使用 云测试



最后 提一下、这篇说明 为了帮助 同学 快速 了解怎么做 和 如何 上手、其实就是个很简单那的事情、小试一下就懂了、不夸张的说 虽然我写得很差 很啰嗦、但是这东西相信在座的各位5分钟就能 完全 掌握  

好了，大概就是这样一个 流程了、感谢观看