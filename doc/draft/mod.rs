

/// All context needed for syscall
struct Syscall<'a> {
    pub thread: &'a Arc<Thread>,
    pub context: &'a mut UserContext,
    /// Set `true` to exit current task.
    pub exit: bool,
}

impl Syscall<'_> {
    /// Get current process
    /// spinlock is tend to deadlock, use busy waiting
    pub fn process(&self) -> MutexGuard<'_, Process, SpinNoIrq> {
        self.thread.proc.busy_lock()
    }

    /// Get current virtual memory
    pub fn vm(&self) -> MutexGuard<'_, MemorySet, SpinNoIrq> {
        self.thread.vm.lock()
    }

    /// System call dispatcher
    // This #[deny(unreachable_patterns)] checks if each match arm is defined
    // See discussion in https://github.com/oscourse-tsinghua/rcore_plus/commit/17e644e54e494835f1a49b34b80c2c4f15ed0dbe.
    #[deny(unreachable_patterns)]
    async fn syscall(&mut self, id: usize, args: [usize; 6]) -> isize {
        #[cfg(feature = "profile")]
        let begin_time = unsafe { core::arch::x86_64::_rdtsc() };
        let cid = cpu::id();
        let pid = self.process().pid.clone();
        let tid = self.thread.tid;
        if !pid.is_init() {
            // we trust pid 0 process
            debug!("{}:{}:{} syscall id {} begin", cid, pid, tid, id);
        }

        // use platform-specific syscal numbers
        // See https://filippo.io/linux-syscall-table/
        // And https://fedora.juszkiewicz.com.pl/syscalls.html.
        let ret = match id {
            // file
            SYS_FCHMOD => self.unimplemented("fchmod", Ok(0)),
            SYS_FCHMODAT => self.unimplemented("fchmodat", Ok(0)),
            SYS_FCHOWN => self.unimplemented("fchown", Ok(0)),
            SYS_FCHOWNAT => self.unimplemented("fchownat", Ok(0)),
            SYS_SET_ROBUST_LIST => self.unimplemented("set_robuts_list", Ok(0)),
            SYS_GET_ROBUST_LIST => self.unimplemented("get_robust_list", Ok(0)),

            // io multiplexing
            // ignore sigmask
            SYS_EVENTFD2 => self.unimplemented("eventfd2", Err(SysError::EACCES)),

            SYS_SOCKETPAIR => self.unimplemented("socketpair", Err(SysError::EACCES)),
            // file system
            SYS_STATFS => self.unimplemented("statfs", Err(SysError::EACCES)),
            SYS_FSTATFS => self.unimplemented("fstatfs", Err(SysError::EACCES)),
            SYS_MOUNT => self.unimplemented("mount", Err(SysError::EACCES)),
            SYS_UMOUNT2 => self.unimplemented("umount2", Err(SysError::EACCES)),

            // memory
            SYS_BRK => self.unimplemented("brk", Err(SysError::ENOMEM)),
            SYS_MADVISE => self.unimplemented("madvise", Ok(0)),

            // signal
            SYS_RT_SIGRETURN => self.sys_rt_sigreturn(),
            SYS_KILL => self.sys_kill(args[0] as isize, args[1]),

            // schedule


            // socket
            SYS_SOCKET => self.sys_socket(args[0], args[1], args[2]),
            SYS_CONNECT => self.sys_connect(args[0], args[1] as *const SockAddr, args[2]),
            SYS_ACCEPT => self.sys_accept(args[0], args[1] as *mut SockAddr, args[2] as *mut u32),
            SYS_ACCEPT4 => self.sys_accept(args[0], args[1] as *mut SockAddr, args[2] as *mut u32), // use accept for accept4
            SYS_SENDTO => self.sys_sendto(
                args[0],
                args[1] as *const u8,
                args[2],
                args[3],
                args[4] as *const SockAddr,
                args[5],
            ),
            SYS_RECVFROM => self.sys_recvfrom(
                args[0],
                args[1] as *mut u8,
                args[2],
                args[3],
                args[4] as *mut SockAddr,
                args[5] as *mut u32,
            ),
            //        SYS_SENDMSG => self.sys_sendmsg(),
            SYS_RECVMSG => self.sys_recvmsg(args[0], args[1] as *mut MsgHdr, args[2]),
            SYS_SHUTDOWN => self.sys_shutdown(args[0], args[1]),
            SYS_BIND => self.sys_bind(args[0], args[1] as *const SockAddr, args[2]),
            SYS_LISTEN => self.sys_listen(args[0], args[1]),
            SYS_GETSOCKNAME => {
                self.sys_getsockname(args[0], args[1] as *mut SockAddr, args[2] as *mut u32)
            }
            SYS_GETPEERNAME => {
                self.sys_getpeername(args[0], args[1] as *mut SockAddr, args[2] as *mut u32)
            }
            SYS_SETSOCKOPT => {
                self.sys_setsockopt(args[0], args[1], args[2], args[3] as *const u8, args[4])
            }
            SYS_GETSOCKOPT => self.sys_getsockopt(
                args[0],
                args[1],
                args[2],
                args[3] as *mut u8,
                args[4] as *mut u32,
            ),

            // process

            SYS_TKILL => self.sys_tkill(args[0], args[1]),

            // time
            SYS_SETITIMER => self.unimplemented("setitimer", Ok(0)),

            // sem
            #[cfg(not(target_arch = "mips"))]
            SYS_SEMGET => self.sys_semget(args[0], args[1], args[2]),
            #[cfg(not(target_arch = "mips"))]
            SYS_SEMOP => {
                self.sys_semop(args[0], UserInPtr::from(args[1]), args[2])
                    .await
            }
            #[cfg(not(target_arch = "mips"))]
            SYS_SEMCTL => self.sys_semctl(args[0], args[1], args[2], args[3]),

            // msg
            #[cfg(not(target_arch = "mips"))]
            SYS_MSGGET => self.unimplemented("msgget", Ok(0)),
            #[cfg(not(target_arch = "mips"))]
            SYS_MSGCTL => self.unimplemented("msgctl", Ok(0)),

            // shm
            #[cfg(not(target_arch = "mips"))]
            SYS_SHMGET => self.sys_shmget(args[0], args[1], args[2]),
            #[cfg(not(target_arch = "mips"))]
            SYS_SHMAT => self.sys_shmat(args[0], args[1], args[2]),
            #[cfg(not(target_arch = "mips"))]
            SYS_SHMDT => self.sys_shmdt(args[0], args[1], args[2]),
            // system
            SYS_UMASK => self.unimplemented("umask", Ok(0o777)),
            //        SYS_GETRLIMIT => self.sys_getrlimit(),
            SYS_SETRLIMIT => self.unimplemented("setrlimit", Ok(0)),
            SYS_GETUID => self.unimplemented("getuid", Ok(0)),
            SYS_GETGID => self.unimplemented("getgid", Ok(0)),
            SYS_SETUID => self.unimplemented("setuid", Ok(0)),
            SYS_GETEUID => self.unimplemented("geteuid", Ok(0)),
            SYS_GETEGID => self.unimplemented("getegid", Ok(0)),
            SYS_SETSID => self.unimplemented("setsid", Ok(0)),
            SYS_GETPGID => self.sys_getpgid(args[0]),
            SYS_SETPGID => self.sys_setpgid(args[0], args[1]),
            SYS_GETGROUPS => self.unimplemented("getgroups", Ok(0)),
            SYS_RT_SIGTIMEDWAIT => self.unimplemented("rt_sigtimedwait", Ok(0)),
            SYS_SETGROUPS => self.unimplemented("setgroups", Ok(0)),
            SYS_SETRESUID => self.unimplemented("setresuid", Ok(0)),
            SYS_SETRESGID => self.unimplemented("setresgid", Ok(0)),
            SYS_SETGID => self.unimplemented("setgid", Ok(0)),
            SYS_SETPRIORITY => self.sys_set_priority(args[0]),
            SYS_PRCTL => self.unimplemented("prctl", Ok(0)),
            SYS_MEMBARRIER => self.unimplemented("membarrier", Ok(0)),
            SYS_REBOOT => self.sys_reboot(
                args[0] as u32,
                args[1] as u32,
                args[2] as u32,
                args[3] as *const u8,
            ),
            SYS_RT_SIGQUEUEINFO => self.unimplemented("rt_sigqueueinfo", Ok(0)),

            // kernel module
            SYS_INIT_MODULE => {
                self.sys_init_module(args[0] as *const u8, args[1] as usize, args[2] as *const u8)
            }
            SYS_FINIT_MODULE => {
                debug!("[LKM] sys_finit_module is unimplemented");
                Err(SysError::ENOSYS)
            }
            SYS_DELETE_MODULE => self.sys_delete_module(args[0] as *const u8, args[1] as u32),

            // custom
            SYS_MAP_PCI_DEVICE => self.sys_map_pci_device(args[0], args[1]),
            SYS_GET_PADDR => {
                self.sys_get_paddr(args[0] as *const u64, args[1] as *mut u64, args[2])
            }

            _ => {
                let ret = match () {
                    #[cfg(target_arch = "x86_64")]
                    () => self.x86_64_syscall(id, args).await,
                    #[cfg(target_arch = "mips")]
                    () => self.mips_syscall(id, args).await,
                    #[cfg(all(not(target_arch = "x86_64"), not(target_arch = "mips")))]
                    () => None,
                };
                if let Some(ret) = ret {
                    ret
                } else {
                    error!("unknown syscall id: {}, args: {:x?}", id, args);
                    todo!()
                }
            }
        };

    }

    #[cfg(target_arch = "x86_64")]
    async fn x86_64_syscall(&mut self, id: usize, args: [usize; 6]) -> Option<SysResult> {
        let ret = match id {
            SYS_ALARM => self.unimplemented("alarm", Ok(0)),
            SYS_SYMLINK => self.sys_symlink(args[0] as *const u8, args[1] as *const u8),
            SYS_EPOLL_CREATE => self.sys_epoll_create(args[0]),
            SYS_EPOLL_WAIT => {
                self.sys_epoll_wait(args[0], args[1] as *mut EpollEvent, args[2], args[3])
            }
            _ => return None,
        };
        Some(ret)
    }
}
