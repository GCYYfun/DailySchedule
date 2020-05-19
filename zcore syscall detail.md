# 细节 记录

## 一、下载 zcore 、rcore

下载 rcore：

    git clone https://github.com/rcore-os/rCore.git --recursive

编译运行 rcore

    cd rCore/user
    make sfsimg prebuilt=1 arch=x86_64      // 出错