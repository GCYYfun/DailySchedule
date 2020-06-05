# 在rcore 上 运行 libc-test

## 本地环境要求

qemu

git
make
wget

## 下载rcore

在自己喜欢的位置

```
git clone https://github.com/rcore-os/rCore.git --recursive
```
## 下载musl 并安装

libc-test 需要
```
wget https://www.musl-libc.org/releases/musl-1.2.0.tar.gz

tar zxf musl-1.2.0.tar.gz
cd musl-1.2.0/
./configure --prefix=$(pwd)/../musl-install   // 自己喜欢的位置
make && make install
cd $(pwd)/../musl-install/bin               // 刚才设置的位置
ln -s musl-gcc x86_64-linux-musl-gcc

```
## 下载libc-test 

```
cd rCore/user

git clone git://repo.or.cz/libc-test

cd libc-test

```
修改

config.mak.def

第一行 添加 

>CC := x86_64-linux-musl-gcc

换成musl 编译 默认好像是是gcc

之后
```

make

make |grep FAIL|wc -l
```
结果显示数字 是失败个数 大约 10个左右

把 https://github.com/GCYYfun/DailySchedule/tree/master/libc-test%20case 地址下的 sh文件也复制到libc-test目录中

备用


## 修改makefile

在user目录下的makefile 添加

```
.PHONY: ··· ··· libc-test


···


build: libc-test        // 删除前面的 仅写这一项、别的程序 环境不一定全影响 成功

···

libc-test:
ifeq ($(arch), $(filter $(arch), x86_64))
	@echo Building libc-test
	@mkdir -p $(out_dir)
	cp -r libc-test $(out_dir)/libc-test
endif

```


## 生成文件镜像

在user 目录下

```
make sfsimg prebuilt=1 arch=x86_64
make sfsimg arch=x86_64
```

## 运行

```
$ cd ../kernel
$ make run ARCH=x86_64
```

进入qemu 

```
cd libc-test

src/common/runtest.exe -w '' src/functional/argv.exe >src/functional/argv.err && echo successed ; echo || echo argv failed ; echo
```
可以看见 successed 就代表可以运行了