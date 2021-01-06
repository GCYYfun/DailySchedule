syscall 的 对比


|Now  |New  |Change
|---------|---------|
|Row1     |         |
|Row2     |         |



       let ret = match sys_type {

            // 1 Handles 4/4
            Sys::HANDLE_CLOSE => self.sys_handle_close(a0 as _),
            Sys::HANDLE_CLOSE_MANY => self.sys_handle_close_many(a0.into(), a1 as _),
            Sys::HANDLE_DUPLICATE => self.sys_handle_duplicate(a0 as _, a1 as _, a2.into()),
            Sys::HANDLE_REPLACE => self.sys_handle_replace(a0 as _, a1 as _, a2.into()),

            // 2 Objects 9/10
            Sys::OBJECT_GET_CHILD => {
                self.sys_object_get_child(a0 as _, a1 as _, a2 as _, a3.into())
            }
            Sys::OBJECT_GET_INFO => {
                self.sys_object_get_info(a0 as _, a1 as _, a2 as _, a3 as _, a4.into(), a5.into())
            }
            Sys::OBJECT_GET_PROPERTY => {
                self.sys_object_get_property(a0 as _, a1 as _, a2 as _, a3 as _)
            }
            Sys::OBJECT_SET_PROPERTY => {
                self.sys_object_set_property(a0 as _, a1 as _, a2 as _, a3 as _)
            }
            Sys::OBJECT_SIGNAL => self.sys_object_signal(a0 as _, a1 as _, a2 as _),
            Sys::OBJECT_SIGNAL_PEER => self.sys_object_signal_peer(a0 as _, a1 as _, a2 as _),
            Sys::OBJECT_WAIT_ONE => {
                self.sys_object_wait_one(a0 as _, a1 as _, a2.into(), a3.into())
                    .await
            }
            Sys::OBJECT_WAIT_MANY => {
                self.sys_object_wait_many(a0.into(), a1 as _, a2.into())
                    .await
            }
            Sys::OBJECT_WAIT_ASYNC => {
                self.sys_object_wait_async(a0 as _, a1 as _, a2 as _, a3 as _, a4 as _)
            }


            // 3 Threads 4/5
            Sys::THREAD_CREATE => {
                self.sys_thread_create(a0 as _, a1.into(), a2 as _, a3 as _, a4.into())
            }
            Sys::THREAD_START => self.sys_thread_start(a0 as _, a1 as _, a2 as _, a3 as _, a4 as _),
            Sys::THREAD_WRITE_STATE => {
                self.sys_thread_write_state(a0 as _, a1 as _, a2.into(), a3 as _)
            }
            Sys::THREAD_EXIT => self.sys_thread_exit(),


            // 4 Processes 5/5
            Sys::PROCESS_CREATE => {
                self.sys_process_create(a0 as _, a1.into(), a2 as _, a3 as _, a4.into(), a5.into())
            }
            Sys::PROCESS_START => {
                self.sys_process_start(a0 as _, a1 as _, a2 as _, a3 as _, a4 as _, a5 as _)
            }
            Sys::PROCESS_READ_MEMORY => {
                self.sys_process_read_memory(a0 as _, a1 as _, a2.into(), a3 as _, a4.into())
            }
            Sys::PROCESS_WRITE_MEMORY => {
                self.sys_process_write_memory(a0 as _, a1 as _, a2.into(), a3 as _, a4.into())
            }
            Sys::PROCESS_EXIT => self.sys_process_exit(a0 as _),


            // 5 Jobs 3/3
            Sys::JOB_CREATE => self.sys_job_create(a0 as _, a1 as _, a2.into()),
            Sys::JOB_SET_POLICY => self.sys_job_set_policy(a0 as _, a1 as _, a2 as _, a3, a4 as _),
            Sys::JOB_SET_CRITICAL => self.sys_job_set_critical(a0 as _, a1 as _, a2 as _),


            // 6 Tasks (Thread, Process, or Job) 3/3
            Sys::TASK_CREATE_EXCEPTION_CHANNEL => {
                self.sys_create_exception_channel(a0 as _, a1 as _, a2.into())
            }
            Sys::TASK_KILL => self.sys_task_kill(a0 as _),
            Sys::TASK_SUSPEND | Sys::TASK_SUSPEND_TOKEN => {
                self.sys_task_suspend_token(a0 as _, a1.into())
            }


            // 7 Profiles 0/1


            // 8 Exceptions 2/2
            Sys::EXCEPTION_GET_THREAD => self.sys_exception_get_thread(a0 as _, a1.into()),
            Sys::EXCEPTION_GET_PROCESS => self.sys_exception_get_process(a0 as _, a1.into()),
            
            // 9 Channels 5/7 *2
            Sys::CHANNEL_CREATE => self.sys_channel_create(a0 as _, a1.into(), a2.into()),
            Sys::CHANNEL_READ => self.sys_channel_read(
                a0 as _,
                a1 as _,
                a2.into(),
                a3 as _,
                a4 as _,
                a5 as _,
                a6.into(),
                a7.into(),
                false,
            ),
            Sys::CHANNEL_READ_ETC => self.sys_channel_read(
                a0 as _,
                a1 as _,
                a2.into(),
                a3 as _,
                a4 as _,
                a5 as _,
                a6.into(),
                a7.into(),
                true,
            ),
            Sys::CHANNEL_WRITE => {
                self.sys_channel_write(a0 as _, a1 as _, a2.into(), a3 as _, a4.into(), a5 as _)
            }
            Sys::CHANNEL_WRITE_ETC => {
                self.sys_channel_write_etc(a0 as _, a1 as _, a2.into(), a3 as _, a4.into(), a5 as _)
            }
            Sys::CHANNEL_CALL_NORETRY => {
                self.sys_channel_call_noretry(
                    a0 as _,
                    a1 as _,
                    a2.into(),
                    a3.into(),
                    a4.into(),
                    a5.into(),
                )
                .await
            }
            Sys::CHANNEL_CALL_FINISH => {
                self.sys_channel_call_finish(a0.into(), a1.into(), a2.into(), a3.into())
            }


            // 10 Sockets 4/4
            Sys::SOCKET_CREATE => self.sys_socket_create(a0 as _, a1.into(), a2.into()),
            Sys::SOCKET_WRITE => {
                self.sys_socket_write(a0 as _, a1 as _, a2.into(), a3 as _, a4.into())
            }
            Sys::SOCKET_READ => {
                self.sys_socket_read(a0 as _, a1 as _, a2.into(), a3 as _, a4.into())
            }
            Sys::SOCKET_SHUTDOWN => self.sys_socket_shutdown(a0 as _, a1 as _),
            // 11 Stream 6/6
            Sys::STREAM_CREATE => self.sys_stream_create(a0 as _, a1 as _, a2 as _, a3.into()),
            Sys::STREAM_WRITEV => {
                self.sys_stream_writev(a0 as _, a1 as _, a2.into(), a3 as _, a4.into())
            }
            Sys::STREAM_WRITEV_AT => {
                self.sys_stream_writev_at(a0 as _, a1 as _, a2 as _, a3.into(), a4 as _, a5.into())
            }
            Sys::STREAM_READV => {
                self.sys_stream_readv(a0 as _, a1 as _, a2.into(), a3 as _, a4.into())
            }
            Sys::STREAM_READV_AT => {
                self.sys_stream_readv_at(a0 as _, a1 as _, a2 as _, a3.into(), a4 as _, a5.into())
            }
            Sys::STREAM_SEEK => self.sys_stream_seek(a0 as _, a1 as _, a2 as _, a3.into()),
            // 12 Fifos 3/3
            Sys::FIFO_CREATE => {
                self.sys_fifo_create(a0 as _, a1 as _, a2 as _, a3.into(), a4.into())
            }
            Sys::FIFO_READ => self.sys_fifo_read(a0 as _, a1 as _, a2.into(), a3 as _, a4.into()),
            Sys::FIFO_WRITE => self.sys_fifo_write(a0 as _, a1 as _, a2.into(), a3 as _, a4.into()),


            // 13 Events and Event Pairs 2/3
            Sys::EVENT_CREATE => self.sys_event_create(a0 as _, a1.into()),
            Sys::EVENTPAIR_CREATE => self.sys_eventpair_create(a0 as _, a1.into(), a2.into()),


            // 14 Ports 3/4
            Sys::PORT_CREATE => self.sys_port_create(a0 as _, a1.into()),
            Sys::PORT_WAIT => self.sys_port_wait(a0 as _, a1.into(), a2.into()).await,
            Sys::PORT_QUEUE => self.sys_port_queue(a0 as _, a1.into()),
            Sys::PORT_CANCEL => {
                error!("Skip PORT_CANCEL");
                Ok(())
            }


            // 15 Futexes 4/3
            Sys::FUTEX_WAIT => {
                self.sys_futex_wait(a0.into(), a1 as _, a2 as _, a3.into())
                    .await
            }
            Sys::FUTEX_WAKE => self.sys_futex_wake(a0.into(), a1 as _),
            Sys::FUTEX_REQUEUE => {
                self.sys_futex_requeue(a0.into(), a1 as _, a2 as _, a3.into(), a4 as _, a5 as _)
            }
            Sys::FUTEX_WAKE_SINGLE_OWNER => self.sys_futex_wake_single_owner(a0.into()),


            // 16 Virtual Memory Objects (VMOs) 11/10 
            Sys::VMO_CREATE => self.sys_vmo_create(a0 as _, a1 as _, a2.into()),
            Sys::VMO_READ => self.sys_vmo_read(a0 as _, a1.into(), a2 as _, a3 as _),
            Sys::VMO_WRITE => self.sys_vmo_write(a0 as _, a1.into(), a2 as _, a3 as _),
            Sys::VMO_GET_SIZE => self.sys_vmo_get_size(a0 as _, a1.into()),
            Sys::VMO_SET_SIZE => self.sys_vmo_set_size(a0 as _, a1 as _),
            Sys::VMO_OP_RANGE => {
                self.sys_vmo_op_range(a0 as _, a1 as _, a2 as _, a3 as _, a4.into(), a5 as _)
            }
            Sys::VMO_REPLACE_AS_EXECUTABLE => {
                self.sys_vmo_replace_as_executable(a0 as _, a1 as _, a2.into())
            }
            Sys::VMO_CREATE_CHILD => {
                self.sys_vmo_create_child(a0 as _, a1 as _, a2 as _, a3 as _, a4.into())
            }
            Sys::VMO_CREATE_PHYSICAL => {
                self.sys_vmo_create_physical(a0 as _, a1 as _, a2 as _, a3.into())
            }
            Sys::VMO_CREATE_CONTIGUOUS => {
                self.sys_vmo_create_contiguous(a0 as _, a1 as _, a2 as _, a3.into())
            }
            Sys::VMO_SET_CACHE_POLICY => self.sys_vmo_cache_policy(a0 as _, a1 as _),


            // 17 Virtual Memory Address Regions (VMARs) 5/6
            Sys::VMAR_MAP => self.sys_vmar_map(
                a0 as _,
                a1 as _,
                a2 as _,
                a3 as _,
                a4 as _,
                a5 as _,
                a6.into(),
            ),
            Sys::VMAR_UNMAP => self.sys_vmar_unmap(a0 as _, a1 as _, a2 as _),
            Sys::VMAR_ALLOCATE => {
                self.sys_vmar_allocate(a0 as _, a1 as _, a2 as _, a3 as _, a4.into(), a5.into())
            }
            Sys::VMAR_PROTECT => self.sys_vmar_protect(a0 as _, a1 as _, a2 as _, a3 as _),
            Sys::VMAR_DESTROY => self.sys_vmar_destroy(a0 as _),


            // 18 Userspace Pagers 0/5


            // 19 Cryptographically Secure RNG 0/2
            Sys::CPRNG_DRAW_ONCE => self.sys_cprng_draw_once(a0.into(), a1 as _),


            // 20 Time 0/7
            Sys::NANOSLEEP => self.sys_nanosleep(a0.into()).await,
            Sys::CLOCK_CREATE => self.sys_clock_create(a0 as _, a1.into(), a2.into()),
            Sys::CLOCK_GET => self.sys_clock_get(a0 as _, a1.into()),
            Sys::CLOCK_READ => self.sys_clock_read(a0 as _, a1.into()),
            Sys::CLOCK_ADJUST => self.sys_clock_adjust(a0 as _, a1 as _, a2 as _),
            Sys::CLOCK_UPDATE => self.sys_clock_update(a0 as _, a1 as _, a2.into()),


            // 21 Timers 3/3
            Sys::TIMER_CREATE => self.sys_timer_create(a0 as _, a1 as _, a2.into()),
            Sys::TIMER_SET => self.sys_timer_set(a0 as _, a1.into(), a2 as _),
            Sys::TIMER_CANCEL => self.sys_timer_cancel(a0 as _),
            // 22 Hypervisor guests /2 
            #[cfg(feature = "hypervisor")]
            Sys::GUEST_CREATE => self.sys_guest_create(a0 as _, a1 as _, a2.into(), a3.into()),
            #[cfg(feature = "hypervisor")]
            Sys::GUEST_SET_TRAP => {
                self.sys_guest_set_trap(a0 as _, a1 as _, a2 as _, a3 as _, a4 as _, a5 as _)
            }


            // 23 Virtual CPUs /6
            #[cfg(feature = "hypervisor")]
            Sys::VCPU_CREATE => self.sys_vcpu_create(a0 as _, a1 as _, a2 as _, a3.into()),
            #[cfg(feature = "hypervisor")]
            Sys::VCPU_RESUME => self.sys_vcpu_resume(a0 as _, a1.into()),
            #[cfg(feature = "hypervisor")]
            Sys::VCPU_INTERRUPT => self.sys_vcpu_interrupt(a0 as _, a1 as _),
            #[cfg(feature = "hypervisor")]
            Sys::VCPU_READ_STATE => self.sys_vcpu_read_state(a0 as _, a1 as _, a2.into(), a3 as _),
            #[cfg(feature = "hypervisor")]
            Sys::VCPU_WRITE_STATE => self.sys_vcpu_write_state(a0 as _, a1 as _, a2, a3 as _),


            // 24 Global system information /5


            // 25 Debug Logging /6
            Sys::DEBUG_READ => {
                self.sys_debug_read(a0 as _, a1.into(), a2 as _, a3.into())
                    .await
            }
            Sys::DEBUG_WRITE => self.sys_debug_write(a0.into(), a1 as _),
            Sys::DEBUGLOG_CREATE => self.sys_debuglog_create(a0 as _, a1 as _, a2.into()),
            Sys::DEBUGLOG_WRITE => self.sys_debuglog_write(a0 as _, a1 as _, a2.into(), a3 as _),
            Sys::DEBUGLOG_READ => self.sys_debuglog_read(a0 as _, a1 as _, a2.into(), a3 as _),
            Sys::RESOURCE_CREATE => self.sys_resource_create(
                a0 as _,
                a1 as _,
                a2 as _,
                a3 as _,
                a4.into(),
                a5 as _,
                a6.into(),
            ),
            // 26 Multi-function 2/2
            Sys::VMAR_UNMAP_HANDLE_CLOSE_THREAD_EXIT => self
                .sys_vmar_unmap(a0 as _, a1 as _, a2 as _)
                .and_then(|_| {
                    let _ = self.sys_handle_close(a3 as _);
                    self.sys_thread_exit()
                }),
            Sys::FUTEX_WAKE_HANDLE_CLOSE_THREAD_EXIT => {
                // atomic_store_explicit(value_ptr, new_value, memory_order_release)
                UserInPtr::<AtomicI32>::from(a0)
                    .as_ref()
                    .unwrap()
                    .store(a2 as i32, Ordering::Release);
                let _ = self.sys_futex_wake(a0.into(), a1 as _);
                let _ = self.sys_handle_close(a3 as _);
                self.sys_thread_exit()
            }
            // 27 System
            Sys::SYSTEM_GET_EVENT => self.sys_system_get_event(a0 as _, a1 as _, a2.into()),
            // 28 DDK

            // 29 Display drivers
            // 30 Tracing
            // 31 Others/Work in progress  /14
 



```
    // 1 Handles 4/4

    // 2 Objects 9/10
 
    Sys::OBJECT_SET_PROFILE => unimplemented!("object_set_property"),


    // 3 Threads 4/5

    Sys::THREAD_READ_STATE => {
        self.sys_thread_read_state(a0 as _, a1 as _, a2.into(), a3 as _)
    }


    // 4 Processes 5/5


    // 5 Jobs 3/3
 
    // 6 Tasks (Thread, Process, or Job) 3/3

    // 7 Profiles 0/1
    Sys::PROFILE_CREATE => unimplemented!("profile_create"),

    // 8 Exceptions 2/2


    // 9 Channels 5/7
    Sys::CHANNEL_CALL => unimplemented!("channel_call")
    Sys::CHANNEL_CALL_ETC => unimplemented!("channel_call_ETC")


    // 10 Sockets 4/4


    // 11 Stream 6/6


    // 12 Fifos 3/3

    // 13 Events and Event Pairs 3/3


    // 14 Ports 3/4
    Sys::PORT_CANCEL => {
        error!("Skip PORT_CANCEL");
        Ok(())
    }

    // 15 Futexes 4/3



    // 16 Virtual Memory Objects (VMOs) 11/10

    // 17 Virtual Memory Address Regions (VMARs) 5/6

    Sys::VMAR_OP_RANGE => unimplemented!("vmar_op_range"),


    // 18 Userspace Pagers 0/5
    Sys::PAGER_CREATE => unimplemented!("pager_create"),
    Sys::PAGER_CREATE_VMO => unimplemented!("pager_create_vmo"),
    Sys::PAGER_DETACH_VMO => unimplemented!("pager_detach_vmo"),
    Sys::PAGER_SUPPLY_PAGES => unimplemented!("pager_supply_pages"),
    Sys::PAGER_OP_RANGE => unimplemented!("pager_op_range"),

    // 19 Cryptographically Secure RNG 0/2
    Sys::CPRNG_ADD_ENTROPY => unimplemented!("cprng_add_entropy"),
    Sys::CPRNG_DRAW => unimplemented!("cprng_draw")

    // 20 Time 0/7

    Sys::CLOCK_GET_MONOTONIC => unimplemented!("clock_get_monotonic"),
    Sys::TICKS_GET => unimplemented!("ticks_get"),
    Sys::TICKS_PER_SECOND => unimplemented!("ticks_per_second"),
    Sys::DEADLINE_AFTER => unimplemented!("deadline_after"),


    // 21 Timers 3/3

    // 22 Hypervisor guests 2/2


    // 23 Virtual CPUs 5/6

    Sys::INTERRUPT_BIND_VCPU => unimplemented!("interrupt_bind_vcpu"), 

    // 24 Global system information 0/5
    Sys::SYSTEM_GET_DCACHE_LINE_SIZE => unimplemented!("system_get_dcache_line_size"),
    Sys::SYSTEM_GET_FEATURES => unimplemented!("system_get_features"),
    Sys::SYSTEM_GET_NUM_CPUS => unimplemented!("system_get_num_cpus"),
    Sys::SYSTEM_GET_PHYSMEM => unimplemented!("system_get_physmem"),
    Sys::SYSTEM_GET_VERSION_STRING => unimplemented!("system_get_version_string"),

    // 25 Debug Logging 5/6

    Sys::DEBUG_SEND_COMMAND => unimplemented!("debug_send_command"),

    // 26 Multi-function 2/2


    // 27 System 0/3
    Sys::SYSTEM_MEXEC => unimplemented!("system_mexec"),
    Sys::SYSTEM_MEXEC_PAYLOAD_GET => unimplemented!("system_mexec_payload_get"),
    Sys::SYSTEM_POWERCTL => unimplemented!("system_powerctl"),

    // 28 DDK 13/14
    Sys::CACHE_FLUSH => unimplemented!("cache_flush"),


    Sys::SMC_CALL => unimplemented!("smc_call"),

    // 29 Display drivers
    Sys::FRAMEBUFFER_GET_INFO => unimplemented!("framebuffer_get_info"),
    Sys::FRAMEBUFFER_SET_RANGE => unimplemented!("framebugger_set_range"),

    // 30 Tracing
    Sys::KTRACE_READ => unimplemented!("ktrace_control"),
    Sys::KTRACE_CONTROL => unimplemented!("ktrace_read"),
    Sys::KTRACE_WRITE => unimplemented!("ktrace_write"),
    Sys::MTRACE_CONTROL => unimplemented!("mtrace_control"),

    // 31 Others/Work in progress  2/14
    Sys::IOPORTS_RELEASE => unimplemented!("ioports_release"),
    Sys::PCI_RESET_DEVICE => unimplemented!("pci_reset_device"),
```