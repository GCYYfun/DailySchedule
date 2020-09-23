import pexpect
import sys
import time
import os
import re
import multiprocessing
import subprocess
import glob

# 解析
## ====================
import json
import yaml
try:
    from yaml import CLoader as Loader, CDumper as Dumper
except:
    from yaml import Loader, Dumper
## ====================

subprocess.run("pwd")
user = sys.argv[1]
branch = sys.argv[2]

TIMEOUT = 10

BASE = "/home/own/MengXia"

OUTPUT_FILE = BASE + "/warehouse/" + "zCore" + "_realm/"  + user + "/logfile/" + branch + "/libc_output.txt"




subprocess.run("git checkout " + branch,shell=True,cwd=BASE + "/warehouse/" + "zCore" + "_realm/" + user + "/" + "zCore")
subprocess.run("make rootfs && make libc-test",shell=True,cwd=BASE + "/warehouse/" + "zCore" + "_realm/" + user + "/" + "zCore")

subprocess.run("cargo build --release -p linux-loader",shell=True,cwd=BASE + "/warehouse/" + "zCore" + "_realm/" + user + "/" + "zCore")



os.chdir(BASE + "/warehouse/" + "zCore" + "_realm/" + user + "/" + "zCore")
start = time.time() 
print("开始计时")

with open(OUTPUT_FILE, "w") as output:
    index = 1
    pass_index = 1
    fail_index = 1
    timeout_index = 1
    for path in glob.glob("rootfs/libc-test/src/*/*.exe"):
        path = path[len('rootfs'):]
        # ignore static linked tests
        # if path.endswith('-static.exe'):
        #     continue
        try:
            # child = pexpect.spawn('cargo run --release -p linux-loader' + path)  
            # child.expect('Password:') 

            print(path)

            p = subprocess.run("cargo run --release -p linux-loader " + path,
                        shell=True,stdout=output ,stderr=output,timeout=TIMEOUT, check=True,encoding="utf-8")
            # passed.add(path)
            # for line in p.stdout:
            #     f.writelines(line)
            #     f.flush()
            
            print()
            print("PASS ======================",p.stdout)
            print("PASS ======================",p.stderr)
            # sys.stdout = output
            # sys.stdout.flush()
            # output.write(path+"\n")
            output.write(str(index) + "  :  " + "============================ PASSED ============================\n")
            output.write(path+"\n")
            # output.write(p.stderr)
            output.write("============================ PASSED ============================")
            output.write("\n\n\n\n")
            output.flush()

            # passed.write(str(pass_index) + "  :  " + "============================ PASSED ============================")
            # passed.write(p.stderr)
            # passed.write("============================ PASSED ============================")
            # passed.write("\n\n")
            # passed.flush()
            # pass_index += 1
        except subprocess.CalledProcessError:
            # failed.add(path)
            print()
            print("ERROR ======================",p.stdout)
            print("ERROR ======================",p.stderr)
            # output.write(path+"\n")
            output.write(str(index) + "  :  " + "============================ ERROR ============================\n")
            output.write(path+"\n")
            # output.write(p.stderr)
            output.write("============================ ERROR ============================")
            output.write("\n\n\n\n")
            output.flush()

            # failed.write(str(fail_index) + "  :  " + "============================ ERROR ============================")
            # failed.write(p.stderr)
            # failed.write("============================ ERROR ============================")
            # failed.write("\n\n")
            # failed.flush()
            # fail_index += 1
        except subprocess.TimeoutExpired:
            # timeout.add(path)
            print()
            print("TIMEOUT ======================",p.stdout)
            print("TIMEOUT ======================",p.stderr)
            # output.write(path+"\n")
            output.write(str(index) + "  :  " + "============================ TIMEOUT ============================\n")
            output.write(path+"\n")
            # output.write(p.stderr)
            output.write("============================ TIMEOUT ============================")
            output.write("\n\n\n\n")
            output.flush()

            # timeout.write(str(timeout_index) + "  :  " + "============================ TIMEOUT ============================")
            # timeout.write(p.stderr)
            # timeout.write("============================ TIMEOUT ============================")
            # timeout.write("\n\n")
            # timeout.flush()
            # timeout_index += 1
        index += 1
        
os.system('killall linux-loader')

end = time.time()
os.chdir(BASE)
print('用时--times{:.3f}'.format(end-start))


# subprocess.run("python3 analysis.py " + user + " " + branch,shell=True,cwd=BASE + "/warehouse/" + "zCore" + "_realm/" + "scripts")
# os.system('python3 statistics.py '+user + " " +branch)
