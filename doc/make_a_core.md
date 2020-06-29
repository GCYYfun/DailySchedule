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