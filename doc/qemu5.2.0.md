# qemu 5.2.0 用了 ninja

    sudo apt install re2c

    git clone git://github.com/ninja-build/ninja.git && cd ninja
    ./configure.py --bootstrap
    sudo cp ninja /usr/bin/

    ninja --version