# Linux Docker

## Install 

https://docs.docker.com/engine/install/ubuntu/#prerequisites

Example for ubuntu

docker ps -a

docker run --name ubuntu20.04 -it ubunut 

docker exec -it ubuntu20.04 /bin/bash



# Demo for Ubuntu 20.04
## Init

mv /etc/apt/sources.list /etc/apt/sources.list.bak

echo deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse >> /etc/apt/sources.list

apt install git 

apt install wget

git clone https://mirrors.tuna.tsinghua.edu.cn/git/qemu.git


cd qemu


apt install python3.8

./configure --target-list=x86_64-softmmu,riscv64-softmmu --python=python3.8


apt istall gcc


apt install pkg-config


ERROR: glib-2.48 gthread-2.0 is required to compile QEMU

apt-get install libglib2.0-dev


ERROR: pixman >= 0.21.8 not present.

apt-get install libpixman-1-dev

apt install curl


source $HOME/.cargo/env


export PATH=$PWD/x86_64-softmmu:$PWD/riscv64-softmmu:$PATH


curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh