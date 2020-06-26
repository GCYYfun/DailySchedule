# Zircon 
https://fuchsia.dev/fuchsia-src/concepts/fidl/overview#fidl_architecture

## FIDL摘要

### Overview
本文档是 Fuchsia 接口定义语言 （FIDL） 的高级概述，它是用于描述在 Fuchsia 上运行的程序使用的进程间通信 （IPC） 协议的语言。

## Aim
FIDL 的主要工作是允许不同的客户和服务进行互操作。通过将 IPC 机制的实现与其定义脱钩，以及通过自动代码生成简化客户端多样性。

### FIDL architecture

FIDL definition file — this is a text file (ending in by convention) that defines the values, and protocols (methods with their parameters),.fidl

client code — generated by the FIDL compiler () toolchain for each specific target language, andfidlc

server code — also generated by the FIDL compiler toolchain.

### Messaging Models



## VMAR










### Syscall的 life

sys_vmo_create
创建 一个 VMO 对象

Input ： vmo大小
        option

output : zx_status_t 
         out

object needed

VMO

sys_vmo_read()

base vmo

Input: handle buffer offset size

Output: status buffer



TODO or GIVEUP in an entangled state