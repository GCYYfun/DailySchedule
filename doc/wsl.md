#wsl

//wsl$

 wsl -l --all -v


wsl --export Ubuntu-20.04 d:\ubuntu20.04.tar

wsl --unregister Ubuntu-20.04


wsl --import Ubuntu-20.04 d:\ubuntu d:\ubuntu20.04.tar --version 2


ubuntu2004 config --default-user Username

del d:\ubuntu20.04.tar