# 

## 添加串口 无需 sudo

groups own

显示 用户的 所在组

sudo gpasswd --add own dialout

把 dialout 添加 进 own用户


or this 

```
sudo usermod -a -G dialout own
```