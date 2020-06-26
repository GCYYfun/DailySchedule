# Linux Docker

## Install 

https://docs.docker.com/engine/install/ubuntu/#prerequisites

Example for ubuntu

docker ps -a

docker run --name ubuntu20.04 -it ubunut 

docker exec -it ubuntu20.04 /bin/bash

docker start ubuntu20.04



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





Qemu 

```
make              make
install           install
python            python3.8 -B (3.8.2)
genisoimage       
slirp support     git 
smbd              /usr/sbin/smbd
module support    no
alt path mod load no
host CPU          x86_64
host big endian   no
target list       x86_64-softmmu riscv64-softmmu
gprof enabled     no
sparse enabled    no
strip binaries    yes
profiler          no
static build      no
SDL support       no 
SDL image support no
GTK support       no 
GTK GL support    no
VTE support       no 
TLS priority      NORMAL
GNUTLS support    no
libgcrypt         no
nettle            no 
libtasn1          no
PAM               no
iconv support     yes
curses support    no
virgl support     no 
curl support      no
mingw32 support   no
Audio drivers      oss
Block whitelist (rw) 
Block whitelist (ro) 
VirtFS support    yes
Multipath support no
VNC support       yes
VNC SASL support  no
VNC JPEG support  no
VNC PNG support   no
xen support       no
brlapi support    no
Documentation     no
PIE               yes
vde support       no
netmap support    no
Linux AIO support no
Linux io_uring support no
ATTR/XATTR support yes
Install blobs     yes
KVM support       yes
HAX support       no
HVF support       no
WHPX support      no
TCG support       yes
TCG debug enabled no
TCG interpreter   no
malloc trim support yes
RDMA support      no
PVRDMA support    no
fdt support       git
membarrier        no
preadv support    yes
fdatasync         yes
madvise           yes
posix_madvise     yes
posix_memalign    yes
libcap-ng support yes
vhost-net support yes
vhost-crypto support yes
vhost-scsi support yes
vhost-vsock support yes
vhost-user support yes
vhost-user-fs support yes
Trace backends    log
spice support     no 
rbd support       no
xfsctl support    no
smartcard support no
libusb            no
usb net redir     no
OpenGL support    no
OpenGL dmabufs    no
libiscsi support  no
libnfs support    no
build guest agent yes
QGA VSS support   no
QGA w32 disk info no
QGA MSI support   no
seccomp support   no
coroutine backend ucontext
coroutine pool    yes
debug stack usage no
mutex debugging   no
crypto afalg      no
GlusterFS support no
gcov              gcov
gcov enabled      no
TPM support       yes
libssh support    no
QOM debugging     yes
Live block migration yes
lzo support       no
snappy support    no
bzip2 support     no
lzfse support     no
zstd support      no
NUMA host support no
libxml2           no
tcmalloc support  no
jemalloc support  no
avx2 optimization yes
avx512f optimization no
replication support yes
VxHS block device no
bochs support     yes
cloop support     yes
dmg support       yes
qcow v1 support   yes
vdi support       yes
vvfat support     yes
qed support       yes
parallels support yes
sheepdog support  yes
capstone          git
libpmem support   no
libudev           no
default devices   yes
plugin support    no
fuzzing support   no
gdb               
cross containers  no
```


mount -t 9p -o trans=virtio,version=9p2000.L hostshare /libc-test




docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]

docker commit -a "GCYY" -m "os auto-test" main_test core_base


qemu-system-riscv64 \
  --machine virt \
  --nographic \
  --bios default


TODO or GIVEUP in an entangled state