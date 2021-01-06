# Do

## 如何运行一个裸机程序

制作 一个 镜像 跑在 裸机 上

怎么 制作 

使用 工具 objcopy

objcopy 拷贝一个目标文件的内容到另一个目标文件中 同时拷贝时可作格式转换

我们希望把elf 文件 制作 成为 bin 文件

适用 man objcopy 学习

objcopy infile -S -O binary outfile

现在我们来制作一个elf 文件

## elf 文件

在rust 中 cargo build 之后 就会生成 一个 elf 文件 

但目前 我们的 想法 是 可以运行在 裸机

那么我们首先 应该考虑 baremetal 的 平台

他所 要遵守的abi

同时也不可以 依赖很多目前平台太的代码库

还需要交叉编译器

暂时 定位 risc-v

## 首先 确定 平台

在 rustup target list 中

包含了 目前rust 支持 的 目标平台

让我们 选择 risc-v 64 位的

```
rustup target list
```

添加 一下 目标硬件平台的 约定

```
rustup target add "risc-v"
```

报错 不能添加 、以为当前 我们项目处于x86-64 还用着 std 

### 如果写代码

假设 我们知道了 替换的 平台

现在 要写代码了、要怎么写呢、

我们 不能 在基于 std了  这无法 work 的 因为硬件平台换了

我们 可以 不依赖于 std 写

添加 一个 #![no_std]

就可以去掉不用 std

但是 std 也 负责 给到 main 执行

所以 main 也无法用了

也要去 不使用 main #![no_main]

要从 _start起


这还没完、 要处理 失败的情况 

#[panic_handler]

还要处理 栈展开

在cargo.toml中 设置

设置 build 目标平台 .cargo