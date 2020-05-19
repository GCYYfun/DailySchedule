# 细节 记录

## 一、下载 zcore 、rcore

下载 rcore：

    git clone https://github.com/rcore-os/rCore.git --recursive

编译运行 rcore

    cd rCore/user
    make sfsimg prebuilt=1 arch=x86_64      // 需要下载、下载很慢

下载 zcore ：

    git clone https://github.com/rcore-os/zCore --recursive
    cd zCore
    git lfs pull

编译运行 zcore ：

    Busybox：
        cargo run --release -p linux-loader /bin/busybox [args]

完成后 对项目进行梳理