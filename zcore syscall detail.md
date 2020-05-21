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

![编译libc-testcase]](编译testcase.png)