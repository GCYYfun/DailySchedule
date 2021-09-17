# Sifive  Unmatched

## 记录第一次 启动 经历

1. 拿到 sifive unmatch 盒子
![unmatched_box](/picture/unmatched/unmatched_box.png)
1. 用刀片滑开 封条
![open_box](/picture/unmatched/open_box.png)
1. 打开盒子
![box_content](/picture/unmatched/box_content.png)
1. 扫红色卡片二维码 获取 文档
![scan_card](/picture/unmatched/scan_card.png)
1. 二维码在背面
![scan_card](/picture/unmatched/scan_card_back.png)
1. 获得的连接网页
https://www.sifive.com/boards/hifive-unmatched
![unmatched_index](/picture/unmatched/unmatched_index.png)
1. 下滑 找到get start
![get_start](/picture/unmatched/get_start.png)
1. 选择 zh 中文
https://sifive.cdn.prismic.io/sifive/b9376339-5d60-45c9-8280-58fd0557c2f0_hifive-unmatched-gsg-v1p4_ZH.pdf
1. 阅读
1. 动手

## 动手

1. 首先 确认 硬件 存在
2. 基本点亮 硬件 需要 
```txt
物品
1. 电源
2. sifive unmatched
3. 自己的一台电脑
4. mirco usb to usb 的 线
5. sd卡
```

3. 操作  (串口)  
sd 卡插入 unmatched，电源 插上给 unmatched 供电，usb 从 unmatched 连接 到 自己的 电脑，电源 通电 ，按下 开机键。ok。
然后在 自己 的 电脑 使用 串口 连接 unmatched 

4. 操作  (显卡)  
需要有显示器，  
使用 显卡 ，额外 插上 显卡 ，然后 电源 插给显卡 供电，显卡 连接 显示器

## 我的环境
目前 我的 使用的 实验环境

1. sifive unmatched
1. 酷冷至尊 电源 (型号未知)
1. nvidia gtx 1660
1. 无线网卡 (有intel A201，专用 intel 芯片组，暂无发体验)
1. 硬盘    (因保密检查，不可拆卸，暂无发体验)
1. 网线    (因保密检查，需要软件登陆才可上网，暂无法使用)

![env](/picture/unmatched/env.png)

运行 状态 （指示灯会亮起）

![open_env](/picture/unmatched/open_env.png)

## 体验感觉

![desktop](/picture/unmatched/desktop.png)

感觉 硬件 符合 PC 规范 都可使用 ，

开机 目前 使用 sd 卡，启动 比较慢 

界面 非常 卡顿，不清楚 是 显卡适配原因， 还是 sd卡读取原因 ，还是 cpu性能就这样

## 预期

需要 一些 配件 来支持 使用 unmatched

1. mini-itx 机箱 ， 用来 打包 固定 电源 和 主板，可有可无，不耽误使用。
1. m.2 固态固态 硬盘 ，如果 可以 希望有 两块，一块 装 linux 用来 为 以后 开发验证 riscv 程序 ，做一个对比平台。 另一个 装我们自己的OS。
1. 32G a1型 闪迪 sd卡 还是 需要 多 需要 一个 的 ，不希望擦出 目前 以有的 linux，用一个 新 sd卡装 我们自己的OS，前期 用来 尝试boot 和 开发调试，最后还是要装到 固态里，sd开机太慢了。
1. 电源 和 电源线 需要 ，适配 机箱，比如 sfx电源，不要机箱就无所谓了。
1. 显卡 需要 一个 AMD 和 Nvidia 都可以
1. 机箱 风扇 需要 ，目前 测试 散热 还是 有一些的，需要 空气 流动，被动散热 经测试 温度还是 有明显感觉。  不要机箱，也就无所谓了。
1. intel a200 wifi m2卡，a201 不能用
1. cr1220 纽扣 电池 一个 ，用来 激活 实时时钟。


## 计划

等组装完毕，有网络后 这款板子上，尝试linux上运行 SLAM，ROS，Rust等软件参考下

## 隐藏内容

感觉比较便携的配置

1. 机箱大师 c24 air
https://item.jd.com/72249644529.html#crumb-wrap
1. 海盗船 sf600 + sfx 模组电源线 、模组线节省空间
1. 只有 两个 风扇 3pin供电  ，最多 两个风扇，不可 pwm控速，
https://item.jd.com/2248313.html#crumb-wrap
1. 固态硬盘 
三星 980 https://item.jd.com/100018768480.html or  
西部数据 sn750 https://item.jd.com/100003226990.html
1. intel wifi6 网卡 https://item.jd.com/100019489708.html
1. cr1220 电池 https://item.jd.com/100015023254.html
1. sd卡 选择官方 带的 那款  ，但属实有点慢，https://item.jd.com/1875992.html
1. 显卡 就 比较 随心意了
