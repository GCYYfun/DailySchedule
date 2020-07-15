# 安装 python

sudo yum install python3

## 拷贝

文件
scp 源 目的
文件夹
scp -r

服务器 格式  用户名@地址:路径

源 地址  路径


## 配置 qemu 

./configure --prefix=/home/zcore/software/qemu_installed --target-list=x86_64-softmmu,riscv64-softmmu --enable-kvm 


## 设置环境变量
echo 'export PATH=$PWD/x86_64-softmmu:$PWD/riscv64-softmmu:$PATH' >> /home/zcore/.bashrc