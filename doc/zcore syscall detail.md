# 细节 记录

## 一、下载 zcore 、rcore

下载 rcore：

    git clone https://github.com/rcore-os/rCore.git --recursive

编译运行 rcore

    cd rCore/user
    make sfsimg prebuilt=1 arch=x86_64      // 需要下载、下载很慢

    cd ../kernel
     make run ARCH=x86_64 LOG=info

下载 zcore ：

    git clone https://github.com/rcore-os/zCore --recursive
    cd zCore
    git lfs pull

编译运行 zcore ：

    Busybox：
        cargo run --release -p linux-loader /bin/busybox [args]


## 下载 virtual box

https://www.virtualbox.org/

## 下载 alpine 镜像

地址 ： https://www.alpinelinux.org/

基础知识：https://wiki.alpinelinux.org/wiki/Alpine_Linux:Glossary


## 把 alpine 安装到 virtual box

安装 教程  
https://wiki.alpinelinux.org/wiki/Alpine_Install:_from_a_disc_to_a_virtualbox_machine_single_only

过程简述 

港币

## 在alpine 里编译 libc-test 

文档中 http://nsz.repo.hu/git/?p=libc-test 这个地址的url 无法clone、如果不是操作问题的话、看着这个页面不太会操作

在搜索中 找到 https://wiki.musl-libc.org/libc-test.html 说 automatically synced git mirror: <git://repo.or.cz/libc-test>、这个库能clone 、看上去内容差不多

安装需要的包：  
apk add git  
apk add make  
apk add gcc   
apk add libc-dev  

clone 下来 make

um...运行成功、但好像测试结果不理想、

如图：  

![编译libc-testcase](https://github.com/GCYYfun/DailySchedule/blob/master/picture/%E7%BC%96%E8%AF%91testcase.png)


源于无知  参考:issues  https://github.com/GCYYfun/DailySchedule/issues/1 

## 从virtual box 里面 拿出 编译 好的 libc-test

方法: scp 拷贝  
需要: ssh 可以连接

步骤1：  
打开Virtual box 、我们安装的os的 __设置__ -> __网络__ -> __网卡1__ -> __高级__ -> __端口转发__  -> __添加规则__

新建一个端口    
名称：ssh|主机端口：2222|子系统端口：22

步骤2：  
在虚拟机里

```
    // 允许 root下 远程登陆
    # echo "PermitRootLogin  yes"   >>  /etc/ssh/sshd_config
    
    // 重启 ssh服务
    # service sshd restart
```

步骤3：
从远程拷贝  

    scp -r -P  端口号   用户名@IP地址:目标文件目录  本机目录

比如 在我机器上 

    scp -r -P 2222 root@127.0.0.1:/root/libc-test /home/own/VirtualShare/share

<!-- 也可以 拷贝本机到远程

    scp -r  本机目录  用户名@IP地址:目标文件目录 -->