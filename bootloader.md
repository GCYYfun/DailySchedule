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