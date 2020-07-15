# import sched
# import time
from datetime import datetime
# # 初始化sched模块的scheduler类
# # 第一个参数是一个可以返回时间戳的函数，第二参数可以在定时未到达之前阻塞
# schedule = sched.scheduler(time.time, time.sleep)
# # 被周期性调度触发函数
# def printTime(inc):
#     print(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
#     schedule.enter(inc, 0, printTime, (inc,))
# # 默认参数60s
# def main(inc=60):
#     # enter四个参数分别为：间隔事件,优先级（用于同时到达两个事件同时执行的顺序），被调度触发的函数
#     # 给该触发器函数的参数（tuple形式）
#     schedule.enter(0, 0, printTime, (inc,))
#     schedule.run()
# # 5秒输出一次
# main(5)


import schedule
import time
import git
import os


# need to be config
# =============================================================
## 仓库地址 暂时没用、不想加入clone了、价值不大
REPO_URL = 'https://github.com.cnpmjs.org/rcore-os/zCore'
## zCore 路径
LOCAL_REPO_PATH = '/home/own/Work Realm/test/5realm/zCore'
## 结果文件
LAST_RESULT_FILE = "/home/own/zCore/scripts/test-result-last.txt"
## 上次结果文件
CURR_RESULT_FILE = "/home/own/zCore/scripts/test-result.txt"

DIFF = "/home/own/zCore/scripts/diff.txt"
# ==============================================================
CURR_INFO_DIR = {}
LAST_INFO_DIR = {}
# 定义你要周期运行的函数
def job():
    print("I'm working...")
    print(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))

def check_update(info):

    ## Now ! Just for everytest-by-qemu . Version Alpha ! Soon Will be Removed.
    if str(info.ref) != 'origin/everytest-by-qemu':
        return


    CURR_INFO_DIR[str(info.ref)]=str(info.commit)

    if str(info.ref) not in LAST_INFO_DIR :
        print("py first load")
        LAST_INFO_DIR[str(info.ref)] = str(info.commit)
        CURR_INFO_DIR[str(info.ref)] = str(info.commit)
        # 指定工作目录
        os.chdir('/home/own/zCore/scripts/')
        res = os.system("python3 /home/own/zCore/scripts/core-tests-qemu.py")
        
        if res == 0:
            print('Ok')
            if os.path.exists(LAST_RESULT_FILE):
                with open(LAST_RESULT_FILE, 'r') as last, open(CURR_RESULT_FILE, 'r') as curr:
                    last_lines = last.readlines()
                    curr_lines = curr.readlines()
                    for l,c in zip(last_lines,curr_lines):
                        if l==c:
                            continue
                        else:
                            with open(DIFF, 'w') as f:
                                f.write("last : "+l+"    "+"curr : "+c)
                            
                            os.chdir('/home/own/zCore/scripts/')
                            os.system('mv diff.txt /home/zcore/diff/diff'+str(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))+'.txt')
            else:
                print("first gen no diff") # TODO
                os.chdir('/home/own/zCore/scripts/')
                os.system('mv test-result.txt test-result-last.txt')
        else:
            print('Fail')
    elif CURR_INFO_DIR[str(info.ref)] != LAST_INFO_DIR[str(info.ref)]:
        print("alread have but not eq")
        os.chdir('/home/own/zCore/scripts/')
        res = os.system("python3 /home/own/zCore/scripts/core-tests-qemu.py")
        LAST_INFO_DIR[str(info.ref)] = str(info.commit)

        if res == 0:
            print('Ok')
            if os.path.exists(LAST_RESULT_FILE):
                with open(LAST_RESULT_FILE, 'r') as last, open(CURR_RESULT_FILE, 'r') as curr:
                    last_lines = last.readlines()
                    curr_lines = curr.readlines()
                    for l,c in zip(last_lines,curr_lines):
                        if l==c:
                            continue
                        else:
                            with open(DIFF, 'w') as f:
                                f.write("last : "+l+"    "+"curr : "+c)
                            
                            os.chdir('/home/own/zCore/scripts/')
                            os.system('mv diff.txt /home/zcore/diff/diff'+str(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))+'.txt')
            else:
                print("first gen no diff") # TODO
                os.chdir('/home/own/zCore/scripts/')
                os.system('mv test-result.txt test-result-last.txt')
        else:
            print('Fail')
    elif CURR_INFO_DIR[str(info.ref)] == LAST_INFO_DIR[str(info.ref)]:
        print("alread have and eq")



def repo_pull():
    repo = git.Repo(LOCAL_REPO_PATH)
    print(repo)
    remote = repo.remote()
    pullinfo  =  remote.pull()
    print('-----------')
    for info in pullinfo:
        check_update(info)




# schedule.every(1).seconds.do(job)               # 每隔 10 分钟运行一次 job 函数
schedule.every(5).seconds.do(repo_pull)
# # schedule.every().hour.do(job)                    # 每隔 1 小时运行一次 job 函数
# # schedule.every().day.at("10:30").do(job)         # 每天在 10:30 时间点运行 job 函数
# # schedule.every().monday.do(job)                  # 每周一 运行一次 job 函数
# # schedule.every().wednesday.at("13:15").do(job)   # 每周三 13：15 时间点运行 job 函数
# # schedule.every().minute.at(":17").do(job)        # 每分钟的 17 秒时间点运行 job 函数

while True:
    schedule.run_pending()   # 运行所有可以运行的任务
#     # time.sleep(1)


# 算了、够用就行

class Config():
    base_path=''
    local_repo_path=''
    last_result_file=''
    curr_result_file=''
    diff=''

    def __init__(self,local_repo_path='/home/zcore/zCore',last_result_file='/home/zcore/zCore/scripts/test-result.txt',curr_result_file='/home/zcore/zCore/scripts/test-result.txt',diff='/home/zcore/zCore/scripts/diff.txt'):
        local_repo_path = local_repo_path
        last_result_file = last_result_file
        curr_result_file = curr_result_file
        diff = diff