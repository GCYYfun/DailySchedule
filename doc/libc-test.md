# libc-test

http://musl.libc.org/doc/1.1.24/manual.html

## 目录结构

Readme 里说的很清楚

```text
src/api: interface tests, build time include header tests
src/common: common utilities compiled into libtest.a
src/functional: functional tests aiming for large coverage of libc
src/math: tests for each math function with input-output test vectors
src/regression: regression tests aiming for testing particular bugs
```

src/api: 接口测试，构建(时间)？包括头测试
src/common: 命令工具 编译成 libtest.a ？
src/functional: 功能测试，旨在对libc进行大范围的测试。
src/math: 测试每个数学函数的输入输出测试向量。
src/regression：旨在测试特定错误的回归测试。


编译成功后、使用 common/runtest.exe 希望测试的运行程序

在runtest.c中 

从main开始 找到 start  
start  里找到 fork  
fork() 执行 测试程序  

以一条命令为例

src/common/runtest.exe -w '' src/functional/argv.exe >src/functional/argv.err 