##########################START
#  README:
#         
#         共32个 会导致core不可运行的 测例
#
#         名字和运行命令如下
#
# ipc_sem
#
# pthread_cancel
#
# pthread_cond
#
# pthread_mutex
#
# pthread_mutex_pi
#
# sem_init
#
# socket
#
# flockfile-list
#
# malloc-brk-fail
#
# malloc-oom
#
# pthread_cond-smasher
#
# pthread_cond_wait-cancel_ignored
#
# pthread_condattr_setclock
#
# pthread_create-oom
#
# raise-race
#
# setenv-oom
#
# ipc_sem-static
#
# pthread_cancel-static
#
# pthread_cond-static
#
# pthread_mutex-static
#
# pthread_mutex_pi-static
#
# sem_init-static
#
# socket-static
#
# flockfile-list-static
#
# malloc-brk-fail-static
#
# malloc-oom-static
#
# pthread_cond-smasher-static
#
# pthread_cond_wait-cancel_ignored-static
#
# pthread_condattr_setclock-static
#
# pthread_create-oom-static
#
# raise-race-static
#
# setenv-oom-static
#
##############################################END
echo ipc_sem running
src/common/runtest.exe -w '' src/functional/ipc_sem.exe >src/functional/ipc_sem.err && echo ipc_sem successed || echo ipc_sem failed
echo
 
echo run pthread_cancel
src/common/runtest.exe -w '' src/functional/pthread_cancel.exe >src/functional/pthread_cancel.err || echo pthread_cancel failed
echo

echo run pthread_cond
src/common/runtest.exe -w '' src/functional/pthread_cond.exe >src/functional/pthread_cond.err || echo pthread_cond failed
echo

echo run pthread_mutex
src/common/runtest.exe -w '' src/functional/pthread_mutex.exe >src/functional/pthread_mutex.err || echo pthread_mutex failed
echo

echo run pthread_mutex_pi
src/common/runtest.exe -w '' src/functional/pthread_mutex_pi.exe >src/functional/pthread_mutex_pi.err || echo pthread_mutex_pi failed
 
echo
echo run sem_init
src/common/runtest.exe -w '' src/functional/sem_init.exe >src/functional/sem_init.err || echo sem_init failed
echo

echo run socket
src/common/runtest.exe -w '' src/functional/socket.exe >src/functional/socket.err || echo socket failed 
echo

echo run flockfile-list
src/common/runtest.exe -w '' src/regression/flockfile-list.exe >src/regression/flockfile-list.err || echo flockfile-list failed 
echo

echo run malloc-brk-fail
src/common/runtest.exe -w '' src/regression/malloc-brk-fail.exe >src/regression/malloc-brk-fail.err || echo malloc-brk-fail failed
echo

echo run malloc-oom
src/common/runtest.exe -w '' src/regression/malloc-oom.exe >src/regression/malloc-oom.err || echo malloc-oom failed
echo

echo run pthread_cond-smasher
src/common/runtest.exe -w '' src/regression/pthread_cond-smasher.exe >src/regression/pthread_cond-smasher.err || echo pthread_cond-smasher failed
echo

echo run pthread_cond_wait-cancel_ignored
src/common/runtest.exe -w '' src/regression/pthread_cond_wait-cancel_ignored.exe >src/regression/pthread_cond_wait-cancel_ignored.err || echo pthread_cond_wait-cancel_ignored failed
echo

echo run pthread_condattr_setclock
src/common/runtest.exe -w '' src/regression/pthread_condattr_setclock.exe >src/regression/pthread_condattr_setclock.err || echo pthread_condattr_setclock failed
echo

echo run pthread_create-oom
src/common/runtest.exe -w '' src/regression/pthread_create-oom.exe >src/regression/pthread_create-oom.err || echo pthread_create-oom failed
echo
 
echo run raise-race
src/common/runtest.exe -w '' src/regression/raise-race.exe >src/regression/raise-race.err || echo raise-race failed
echo

echo run setenv-oom
src/common/runtest.exe -w '' src/regression/setenv-oom.exe >src/regression/setenv-oom.err || echo setenv-oom failed
echo

echo run ipc_sem-static
src/common/runtest.exe -w '' src/functional/ipc_sem-static.exe >src/functional/ipc_sem-static.err || echo ipc_sem-static failed
echo

echo run pthread_cancel-static
src/common/runtest.exe -w '' src/functional/pthread_cancel-static.exe >src/functional/pthread_cancel-static.err || echo pthread_cancel-static failed
echo

echo run pthread_cond-static
src/common/runtest.exe -w '' src/functional/pthread_cond-static.exe >src/functional/pthread_cond-static.err || echo pthread_cond-static failed
echo

echo run pthread_mutex-static
src/common/runtest.exe -w '' src/functional/pthread_mutex-static.exe >src/functional/pthread_mutex-static.err || echo pthread_mutex-static failed
echo

echo run pthread_mutex_pi-static
src/common/runtest.exe -w '' src/functional/pthread_mutex_pi-static.exe >src/functional/pthread_mutex_pi-static.err || echo pthread_mutex_pi-static failed
echo
 
echo run sem_init-static
src/common/runtest.exe -w '' src/functional/sem_init-static.exe >src/functional/sem_init-static.err || echo sem_init-static failed
echo

echo run socket-static
src/common/runtest.exe -w '' src/functional/socket-static.exe >src/functional/socket-static.err || echo socket-static failed 
echo

echo run wcstol-static
src/common/runtest.exe -w '' src/functional/wcstol-static.exe >src/functional/wcstol-static.err || echo wcstol-static failed 
echo

echo run flockfile-list-static
src/common/runtest.exe -w '' src/regression/flockfile-list-static.exe >src/regression/flockfile-list-static.err || echo flockfile-list-static failed
echo

echo run malloc-brk-fail-static
src/common/runtest.exe -w '' src/regression/malloc-brk-fail-static.exe >src/regression/malloc-brk-fail-static.err || echo malloc-brk-fail-static failed
echo

echo run malloc-oom-static
src/common/runtest.exe -w '' src/regression/malloc-oom-static.exe >src/regression/malloc-oom-static.err || echo malloc-oom-static failed 
echo

echo run pthread_cond-smasher-static
src/common/runtest.exe -w '' src/regression/pthread_cond-smasher-static.exe >src/regression/pthread_cond-smasher-static.err || echo pthread_cond-smasher-static failed
echo

echo run pthread_cond_wait-cancel_ignored-static
src/common/runtest.exe -w '' src/regression/pthread_cond_wait-cancel_ignored-static.exe >src/regression/pthread_cond_wait-cancel_ignored-static.err || echo pthread_cond_wait-cancel_ignored-static failed
echo

echo run pthread_condattr_setclock-static
src/common/runtest.exe -w '' src/regression/pthread_condattr_setclock-static.exe >src/regression/pthread_condattr_setclock-static.err || echo pthread_condattr_setclock-static failed
echo

echo run pthread_create-oom-static
src/common/runtest.exe -w '' src/regression/pthread_create-oom-static.exe >src/regression/pthread_create-oom-static.err || echo pthread_create-oom-static failed
echo

echo run raise-race-static
src/common/runtest.exe -w '' src/regression/raise-race-static.exe >src/regression/raise-race-static.err || echo raise-race-static failed 
echo

echo run setenv-oom-static
src/common/runtest.exe -w '' src/regression/setenv-oom-static.exe >src/regression/setenv-oom-static.err || echo setenv-oom-static failed
echo
