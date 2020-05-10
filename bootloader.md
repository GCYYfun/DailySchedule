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