import pexpect
import sys
import time

TIMEOUT = 10
ZCORE_PATH = '../zCore'
OUTPUT_FILE = 'test-output.txt'
RESULT_FILE = 'test-result.txt'
CHECK_FILE = 'test-check-passed.txt'
TEST_CASE_FILE = 'testcases.txt'
ALL_CASES = 'all-test-cases.txt'


class Tee:
    def __init__(self, name, mode):
        self.file = open(name, mode)
        self.stdout = sys.stdout
        sys.stdout = self

    def __del__(self):
        sys.stdout = self.stdout
        self.file.close()

    def write(self, data):
        self.file.write(data)
        self.stdout.write(data)

    def flush(self):
        self.file.flush()


lines = []
with open(ALL_CASES, "r") as f:
    lines = f.readlines()
logfile = Tee(OUTPUT_FILE, 'w')
resultfile = Tee(RESULT_FILE, 'w')
for line in lines:
    if line.startswith('#') or line.startswith('\n'):
        continue
    content=[]
    with open("../zCore/target/x86_64/release/esp/EFI/Boot/rboot.conf","r") as f:
        content = f.readlines()
    i=0
    while i < len(content):
        if content[i].startswith("cmdline"):
            content[i] = "cmdline=LOG=warn:userboot=test/core-standalone-test:userboot.shutdown:core-tests="+line
        i = i + 1
    with open("../zCore/target/x86_64/release/esp/EFI/Boot/rboot.conf","w") as f:
        f.writelines(content)

    child = pexpect.spawn("qemu-system-x86_64 -smp 1 -machine q35 -cpu Haswell,+smap,-check,-fsgsbase -drive if=pflash,format=raw,readonly,file=../rboot/OVMF.fd -drive format=raw,file=fat:rw:../zCore/target/x86_64/release/esp -drive format=qcow2,file=../zCore/target/x86_64/release/disk.qcow2,id=disk,if=none -device ich9-ahci,id=ahci -device ide-drive,drive=disk,bus=ahci.0 -serial mon:stdio -m 4G -nic none -device isa-debug-exit,iobase=0xf4,iosize=0x04 -accel kvm -cpu host,migratable=no,+invtsc -display none -nographic",
                          timeout=TIMEOUT, encoding='utf-8')
    child.logfile = logfile
    index = child.expect(['finished!', 'panicked', pexpect.EOF, pexpect.TIMEOUT])
    result = ['FINISHED', 'PANICKED', 'EOF', 'TIMEOUT'][index]

    resultfile.write(line.strip()+" "+result+"\n")
    resultfile.flush()


# passed = []
# failed = []
# passed_case = set()
# with open(OUTPUT_FILE, "r") as f:
#     for line in f.readlines():
#         if line.startswith('[       OK ]'):
#             passed += line
#             passed_case.add(line[13:].split(' ')[0])
#         elif line.startswith('[  FAILED  ]') and line.endswith(')\n'):
#             failed += line

# with open(RESULT_FILE, "w") as f:
#     f.writelines(passed)
#     f.writelines(failed)

# with open(CHECK_FILE, 'r') as f:
#     check_case = set([case.strip() for case in f.readlines()])

# not_passed = check_case - passed_case
# if not_passed:
#     print('=== Failed cases ===')
#     for case in not_passed:
#         print(case)
#     exit(1)
# else:
#     print('All checked case passed!')
