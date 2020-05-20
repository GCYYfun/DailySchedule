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

完成后 对项目进行梳理


## 下载 virtual box

https://www.virtualbox.org/

## 下载 alpine 镜像

地址 ： https://www.alpinelinux.org/

基础知识：https://wiki.alpinelinux.org/wiki/Alpine_Linux:Glossary


## 把 alpine 安装到 virtual box

安装 教程  
https://wiki.alpinelinux.org/wiki/Alpine_Install:_from_a_disc_to_a_virtualbox_machine_single_only