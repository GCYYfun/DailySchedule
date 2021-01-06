# Guide

## 目录结构
```
zCore                    // 仓库根目录
    ├── .github                 // github CI/CD
    │   └── workflows               // 工作流目录
    │       └── main.yml                    // 配置文件
    │                              
    ├── docs             // 文档 资源 相关 目录
    ├── kernel-hal       // 内核 硬件 抽象层 接口 目录
    ├── kernel-hal-bare  // 对 裸机 硬件抽象层 的 实现
    ├── kernel-hal-unix  // 对 类unix系统 硬件抽象层 的 实现
    ├── linux-loader     // linux 加载器  用来加载运行 类linux程序
    ├── linux-object     // 类linux 对象 的 实现
    ├── linux-syscall    // 类linux syscall 的 实现
    ├── prebuilt         // 预制资源文件 需要git-lfs
    ├── rboot            // UEFI x86 bootloader
    ├── rootfs           // 类linux 根目录 (make 后 生成)
    ├── target           // build 后 生成
    ├── zCore            // zCore 启动
    ├── zircon-loader    // zircon 的 加载器  用来加载运行 zircon程序
    ├── zircon-object    // zircon 对象 的 实现
    ├── zircon-syscall   // zircon syscall 的 实现
    ├── zircon-user      // zircon 的 用户 程序
    ├── .gitattributes   // git lfs 配置
    ├── .gitignore       // git 配置
    ├── .gitmodules      // git modules 配置
    ├── Cargo.lock       // 
    ├── Cargo.toml       //
    ├── LICENSE          //
    ├── Makefile         //
    ├── README.md        //
    └── rust-toolchain   //
```

## 启动 方式

## bootloader 启动  rboot 

## zcore 启动

在 项目 根 目录下  

./zCore/main.rs 文件 中

是 内核 启动 的 入口位置 

```
    pub extern "C" fn _start(boot_info: &BootInfo) -> ! {
        logging::init(get_log_level(boot_info.cmdline));
        memory::init_heap();
        memory::init_frame_allocator(boot_info);
        #[cfg(feature = "graphic")]
        init_framebuffer(boot_info);
        info!("{:#x?}", boot_info);
        kernel_hal_bare::init(kernel_hal_bare::Config {
            acpi_rsdp: boot_info.acpi2_rsdp_addr,
            smbios: boot_info.smbios_addr,
            ap_fn: run,
        });
    
        let ramfs_data = unsafe {
            core::slice::from_raw_parts_mut(
                (boot_info.initramfs_addr + boot_info.physical_memory_offset) as *mut u8,
                boot_info.initramfs_size as usize,
            )
        };
        main(ramfs_data, boot_info.cmdline);
        unreachable!();
    }
```

此 函数 中   
```
main(ramfs_data, boot_info.cmdline);
```
会 依据 启动 的是 zircon 或 linux、选择 加载 不同 文件 

例如  zircon
```
#[cfg(feature = "zircon")]
fn main(ramfs_data: &[u8], cmdline: &str) {
    use zircon_loader::{run_userboot, Images};
    let images = Images::<&[u8]> {
        userboot: include_bytes!("../../prebuilt/zircon/x64/userboot.so"),
        vdso: include_bytes!("../../prebuilt/zircon/x64/libzircon.so"),
        zbi: ramfs_data,
    };
    let _proc = run_userboot(&images, cmdline);
    run();
}
```

而 linux
```
#[cfg(feature = "linux")]
fn main(ramfs_data: &'static mut [u8], _cmdline: &str) {
    use alloc::boxed::Box;
    use alloc::sync::Arc;
    use alloc::vec;
    use linux_object::fs::MemBuf;
    use linux_object::fs::STDIN;

    kernel_hal_bare::serial_set_callback(Box::new({
        move || {
            let mut buffer = [0; 255];
            let len = kernel_hal_bare::serial_read(&mut buffer);
            for c in &buffer[..len] {
                STDIN.push((*c).into());
                kernel_hal_bare::serial_write(alloc::format!("{}", *c as char).as_str());
            }
            false
        }
    }));

    let args = vec!["/bin/busybox".into(), "sh".into()];
    let envs = vec!["PATH=/usr/sbin:/usr/bin:/sbin:/bin:/usr/x86_64-alpine-linux-musl/bin".into()];

    let device = Arc::new(MemBuf::new(ramfs_data));
    let rootfs = rcore_fs_sfs::SimpleFileSystem::open(device).unwrap();
    let _proc = linux_loader::run(args, envs, rootfs);
    run();
}
```

可以 看出 依据 feature 会 执行 不同 的 加载

都 经过 一些 配置

zircon 执行了 
```
zircon_loader::run_userboot();
```
linux 执行了
```
linux_loader::run();
```

去到 他们 各自 的 加载器 去执行

执行 完毕

回来运行 run 函数 

```
run()
```
run 函数 里 是 引用的 https://github.com/rcore-os/executor.git executor 库

使用了 async 的 方式 运行 任务

## 内存 分配

## 进程 运行

## console 的 运行

## 用户 程序 调用 Syscall

## Sycall 的 执行流程

