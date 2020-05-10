.globl start
start:
    .code16 # 标注一开始是在16位模式下运行、使用指令时应是16位下的指令
    cli     # 关闭外部中断
    cld     # 清除方向标志位 即方向标志位 的那个bit 为0  控制 si、di 向前移动 即自动递增

    # 设置 重要的段寄存器 
    xorw    %ax,%ax       # xor 异或  w word 16bit 异或清零ax     
    movw    %ax,%ds       # 数据段寄存器 设置为0
    movw    %ax,%es       # 额外段寄存器 设置为0
    movw    %ax,%ss       # 栈段寄存器   设置为0


# 开启 A20
# 因为86结构 第21根地址线默认不开启、是历史原因造成的、
# 而现在地址线比21根要多、所以我们要启用这第21根获得连续的地址

# 虽然大致知道了A20干什么用的、但是怎么开启完全是copy的、并不知道什么意思、但有时间是可以去查的
seta20.1:
  inb     $0x64,%al               # Wait for not busy
  testb   $0x2,%al
  jnz     seta20.1

  movb    $0xd1,%al               # 0xd1 -> port 0x64
  outb    %al,$0x64

seta20.2:
  inb     $0x64,%al               # Wait for not busy
  testb   $0x2,%al
  jnz     seta20.2

  movb    $0xdf,%al               # 0xdf -> port 0x60
  outb    %al,$0x60
