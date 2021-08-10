# linux ip 命令

# iptables 防火墙 

## iptables 结构

iptables -> tables -> chains -> rules

iptables 具有 四种 内建 表

分别是 Filter NAT Mangle Raw

### Filter

filter 是 iptables 默认表

内建 三种链

* input chain 处理 输入 本机 的
* output chain 处理 本机 输出 的
* forward chain 处理 转发 到 本机 其他 网卡 的

### NAT

* prerouting  处理刚到达本机并在路由转发前的数据包，它会转换数据包中的目标IP地址
* postrouting 处理即将离开本机数据包，它会转换数据包中的源目标IP地址
* output      处理本机产生的数据包

### Mangele

Mangle表用于指定如何处理数据包，它能改变TCP头中的Qos位，Mangle表具有5个内建链

* prerouting
* output
* forward
* input
* postrouting

### Raw 

raw表用户处理异常，它具有2个内建链

* prerouting chain
* output chain

1. 查看 iptables
1. 关闭 iptables
1. 开启 iptables
1. 重启 iptables
1. 状态 iptables

