from datetime import datetime
import time
import os

import psutil


# for proc in psutil.process_iter(['pid', 'name']):
#     print(proc.info)



# def on_terminate(proc):
#     print("process {} terminated".format(proc))

# gone, alive = psutil.wait_procs(procs_list, timeout=3, callback=on_terminate)

# psutil.test()

p = psutil.Process(104956)
print("进程 :",p)
print("进程的名字 :",p.name())
print("进程的程序路径 :",p.exe())
print("进程 id :", p.pid)
print("进程 创建 时间 :", p.create_time())
print("cpu 时间 :", p.cpu_times())
print("cpu 百分比 :",p.cpu_percent(),"%")
print("使用cpu 号 :",p.cpu_affinity())
print("内存信息 :",p.memory_info())
print("占用内存百分比 :",p.memory_percent(),"%")
print("进程的io数 :",p.io_counters())
print("进程拥有的线程 :",p.threads())

