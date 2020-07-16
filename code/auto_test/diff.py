import os
from datetime import datetime
# ================
LAST_RESULT_FILE = "/home/zcore/zCore/scripts/test-result-last.txt"
CURR_RESULT_FILE = "/home/own/zCore/scripts/test-result.txt"
DIFF_FILE = "/home/own/zCore/scripts/diff.txt"
# ================

os.chdir('/home/zcore/zCore/scripts/')
if os.path.exists(LAST_RESULT_FILE):
    compare_diff()
else:
    res = os.system("mv test-result.txt test-result-last.txt")

def compare_diff():
    with open(LAST_RESULT_FILE, 'r') as last, open(CURR_RESULT_FILE, 'r') as curr:
                    last_lines = last.readlines()
                    curr_lines = curr.readlines()
                    with open(DIFF_FILE, 'w') as f:
                        for l,c in zip(last_lines,curr_lines):
                            if l==c:
                                continue
                            else:
                                f.write("last : "+l+"    "+"curr : "+c)
                            
                    os.chdir('/home/own/zCore/scripts/')
                    os.system('mv diff.txt /home/zcore/diff/diff'+str(datetime.now().strftime("%Y-%m-%d-%H:%M:%S"))+'.txt')