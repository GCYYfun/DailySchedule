# Commands

objdump -f test

显示test 文件头信息

```
higgs：     文件格式 elf64-x86-64
体系结构：i386:x86-64， 标志 0x00000150：
HAS_SYMS, DYNAMIC, D_PAGED
起始地址 0x00000000000076e0
```

objdump -d test

Display assembler contents of executable sections
反汇编test中的需要执行指令的那些section

objdump -D test

与-d类似，但反汇编test中的所有section

objdump -h test

显示test的Section Header信息


objdump -x test

显示test的全部Header信息

objdump -s test

除了显示test的全部Header信息，还显示他们对应的十六进制文件代码

