# 网络 实现 的 总结


## 1. Introduction

zcore 具有了 基本 boot 功能、中断管理、内存管理、进程管理 、文件管理、内核和用户态切换 和 Syscall功能，可以运行 busybox ，那么也可以添网络功能。

所以 目的 是 往 zcore 里 添加 网络 功能，使之 能 在 用户态 与 其他 网络 节点 通信。

因此 对 其 进行了 思考 和 实现

## 2. 思路

第一个 问题 是 网络通信的流程 是 如何 的 。

1. 基本 的 事实 是 数据 经过 的 地方 一定是 必要的。按着 数据 的 流向 来考虑 得出。

2. 从 网线 开始 算起， 假如  数据 以 bit 形式 从 网线 进入 我们的 电脑，那么 大概 第一个 接受 到 数据 的 是 网卡、那么 一定 要有 网卡 驱动

3. 数据 到达 网卡之后 ，是 cpu 需要 处理 数据，那么 cpu 是 如何 获得 这个 数据的 ，应该 有 可被 找到的 地址，放到一个 存储的 地方，那么 因该 会有 一个 类似 总线 的 功能来 管理。

4. 数据到了存储 的 地方，应该是 bit的 形式，那么 应该 按照 网路协议 对其 进行 解析，获得 我们 要 拿到 的 数据，这要 实现 一套网络 协议。

5. 经过网络 协议 解析，我们 拿到了 数据， 通常来说 这些 数据 应该 属于 一个 进程的，而我们这里讨论的 是 在内核 处理网络数据， 所以 把这些 数据 给到 用户进程，那这就属于 OS 内核与用户 经过 Syscall 的 交互 部分， 

6. 到此 用户 进程 收到 别人 法过来的 网络 数据，同理 发送 数据 也应该走 这么 一条路。

大概 整理 一下 就是 ，需要 我们 有一个 
* 网卡 驱动
* 总线 驱动
* 网络 协议
* Socket 接口
* Syscall 接口


## 3. 实现

根据 需要 把这个 东西 串 起来，使用到 别人写的库

首先 确定 硬件 ，使用 qemu 模拟，用 x86_64 结构，pci作为总线，e1000作为网卡

使用 e1000的 驱动库
使用 pci 的 驱动库

需要 网络 协议 

使用 smoltcp 网络库

socket 接口 smoltcp 也包含了，

最后的 syscall接口 在 zcore 里 添加 syscall 的 函数 就可以了

大体 有了，开始 实现

首先 使用 pci 库 对 pci 初始化

```rust
pub fn init() {
    info!("pci init");
    let pci_iter = unsafe { scan_bus(&PortOpsImpl, CSpaceAccessMethod::IO) };
    for dev in pci_iter {
        init_driver(&dev);
    }
}
```

分别 对每个 pci总线上 的 设备 进行 初始化

```rust
pub fn init_driver(dev: &PCIDevice) {
    let name = format!("enp{}s{}f{}", dev.loc.bus, dev.loc.device, dev.loc.function);
    info!("driver name {}", name);
    match (dev.id.vendor_id, dev.id.device_id) {
        (0x8086, 0x100e) | (0x8086, 0x100f) | (0x8086, 0x10d3) => {
            // 0x100e
            // 82540EM Gigabit Ethernet Controller
            // 0x100f
            // 82545EM Gigabit Ethernet Controller (Copper)
            // 0x10d3
            // 82574L Gigabit Network Connection
            if let Some(BAR::Memory(addr, len, _, _)) = dev.bars[0] {
                let irq = unsafe { enable(dev.loc) };
                let vaddr = phys_to_virt(addr as usize);
                let index = NET_DRIVERS.read().len();
                #[cfg(feature = "e1000")]
                info!("e1000 init");
                #[cfg(feature = "e1000")]
                e1000::init(name, irq, vaddr, len as usize, index);
                return;
            }
        }
        (0x8086, 0x10fb) => {
            // 82599ES 10-Gigabit SFI/SFP+ Network Connection
            if let Some(BAR::Memory(_addr, _len, _, _)) = dev.bars[0] {
                // some code ....
                return;
            }
        }
        _ => {}
    }
    // some code ....
}
```

根据 获得 的 设别 信息 ，判断 是 什么 设备 对其 初始化 这里 找到了 e1000 并对其 初始化

之后 根据 e1000库 对 网卡 初始化

```rust
pub fn init(name: String, irq: Option<usize>, header: usize, size: usize, index: usize) {
    info!("Probing e1000 {}", name);

    // randomly generated
    let mac: [u8; 6] = [0x52, 0x54, 0x98, 0x76, 0x54, 0x33];

    let e1000 = E1000::new(header, size, DriverEthernetAddress::from_bytes(&mac));

    let net_driver = E1000Driver(Arc::new(Mutex::new(e1000)));

    let ethernet_addr = EthernetAddress::from_bytes(&mac);
    let ip_addrs = [IpCidr::new(IpAddress::v4(10, 0, 2, 15), 24)];
    // let ip_addrs = [IpCidr::new(IpAddress::v4(127,0, 0,1), 24)];
    let default_gateway = Ipv4Address::new(10, 0, 2, 2);
    // let default_gateway = Ipv4Address::new(127, 0, 0, 1);
    let neighbor_cache = NeighborCache::new(BTreeMap::new());
    static mut routes_storage: [Option<(IpCidr, Route)>; 1] = [None; 1];
    let mut routes = unsafe { Routes::new(&mut routes_storage[..]) };
    routes.add_default_ipv4_route(default_gateway).unwrap();
    let iface = InterfaceBuilder::new(net_driver.clone())
        .ethernet_addr(ethernet_addr)
        .ip_addrs(ip_addrs)
        .routes(routes)
        .neighbor_cache(neighbor_cache)
        .finalize();
    let e1000_iface = E1000Interface {
        iface: Mutex::new(iface),
        driver: net_driver.clone(),
        name,
        irq,
    };
    let driver = Arc::new(e1000_iface);
    NET_DRIVERS.write().push(driver);
```
E1000 就是 网卡 驱动 库 提供的 

其他 网络 相关 是由 smoltcp 提供的

大致 意思 就是 使用 了 一个 Interface 的 结构 把 设备 和 网络 相关参数 放到里面

在 给到 全局 的 一个 NET_DRIVERS 的 变量上

这个 Interface 结构 处理了 网络 收发 一层一层 按协议打包，和 按协议解析的过程

总线 和 网卡 有了，那就 接着 看 socket

我们 为 socket 提供 了 一个 trait

```rust
#[async_trait]
pub trait Socket: Send + Sync + Debug {

    async fn read(&self, data: &mut [u8]) -> (SysResult, Endpoint);

    fn write(&self, data: &[u8], sendto_endpoint: Option<Endpoint>) -> SysResult;

    fn poll(&self) -> (bool, bool, bool); // (in, out, err)

    async fn connect(&self, endpoint: Endpoint) -> SysResult;

    fn bind(&mut self, _endpoint: Endpoint) -> SysResult {
        Err(LxError::EINVAL)
    }

    fn listen(&mut self) -> SysResult {
        Err(LxError::EINVAL)
    }

    fn shutdown(&self) -> SysResult {
        Err(LxError::EINVAL)
    }

    async fn accept(&mut self) -> LxResult<(Arc<Mutex<dyn Socket>>, Endpoint)> {
        Err(LxError::EINVAL)
    }

    fn endpoint(&self) -> Option<Endpoint> {
        None
    }

    fn remote_endpoint(&self) -> Option<Endpoint> {
        None
    }

    fn setsockopt(&self, _level: usize, _opt: usize, _data: &[u8]) -> SysResult {
        warn!("setsockopt is unimplemented");
        Ok(0)
    }

    fn ioctl(&self, _request: usize, _arg1: usize, _arg2: usize, _arg3: usize) -> SysResult {
        warn!("ioctl is unimplemented for this socket");
        Ok(0)
    }

    fn fcntl(&self, _cmd: usize, _arg: usize) -> SysResult {
        warn!("ioctl is unimplemented for this socket");
        Ok(0)
    }
}
```
这个 trait 差不多 就是 socket 接口 定义的 那些

每个 socket 都 实现 这个 trait 功能 就可以 统一 的 调用 了

比如 以 tcp 举例

在 zcore 里 实现 一个 tcp socket 

```rust
pub struct TcpSocketState {
    handle: GlobalSocketHandle,
    local_endpoint: Option<IpEndpoint>,
    is_listening: bool,
}
```
tcp 的一个 结构 这里 handle 是 类似 文件 描述符 ，唯一确定 一个 socket

```rust
impl TcpSocketState {
    /// missing documentation
    pub fn new() -> Self {
        let rx_buffer = TcpSocketBuffer::new(vec![0; TCP_RECVBUF]);
        let tx_buffer = TcpSocketBuffer::new(vec![0; TCP_SENDBUF]);
        let socket = TcpSocket::new(rx_buffer, tx_buffer);
        let handle = GlobalSocketHandle(SOCKETS.lock().add(socket));

        TcpSocketState {
            base: KObjectBase::new(),
            handle,
            local_endpoint: None,
            is_listening: false,
        }
    }
    // ... some code
}
``` 

这是 tcp socket 的 创建 结构是 smoltcp 库里的 ，实现了对 rx 和 tx buffer 的 操作，也是就是 获取 网络 数据 的 buffer

SOCKETS 是全局变量， 所有 socket 存储 的 地方

对应 trait 实现



```rust
impl Socket for TcpSocketState {
    

     // some code ...

    pub async fn read(&self, data: &mut [u8]) -> (LxResult<usize>, Endpoint) {
         // some code ...
    }


    pub fn write(&self, data: &[u8], _sendto_endpoint: Option<Endpoint>) -> SysResult {
         // some code ...
    }

    fn poll(&self) -> (bool, bool, bool) {
        // some code ...
    }


    pub async fn connect(&self, endpoint: Endpoint) -> SysResult {
        // some code ...
    }

    fn bind(&mut self, endpoint: Endpoint) -> SysResult {
         // some code ...
    }

    fn listen(&mut self) -> SysResult {
         // some code ...
    }

    fn shutdown(&self) -> SysResult {
         // some code ...
    }

    fn endpoint(&self) -> Option<Endpoint> {
        // some code ...
    }

    fn remote_endpoint(&self) -> Option<Endpoint> {
        // some code ...
    }

    fn ioctl(&self) -> SysResult {
         // some code ...
    }
}
```

最后 由 trait 调用


这里 还要 说下 关于 process 

```rust
#[derive(Default)]
struct LinuxProcessInner {
    // some code ...
    files: HashMap<FileDesc, Arc<dyn FileLike>>,
    // some code ...
    sockets: HashMap<SocketHandle, Arc<Mutex<dyn Socket>>>,
}
```

在 进程的 结构了 里 有  files 和 sockets 两个 hashmap
区别于 用 一个 文件描述符 存到 一个 地方的 形式，这里 是 分开 存放的，对 应 各自 的 trait 和 实现

这里 列出 zcore 对 smoltcp 使用 的 包装部分
```rust
(zcore) TcpSocketState ---封装---> TcpSocket (smoltcp)
(zcore) UdpSocketState ---封装---> UdpSocket (smoltcp)
(zcore) RawSocketState ---封装---> RawSocket (smoltcp)
```

Syscall

```rust
pub fn sys_socket(&mut self, domain: usize, socket_type: usize, protocol: usize) -> SysResult {
        info!(
            "sys_socket: domain: {:?}, socket_type: {:?}, protocol: {}",
            domain, socket_type, protocol
        );
        let proc = self.linux_process();
        let socket: Arc<Mutex<dyn Socket>> = match domain {
            //     musl
            //     domain local 1
            //     domain inet  2
            //     domain inet6 10
            2 | 1 => match socket_type {
                //         musl socket type
                //              1 STREAM
                //              2 DGRAM
                //              3 RAW
                //              4 RDM
                //              5 SEQPACKET
                //              5 SEQPACKET
                //              6 DCCP
                //              10 SOCK_PACKET
                1 => {
                    Arc::new(Mutex::new(TcpSocketState::new()))
                }
                2 => {
                    Arc::new(Mutex::new(UdpSocketState::new()))
                }
                3 => match protocol {
                    1 => {
                        Arc::new(Mutex::new(IcmpSocketState::new()))
                    _ => {
                        Arc::new(Mutex::new(RawSocketState::new()))
                    }
                },
                _ => return Err(LxError::EINVAL),
            },
            _ => return Err(LxError::EAFNOSUPPORT),
        };
        let fd = proc.add_socket(socket)?;
        Ok(fd.into())
    }

    /// net sys_con流程nect
    pub async fn sys_connect(
        &mut self,
        fd: usize,
        addr: UserInPtr<SockAddr>,
        addr_len: usize,
    ) -> SysResult {
        info!(
            "sys_connect: fd: {}, addr: {:?}, addr_len: {}",
            fd, addr, addr_len
        );

        let mut _proc = self.linux_process();
        let sa: SockAddr = addr.read()?;

        let endpoint = sockaddr_to_endpoint(sa, addr_len)?;
        let socket = _proc.get_socket(fd.into())?;
        let x = socket.lock();
        x.connect(endpoint).await?;
        Ok(0)
    }

    // some code ...
```

这里 列举 了 两个 socket syscall ，分别是 创建 socket 和 连接

socket 根据进程 调用 传进来 的参数  ， 创建 对应 socket 放入 刚才 我们 提到 的 sockets 里

connect 是 根据 传入 的 参数 ，取出 对应 的 socket 调用 object已经 实现 的 connect 函数

同理 实现 所有 syscall 

到此 为 用户态 提供 网络 功能 的 工作 基本 完成

接下来 验证 一下


## 4. 运行与测试


当我们 运行 zcore 进入 shell 

我们 可以 使用 现在 zcore 带的 busybox 的 wget 软件，下载 文件，

运行
```powershell
make run linux=1 loopback=0
``` 

```powershell
wget (服务器 ip 地址)
```

目前 zcore 用户文件 还比较少，用这个 尝试了一下，但这个 并不能 说明 syscall 实现的 如何

还是要跑一下 测试程序

用 libc-test 的 socket.c 文件

在 zcore/script/ 目录下 有  baremetal-libc-test-one.py

运行 之前 在 scripts/linux/baremetal-test-ones.txt 文件里 写入 /libc-test/src/functional/socket.exe

运行 python文件

```python
python3 baremetal-libc-test-one.py
```

就可 得到 测试 结果，目前 没有 报错，通过这个 测试 ，udp 和 tcp 的 连接、发送、接收，尚未出现问题。


## 5. 目前的不足

因为前期对整体理解设计和规划的不足，目前还没有使用中断和完整的异步去处理更新唤醒机制，依然使用轮询方式，也得益于目前没有什么其他进程在运行，尚且表现正常，但这并不是期望的结果，后续我会把这部分不足补足，形成完整且合理的流程。

## 6. 致谢

首先要感谢老师，**支持**并给机会和时间让我去 尝试和实现网络部分功能。

是这个功能得以完成的基础。

其次感谢，为这个实现做了铺垫的相关工作的人和事，很多参照了rCore的实现。

最后感谢一下过程中或多或少得到其帮助的同学，（按时间顺序）

陈嘉杰 (rcore 方面)  
王润基 (zcore 和 讨论 方面)  
萧络元 (自定义协议 和 讨论其实现 方面)  
石振兴 (libc-test 测试 方面)  
陈杰   (调试&debug 和 路由 方面)  

感谢！！！