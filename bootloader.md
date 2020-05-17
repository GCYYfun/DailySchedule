# Bootloader

## BIOS

### X86_64

>上电，在实模式下  

>初始化 16位模式下寄存器的值 都为0

>打开A20  

>设置一个GDT  

>设置CR0 PE  

>一个长跳转 进入 保护模式  

>初始化以下 32位模式下寄存器的值  

>设置一个栈  7c00即可 因为向下增长  

>跳到磁盘加载代码  

>构建elf文件的结构体  
Elf Header
Progr amHeader
Section Header

>加载起始4k大小的内容进内存？？？

>通过 elf header 给出的program header 信息、去找到每一个programe header 、读取program header里对segment的描述、家在到对应位置

>至此内核加载完毕、从elfheader entry的信息、控制权交给内核





## UEFI

TODO  
工期预计10天



## 一些补充

Rust情况下、

> cargo build

会生成一个可执行文件 是ELF格式

而cargo build的过程中包含了 、编译、链接

gdb 调试加载的是elf文件

elf 文件里有sections 信息

有symbol table （符号表）gdb就要加载这个符号表、用来调试


接下来我们把boot和kernel都build成位elf文件格式

使用rust-objcopy 把elf 里面一些不需要的信息除去、生成成为电脑直接可以执行的二进制的bin文件

然后在把他们两个bin制作成为一个文件 使用dd 类似 这个 样子

```text
dd if=/dev/zero of=os.img~ bs=512 count=20000 2>/dev/null

dd if=boot.bin of=os.img~ conv=notrunc 2>/dev/null

dd if=os.bin of=os.img~ seek=1 conv=notrunc 2>/dev/null

mv os.img~ os
```

按区块分 、


### 分析 rust-osdev bootloader

#### 思路  

启动 方法 手动   

类似 这样  
KERNEL=/path/to/your/kernel/target/debug/your_kernel KERNEL_MANIFEST=/path/to/your/kernel/Cargo.toml 
cargo xbuild

目的是需要 设置 内核 路径 和 内核 toml路径

内核路径是为了把内核和bootloader编译到一起、内核toml是加入内核配置信息

内核文件首先应该编译成elf文件

最后 生成的是带着bootloader 的os elf文件

objcopy 转化成 bin文件

就可以 运行起来


#### 分析

part 1：  

涉及内容 ： rust 条件编译  feature

build.rs

```text
Some packages need to compile third-party non-Rust code, for example C libraries. Other packages need to link to C libraries which can either be located on the system or possibly need to be built from source. Others still need facilities for functionality such as code generation before building (think parser generators).

Cargo does not aim to replace other tools that are well-optimized for these tasks, but it does integrate with them with custom build scripts. Placing a file named build.rs in the root of a package will cause Cargo to compile that script and execute it just before building the package.
```

这是 build.rs 的介绍、他是会在build 之前 执行的一个文件、可以简单的这么理解

看到 build.rs 里面 会第一个执行main() 



一共做了几件事:  

1、确认 编译的目标 是不是x86_64-bootloader

2、获得 kernel 的 路径

3、获得kernel 的 名字

4、获取 llvm工具

5、检测kernel里是否有代码

6、丢弃kernel 里的无用信息

7、打包 先copy kernel 成为 bin.o ?

8、用llvm ar 归档成为一个静态库

9、解析kernel toml 

10、生成 bootloader_config.rs 在 out_dir

然后看 src/main.rs

1、引入bootloader_config.rs
> include!(concat!(env!("OUT_DIR"), "/bootloader_config.rs"));
用来提供 一些配置信息 比如 内存怎么映射

2、引入全局汇编 

```text
global_asm!(include_str!("stage_1.s"));
global_asm!(include_str!("stage_2.s"));
global_asm!(include_str!("e820.s"));
global_asm!(include_str!("stage_3.s"));
```

这些会直接执行、

3、当上述 汇编执行完 将会跳到 stage_4()

```text
#[no_mangle]
pub unsafe extern "C" fn stage_4() -> ! {
    // Set stack segment
    llvm_asm!("mov bx, 0x0
          mov ss, bx" ::: "bx" : "intel");

    let kernel_start = 0x400000;
    let kernel_size = &_kernel_size as *const _ as u64;
    let memory_map_addr = &_memory_map as *const _ as u64;
    let memory_map_entry_count = (mmap_ent & 0xff) as u64; // Extract lower 8 bits
    let page_table_start = &__page_table_start as *const _ as u64;
    let page_table_end = &__page_table_end as *const _ as u64;
    let bootloader_start = &__bootloader_start as *const _ as u64;
    let bootloader_end = &__bootloader_end as *const _ as u64;
    let p4_physical = &_p4 as *const _ as u64;

    bootloader_main(
        IdentityMappedAddr(PhysAddr::new(kernel_start)),
        kernel_size,
        VirtAddr::new(memory_map_addr),
        memory_map_entry_count,
        PhysAddr::new(page_table_start),
        PhysAddr::new(page_table_end),
        PhysAddr::new(bootloader_start),
        PhysAddr::new(bootloader_end),
        PhysAddr::new(p4_physical),
    )
}
```

4、而stage_4里只有一个bootloader_main函数

Now 我们理清运行流程了、  
我们目前只面临几个需要被解决的事情、几个汇编文件里写的什么、bootlader_main里写的什么

就让我们一点一点的来看

src/stage_1.s

这个阶段初始化堆栈，启用A20行，从磁盘上加载其余的引导程序，并跳转到 stage_2。

```
.section .boot-first-stage, "awx"
.global _start
.intel_syntax noprefix
.code16
```

设置section .boot-first0stage,  "awx" ??

.gloabl _start 定义 _start入口到全局

.intel_syntax noprefix 使用intel语法 ？？ 看网上说llvm2.0之后内置不支持了intel语法了、他这是用的什么汇编器、还是网上说的不靠谱？

.code 16 16位下汇编命令

// 初始化 寄存器 打印 一串文字
> _start: 

// 开启第21根地址线
> enable_A20

//进入保护模式   清中断、设置gdtr 开启保护模式位 跳到保护模式
> enter_protected_mode:

// 在保护模式下 设置 段寄存器 然后重新退回实模式、 我猜是因为很多指令需要在实模式下完成、但又需要能访问4G空间地址、um...因为已经设置了GDT、 需要理清访问路径就明白了、
> protected_mode:

// 返回 实模式 开中断
> unreal_mode:

// 检测int 13h中断 访问硬盘中断
> check_int13h_extensions:

//读取 余下的 booloader 段
> load_rest_of_bootloader_from_disk:

1、开始地址 获取
2、开始地址存到一个的地方
3、结束地址 获取
4、计算一共有多少个块（512B）
5、计算从_start 到结束一共有多少个块 ？？？ 
6、设置一个地址给到si 、这就是buffer放置的地址、
7、读取n个sectors 到 buffer中 用 int 13h ah=0x42
8、jc 产生 进位 跳到错误                            又卡住..     // 2020.05.17 23:51 找到问题了、 .section "awx" 这是什么？

// 跳到下一个阶段
> jump_to_second_stage:


src/stage_2.s


// 使用了 int 15h 中断 ah=ec 
//有些BIOS假设处理器只能在Legacy模式下运行。我们将目标工作模式更改为 "Long Mode Target Only"，
//因此固件希望每个CPU都能进入Long Mode一次，然后保持在Long Mode中。这允许固件启用模式指定的优化。
// 我们保存这些标志，因为如果不支持回调的话，CF会被设置（在这种情况下，这是一个NOP

> set_target_operating_mode:

// 读取 内核 从硬盘上
> load_kernel_from_disk:

1、从linker里获取_kernel_start_addr 、放到 一个地方存起来、其实是跟stage1一个存储地方  

2、把 1 放入 dap_blocks中 、um...也还是刚才的地方、这不是覆盖了么、刚才存的数值、变成了1  

3、kernel start 的地址减去 _start 俄地址 分块 存起来？？？？？？？？？？？？？、没看到kernel的地址从哪里来的、就算有、这不是又覆盖了吗、刚才这些数据还没用过、    // 需要 mod boot_info 2020.05.18  00：25

4、设置 地址为4M的地方 edi          ...edi 又跟谁参与作用？

5、kernel_size 又是那里来的、找了半天发现不到出处 给到ecx
    对ecx 512对齐

// 读取下一个 块
> load_next_kernel_block_from_disk:

1、还是准备好buffer 给到si
    同stage1 使用 int 13h ah=0x42
    读取数据 如果产生进位 则读取失败

2、设置 cx 为 128  
  双字拷贝 拷贝到 上面edi的位置 、内容esi的位置、
  1字 32位 4字节 双字 64位 8字节 128*8 = 1024？

  下一块？ dap 块数加一、cx 减一、循环、        ... dap 没有变、不是又覆盖了么？

// 创建 内存映射
> create_memory_map:
    memory map 的地址 给到 di
    do e820

// video mode ??
> call config_video_mode

// 重新在进入32位模式
> enter_protected_mode_again:
0x8压栈？？ 说的是给cs么、那也没看到赋值、
跳到 stage 3






























#### 改造

1. 加入 build.rs 添加条件编译