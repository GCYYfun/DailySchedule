import git
import os
import schedule

LOCAL_REPO_PATH = '/home/own/Work Realm/test/5realm/zCore'
ZCORE_URL = 'https://github.com.cnpmjs.org/rcore-os/zCore'

def zcore_clone():
    url = ZCORE_URL
    # 第一次
    # 1. clone
    # 2. build
    # 3. 运行

    ## 指定当前工作目录
    os.chdir("dst")
    ## clone 仓库
    os.system("git clone https://github.com/rcore-os/zCore --recursive")
    ## 进入 仓库 
    os.system("cd zCore")
    ## build
    os.system("cd zCore && make build mode=release")
    ## 指定当前工作目录
    os.chdir("")
    ## 切换目录
    os.system("cd ../scripts")
    ## 执行测试
    os.system("python3 hello.py")


def zcore_check_and_update():
    ## 指定当前工作目录
    os.chdir("dst")
    ## clone 仓库
    res = os.popen("git pull https://github.com/rcore-os/zCore").readline()
    if res == "":
        return 
    ## 进入 仓库 
    os.system("cd zCore")
    ## build
    os.system("cd zCore && make build mode=release")
    ## 指定当前工作目录
    os.chdir("")
    ## 切换目录
    os.system("cd ../scripts")
    ## 执行测试
    os.system("python3 hello.py")





if os.path.exists(LOCAL_REPO_PATH):
    schedule.every(5).seconds.do(zcore_check_and_update)
else:
    zcore_clone()
    schedule.every(5).seconds.do(zcore_check_and_update)

while True:
    schedule.run_pending() 