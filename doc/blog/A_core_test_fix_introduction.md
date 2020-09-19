# A Core Test Fix Introduction

## 目前 测试 方式 

###  使用 本地 测试 

遵循 zcore readme 

```sh
pip3 install pexpect
cd scripts && python3 core-tests.py
# Check `zircon/test-result.txt` for results.
```

这样 进行 测试 

可以 得出 测试 不通过 的 结果

就如 文档里 写的 那样 检查 zircon/test-result.txt 看到 结果

同时 在这个 文件 的同级目录下 还有 output.txt

那时 测试 报错 的 信息 、对 定位 错误 提供 了 很大 的帮助 

for example 我们 去 那个 文件里 找到 一个 例子 看看

我就找到我这个里面的第一个了
```
[ RUN      ] MemoryMappingTest.AddressSpaceLimitsTest
../../zircon/system/utest/core/memory-mapping/memory-mapping.cc:62: Failure: Expected status is ZX_OK. vm_map
    Expected: ZX_OK
    Which is: ZX_OK(0)
    Actual  : status
    Which is: ZX_ERR_INVALID_ARGS(-10)
../../zircon/system/utest/core/memory-mapping/memory-mapping.cc:69: Failure: Expected status == ZX_ERR_NO_MEMORY. vm_map
    Expected: (-4)
    Which is: -4
    Actual  : status
    Which is: -10
../../zircon/system/utest/core/memory-mapping/memory-mapping.cc:72: Failure: Expected zx_vmar_unmap(zx_vmar_root_self(), addr, page_size) is ZX_OK. 
    Expected: ZX_OK
    Which is: ZX_OK(0)
    Actual  : zx_vmar_unmap(zx_vmar_root_self(), addr, page_size)
    Which is: ZX_ERR_INVALID_ARGS(-10)
[  FAILED  ] MemoryMappingTest.AddressSpaceLimitsTest (8 ms)
```
这里 就要 提到 一件 不得不做的事情 你需要 下载 fuchsia的源码包下来、大约14G 解压后翻倍、编译后进位、如果想玩一下fuchsia 这边建议准备好200G 空间 给自己一些 余地  
下载 地址 ： https://mirrors.sirung.org/fuchsia/source-code/

那么 我暂且 认为 你有 了 fuchsia 源码 后、看 他的输出 的 信息
```
[ RUN      ] MemoryMappingTest.AddressSpaceLimitsTest
```
这个 是 说 运行 的 哪个 测试 用例

```
[  FAILED  ] MemoryMappingTest.AddressSpaceLimitsTest (8 ms)
```
最后 一行 这个 说明 它 失败了 、但也 用了 8ms

那么 我们就要 看 中间 的 内容了

```
../../zircon/system/utest/core/memory-mapping/memory-mapping.cc:62: Failure: Expected status is ZX_OK. vm_map
```

第一行 这个 说明 他 在 那里 出错了  、指的是 在 fuchsia 中的 路径 、你要去 找到  __/zircon/system/utest/core/memory-mapping/memory-mapping.cc__ 这个 文件  
并且 错误 出现 在 第 62 行  

__Failure: Expected status is ZX_OK. vm_map__ 这说的 是 失败的 原因

期望 (变量 谁) 是 (什么 类型 ) 的 .  

vm_map 这是针对 这个例子的 辅助提示信息 有可能 有 、 有可能 没有

status 是 变量 名 、里面是  真实 运行 返回的结果值

zx_ok 是 zx_ok 类型 、里面 对应 期望 返回 的 结果值

对这个 就是 希望 status 是 zx_ok 类型

```
    Expected: ZX_OK
    Which is: ZX_OK(0)
    Actual  : status
    Which is: ZX_ERR_INVALID_ARGS(-10)
```
这是 更多一些 的 信息

Expected： 就是 期望 的 类型 、这里是 ZX_OK   
Which is： 就是 期望 的 类型 的值 、 这里是 ZX_OK(0)  
Actual  ： 就是 返回 的 变量 、这里是 status  
Which is： 就是 返回 的 变量 的值 、这里是 ZX_ERR_INVALID_ARGS(-10)  

ok 任务 就是 把 这两个 变得 匹配

这时 就 需要 看 fuchsia 结合 zcore 进行 修改  

修改 情况 需要结合实际 

另外两个 也是 这样子 的 流程 就不 一一 展示 了

-----------------------------

### 远程方式 测试

因为 本地 测试 目前 尚未 添加 panic 的  testcase的支持、所有 都可 运行 完毕 提供 debug信息

还有 一种 运行 就会 panic 无法 拥有 信息 的 情况

这时 远程  测试 就可以 提供 些 帮助、快速 的 告知 这些 信息、

使用 方式 很简单 只需要 fork 了zcore 仓库， 根据 向 http://163.fm/OLAYBlDE 进行 申请 订阅 mail list ，并发送 你的 仓库 地址

每次 的 commit 都会 执行 这些 测试、会以邮件的方式 发送到 maillist、你只要 订阅 就可以 受到