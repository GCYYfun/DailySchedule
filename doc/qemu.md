# Qemu

## Invocation

-drive 

```
Define a new drive. This includes creating a block driver node (the backend) as well as a guest device, and is mostly a shortcut for defining the corresponding -blockdev and -device options.
```

file=file

> This option defines which disk image (see Disk Images) to use with this drive. If the filename contains comma, you must double it (for instance, “file=my,,file” to use file “my,file”).

media=media  

> This option defines the type of the media: disk or cdrom.

cache=cache

> cache is “none”, “writeback”, “unsafe”, “directsync” or “writethrough” and controls how the host cache is used to access block data. This is a shortcut that sets the cache.direct and cache.no-flush options (as in -blockdev), and additionally cache.writeback, which provides a default for the write-cache option of block guest devices (as in -device). The modes correspond to the following settings:

format=format

> Specify which disk format will be used rather than detecting the format. Can be used to specify format=raw to avoid interpreting an untrusted format header.

## Images

Disk image file formats

```
QEMU supports many image file formats that can be used with VMs as well as with any of the tools (like qemu-img). This includes the preferred formats raw and qcow2 as well as formats that are supported for compatibility with older QEMU versions or other hypervisors.
```

Virtual FAT disk images

```
QEMU can automatically create a virtual FAT disk image from a directory tree. In order to use it, just type:
```

-hdb fat:/my_directory

fat:rw:




-fsdev local,id=id,path=path,security_model=security_model 

定义一个新的文件系统设备

-fsdev local ,id = [任意自己喜欢的名字]，path = [host主机上的文件路径]，security_model = no

local  
对文件系统的访问由QEMU完成

proxy  
对文件系统的访问由virtfs-proxy-helper完成

synth  
合成文件系统，仅由QTests使用

security_model = none  
不给自己找麻烦

-device virtio-9p-type,fsdev=id,mount_tag=[qemu里的路径]

mount_tag=mount_tag
指定客户机用于挂载此导出点的标记名


合并 成为

-virtfs local,path=path,mount_tag=mount_tag ,security_model=security_mode


问题 

qemu config 需要支持 virtio

--enable-virtfs 

kernel 也需要支持 

明显 不适用


目前 传命令 和  共享 文件 都不可以 唉...