# qemu 5.2.0 用了 ninja

    sudo apt install re2c


    apt install make gcc g++ pkg-config libglib2.0-dev libmount-dev python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential autoconf automake libfreetype6-dev libtheora-dev libtool libvorbis-dev pkg-config texinfo zlib1g-dev unzip cmake yasm libx264-dev libmp3lame-dev libopus-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev pkg-config texinfo wget zlib1g-dev libpixman-1-dev

    git clone git://github.com/ninja-build/ninja.git && cd ninja
    ./configure.py --bootstrap
    sudo cp ninja /usr/bin/

    ninja --version



./configure 

--target-list=
    riscv64-softmmu,
    riscv64-linux-user,
    x86_64-softmmu





sudo apt install pkg-config


sudo apt install libglib2.0-dev


sudo apt install libpixman-1-dev