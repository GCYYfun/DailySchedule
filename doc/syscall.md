# Zircon Syscall


## 内核对象划分

| syscall type                           | count |
|----------------------------------------|-------|
| Handles                                | 4     |
| Objects                                | 10    |
| Threads                                | 5     |
| Processes                              | 5     |
| Jobs                                   | 3     |
| Tasks                                  | 3     |
| Profiles                               | 1     |
| Exceptions                             | 2     |
| Channels                               | 6     |
| Sockets                                | 4     |
| Stream                                 | 6     |
| Fifos                                  | 3     |
| Events and Event Pairs                 | 3     |
| Ports                                  | 4     |
| Futexes                                | 3     |
| Virtual Memory Objects (VMOs)          | 10    |
| Virtual Memory Address Regions (VMARs) | 6     |
| Userspace Pagers                       | 5     |
| Cryptographically Secure RNG           | 2     |
| Time                                   | 7     |
| Timers                                 | 3     |
| Hypervisor guests                      | 2     |
| Virtual CPUs                           | 6     |
| Global system information              | 5     |
| Debug Logging                          | 6     |
| Multi-function                         | 2     |
| System                                 | 3     |
| DDK                                    | 14    |
| Display drivers                        | 2     |
| Tracing                                | 4     |
| Others/Work in progress                | 14    |

共31个Object syscall 

total = 4 + 10 + 5 + 5 + 3 + 3 + 1 + 2 + 6 + 4 + 6 + 3 + 3 + 4 + 3 + 10 + 6 + 5 + 2 + 7 + 3 + 2 + 6 + 5 + 6 + 2 + 3 + 14 + 2 + 4 + 14 = 153

## Syscall

### Handles

| id | zircon syscall    | description                                                                  | zcore |
|----|-------------------|------------------------------------------------------------------------------|-------|
| 1  | handle_close      | close a handle                                                               | ✅    |
| 2  | handle_close_many | close several handles                                                        | ✅    |
| 3  | handle_duplicate  | create a duplicate handle (optionally with reduced rights)                   | ✅    |
| 4  | handle_replace    | create a new handle (optionally with reduced rights) and destroy the old one | ✅    |

### Objects
| id | zircon syscall      | description                                       | zcore |
|----|---------------------|---------------------------------------------------|-------|
| 5  | object_get_child    | find the child of an object by its koid           |       |
| 6  | object_get_info     | obtain information about an object                |       |
| 7  | object_get_property | read an object property                           |       |
| 8  | object_set_profile  | apply a profile to a thread                       |       |
| 9  | object_set_property | modify an object property                         |       |
| 10 | object_signal       | set or clear the user signals on an object        |       |
| 11 | object_signal_peer  | set or clear the user signals in the opposite end | ✅    |
| 12 | object_wait_many    | wait for signals on multiple objects              |       |
| 13 | object_wait_one     | wait for signals on one object                    | ✅    |
| 14 | object_wait_async   | asynchronous notifications on signal change       | ✅    |

### Threads   
| id | zircon syscall     | description | zcore |
|----|--------------------|-------------|-------|
| 15 | thread_create      |             | ✅    |
| 16 | thread_exit        |             |
| 17 | thread_read_state  |             |
| 18 | thread_start       |             | ✅    |
| 19 | thread_write_state |             |

### Processes 
| id | zircon syscall       | description | zcore |
|----|----------------------|-------------|-------|
| 20 | process_create       |             | ✅    |
| 21 | process_read_memory  |             |
| 22 | process_start        |             | ✅    |
| 23 | process_write_memory |             |
| 24 | process_exit         |             |
                             
### Jobs        
| id | zircon syscall   | description | zcore |
|----|------------------|-------------|-------|
| 25 | job_create       |             | ✅    |
| 26 | job_set_critical |             |
| 27 | job_set_policy   |             |
                           
### Tasks      
| id | zircon syscall                | description | zcore |
|----|-------------------------------|-------------|-------|
| 28 | task_create_exception_channel |             |
| 29 | task_kill                     |             |
| 30 | task_suspend                  |             | ✅？   |
                            
### Profiles 
| id | zircon syscall | description | zcore |
|----|----------------|-------------|-------|
| 31 | profile_create |             |
                              
### Exceptions  
| id | zircon syscall        | description | zcore |
|----|-----------------------|-------------|-------|
| 32 | exception_get_thread  |             |
| 33 | exception_get_process |             |
                           
### Channels    
| id | zircon syscall    | description | zcore |
|----|-------------------|-------------|-------|
| 34 | channel_call      |             | ✅？   |
| 35 | channel_create    |             | ✅    |
| 36 | channel_read      |             | ✅    |
| 37 | channel_read_etc  |             |
| 38 | channel_write     |             | ✅    |
| 39 | channel_write_etc |             |
                           
### Sockets   
| id | zircon syscall  | description | zcore |
|----|-----------------|-------------|-------|
| 40 | socket_create   |             |
| 41 | socket_read     |             |
| 42 | socket_shutdown |             |
| 43 | socket_write    |             |
                             
### Stream     
| id | zircon syscall   | description | zcore |
|----|------------------|-------------|-------|
| 44 | stream_create    |             |
| 45 | stream_readv     |             |
| 46 | stream_readv_at  |             |
| 47 | stream_writev    |             |
| 48 | stream_writev_at |             |
| 49 | stream_seek      |             |
                            
### Fifos           
| id | zircon syscall | description | zcore |
|----|----------------|-------------|-------|
| 50 | fifo_create    |             |
| 51 | fifo_read      |             |
| 52 | fifo_write     |             |
                       
### Events and Event Pairs     
| id | zircon syscall   | description | zcore |
|----|------------------|-------------|-------|
| 53 | event_create     |             | ✅    |
| 54 | eventpair_create |             |
| 55 | system_get_event |             |
|    |
### Ports                   
| id | zircon syscall | description | zcore |
|----|----------------|-------------|-------|
| 56 | port_create    |             | ✅    |
| 57 | port_queue     |             |
| 58 | port_wait      |             | ✅    |
| 59 | port_cancel    |             |
               
### Futexes       
| id | zircon syscall | description | zcore |
|----|----------------|-------------|-------|
| 60 | futex_wait     |             | ✅    |
| 61 | futex_wake     |             | ✅    |
| 62 | futex_requeue  |             |
                         
### Virtual Memory Objects (VMOs)          
| id | zircon syscall            | description | zcore |
|----|---------------------------|-------------|-------|
| 63 | vmo_create                |             | ✅    |
| 64 | vmo_read                  |             | ✅    |
| 65 | vmo_write                 |             |
| 66 | vmo_create_child          |             |
| 67 | vmo_get_size              |             |
| 68 | vmo_set_size              |             | ✅    |
| 69 | vmo_op_range              |             |
| 70 | vmo_replace_as_executable |             | ✅    |
| 71 | vmo_create_physical       |             |
| 72 | vmo_set_cache_policy      |             |

### Virtual Memory Address Regions (VMARs) 
| id | zircon syscall | description | zcore |
|----|----------------|-------------|-------|
| 73 | vmar_allocate  |             | ✅    |
| 74 | vmar_map       |             | ✅    |
| 75 | vmar_unmap     |             | ✅    |
| 76 | vmar_protect   |             |
| 77 | vmar_op_range  |             |
| 78 | vmar_destroy   |             | ✅    |

### Userspace Pagers             
| id | zircon syscall     | description | zcore |
|----|--------------------|-------------|-------|
| 79 | pager_create       |             |
| 80 | pager_create_vmo   |             |
| 81 | pager_detach_vmo   |             |
| 82 | pager_supply_pages |             |
| 83 | pager_op_range     |             |

### Cryptographically Secure RNG  
| id | zircon syscall    | description | zcore |
|----|-------------------|-------------|-------|
| 84 | cprng_add_entropy |             |
| 85 | cprng_draw        |             |
         
### Time   
| id | zircon syscall      | description | zcore |
|----|---------------------|-------------|-------|
| 86 | nanosleep           |             |
| 87 | clock_get           |             |
| 88 | clock_get_monotonic |             | ✅
| 89 | ticks_get           |             |
| 90 | ticks_per_second    |             |
| 91 | deadline_after      |             |
| 92 | clock_adjust        |             |
                                
### Timers       
| id | zircon syscall | description | zcore |
|----|----------------|-------------|-------|
| 93 | timer_create   |             | ✅    |
| 94 | timer_set      |             | ✅    |
| 95 | timer_cancel   |             |
                          
### Hypervisor guests  
| id | zircon syscall | description | zcore |
|----|----------------|-------------|-------|
| 96 | guest_create   |             |
| 97 | guest_set_trap |             |
                    
### Virtual CPUs           
| id  | zircon syscall      | description | zcore |
|-----|---------------------|-------------|-------|
| 98  | vcpu_create         |             |
| 99  | vcpu_resume         |             |
| 100 | vcpu_interrupt      |             |
| 101 | vcpu_read_state     |             |
| 102 | vcpu_write_state    |             |
| 103 | interrupt_bind_vcpu |             |
                
### Global system information  
| id  | zircon syscall              | description | zcore |
|-----|-----------------------------|-------------|-------|
| 104 | system_get_dcache_line_size |             |
| 105 | system_get_features         |             |
| 106 | system_get_num_cpus         |             |
| 107 | system_get_physmem          |             |
| 108 | system_get_version_string   |             |
            
### Debug Logging  
| id  | zircon syscall     | description | zcore |
|-----|--------------------|-------------|-------|
| 109 | debuglog_create    |             | ✅    |
| 110 | debuglog_write     |             |
| 111 | debuglog_read      |             |
| 112 | debug_read         |             |
| 113 | debug_write        |             |
| 114 | debug_send_command |             |

### Multi-function 
| id  | zircon syscall                      | description | zcore |
|-----|-------------------------------------|-------------|-------|
| 115 | vmar_unmap_handle_close_thread_exit |             |
| 116 | futex_wake_handle_close_thread_exit |             |
                        
### System     
| id  | zircon syscall           | description | zcore |
|-----|--------------------------|-------------|-------|
| 117 | system_mexec             |             |
| 118 | system_mexec_payload_get |             |
| 119 | system_powerctl          |             |

### DDK                                    
| id  | zircon syscall         | description | zcore |
|-----|------------------------|-------------|-------|
| 120 | bti_create             |             |
| 121 | bti_pin                |             |
| 122 | bti_release_quarantine |             |
| 123 | cache_flush            |             |
| 124 | interrupt_ack          |             |
| 125 | interrupt_bind         |             |
| 126 | interrupt_create       |             |
| 127 | interrupt_destroy      |             |
| 128 | interrupt_trigger      |             |
| 129 | interrupt_wait         |             |
| 130 | iommu_create           |             |
| 131 | pmt_unpin              |             |
| 132 | resource_create        |             |
| 133 | smc_call               |             |

### Display drivers  
| id  | zircon syscall        | description | zcore |
|-----|-----------------------|-------------|-------|
| 134 | framebuffer_get_info  |             |
| 135 | framebugger_set_range |             |

### Tracing               
| id  | zircon syscall | description | zcore |
|-----|----------------|-------------|-------|
| 136 | ktrace_control |             |
| 137 | ktrace_read    |             |
| 138 | ktrace_write   |             |
| 139 | mtrace_control |             |


### Others/Work in progress                
| id  | zircon syscall            | description | zcore |
|-----|---------------------------|-------------|-------|
| 140 | ioports_release           |             |
| 141 | pc_firmware_tables        |             |
| 142 | pci_add_subtract_io_range |             |
| 143 | pci_cfg_pio_rw            |             |
| 144 | pci_config_read           |             |
| 145 | pci_config_write          |             |
| 146 | pci_enable_bus_master     |             |
| 147 | pci_get_bar               |             |
| 148 | pci_get_nth_device        |             |
| 149 | pci_init                  |             |
| 150 | pci_map_interrupt         |             |
| 151 | pci_query_irq_mode        |             |
| 152 | pci_reset_device          |             |
| 153 | pci_set_irq_mode          |             |
          
                        
                            
                                   
## 总汇

| id  | zircon syscall                      | description                                                                  | zcore |
|-----|-------------------------------------|------------------------------------------------------------------------------|-------|
| 1   | handle_close                        | close a handle                                                               | ✅    |
| 2   | handle_close_many                   | close several handles                                                        | ✅    |
| 3   | handle_duplicate                    | create a duplicate handle (optionally with reduced rights)                   | ✅    |
| 4   | handle_replace                      | create a new handle (optionally with reduced rights) and destroy the old one | ✅    |
| 5   | object_get_child                    | find the child of an object by its koid                                      |       |
| 6   | object_get_info                     | obtain information about an object                                           |       |
| 7   | object_get_property                 | read an object property                                                      |       |
| 8   | object_set_profile                  | apply a profile to a thread                                                  |       |
| 9   | object_set_property                 | modify an object property                                                    |       |
| 10  | object_signal                       | set or clear the user signals on an object                                   |       |
| 11  | object_signal_peer                  | set or clear the user signals in the opposite end                            | ✅    |
| 12  | object_wait_many                    | wait for signals on multiple objects                                         |       |
| 13  | object_wait_one                     | wait for signals on one object                                               | ✅    |
| 14  | object_wait_async                   | asynchronous notifications on signal change                                  | ✅    |
| 15  | thread_create                       |                                                                              | ✅    |
| 16  | thread_exit                         |                                                                              |
| 17  | thread_read_state                   |                                                                              |
| 18  | thread_start                        | cause a new thread to start executing                                        | ✅    |
| 19  | thread_write_state                  |                                                                              |
| 20  | process_create                      | create a new process within a job                                            | ✅    |
| 21  | process_read_memory                 |                                                                              |
| 22  | process_start                       | cause a new process to start executing                                       | ✅    |
| 23  | process_write_memory                |                                                                              |
| 24  | process_exit                        |                                                                              |
| 25  | job_create                          | create a new job within a job                                                | ✅    |
| 26  | job_set_critical                    |                                                                              |
| 27  | job_set_policy                      |                                                                              |
| 28  | task_create_exception_channel       |                                                                              |
| 29  | task_kill                           |                                                                              |
| 30  | task_suspend                        |                                                                              | ✅？   |
| 31  | profile_create                      |                                                                              |
| 32  | exception_get_thread                |                                                                              |
| 33  | exception_get_process               |                                                                              |
| 34  | channel_call                        |                                                                              | ✅？   |
| 35  | channel_create                      |                                                                              | ✅    |
| 36  | channel_read                        |                                                                              | ✅    |
| 37  | channel_read_etc                    |                                                                              |
| 38  | channel_write                       |                                                                              | ✅    |
| 39  | channel_write_etc                   |                                                                              |
| 40  | socket_create                       |                                                                              |
| 41  | socket_read                         |                                                                              |
| 42  | socket_shutdown                     |                                                                              |
| 43  | socket_write                        |                                                                              |
| 44  | stream_create                       |                                                                              |
| 45  | stream_readv                        |                                                                              |
| 46  | stream_readv_at                     |                                                                              |
| 47  | stream_writev                       |                                                                              |
| 48  | stream_writev_at                    |                                                                              |
| 49  | stream_seek                         |                                                                              |
| 50  | fifo_create                         |                                                                              |
| 51  | fifo_read                           |                                                                              |
| 52  | fifo_write                          |                                                                              |
| 53  | event_create                        |                                                                              | ✅    |
| 54  | eventpair_create                    |                                                                              |
| 55  | system_get_event                    |                                                                              |
| 56  | port_create                         |                                                                              | ✅    |
| 57  | port_queue                          |                                                                              |
| 58  | port_wait                           |                                                                              | ✅    |
| 59  | port_cancel                         |                                                                              |
| 60  | futex_wait                          |                                                                              | ✅    |
| 61  | futex_wake                          |                                                                              | ✅    |
| 62  | futex_requeue                       |                                                                              |
| 63  | vmo_create                          |                                                                              | ✅    |
| 64  | vmo_read                            |                                                                              | ✅    |
| 65  | vmo_write                           |                                                                              |
| 66  | vmo_create_child                    |                                                                              |
| 67  | vmo_get_size                        |                                                                              |
| 68  | vmo_set_size                        |                                                                              | ✅    |
| 69  | vmo_op_range                        |                                                                              |
| 70  | vmo_replace_as_executable           |                                                                              | ✅    |
| 71  | vmo_create_physical                 |                                                                              |
| 72  | vmo_set_cache_policy                |                                                                              |
| 73  | vmar_allocate                       |                                                                              | ✅    |
| 74  | vmar_map                            |                                                                              | ✅    |
| 75  | vmar_unmap                          |                                                                              | ✅    |
| 76  | vmar_protect                        |                                                                              |
| 77  | vmar_op_range                       |                                                                              |
| 78  | vmar_destroy                        |                                                                              | ✅    |
| 79  | pager_create                        |                                                                              |
| 80  | pager_create_vmo                    |                                                                              |
| 81  | pager_detach_vmo                    |                                                                              |
| 82  | pager_supply_pages                  |                                                                              |
| 83  | pager_op_range                      |                                                                              |
| 84  | cprng_add_entropy                   |                                                                              |
| 85  | cprng_draw                          |                                                                              |
| 86  | nanosleep                           |                                                                              |
| 87  | clock_get                           |                                                                              |
| 88  | clock_get_monotonic                 |                                                                              | ✅    |
| 89  | ticks_get                           |                                                                              |
| 90  | ticks_per_second                    |                                                                              |
| 91  | deadline_after                      |                                                                              |
| 92  | clock_adjust                        |                                                                              |
| 93  | timer_create                        |                                                                              | ✅    |
| 94  | timer_set                           |                                                                              | ✅    |
| 95  | timer_cancel                        |                                                                              |
| 96  | guest_create                        |                                                                              |
| 97  | guest_set_trap                      |                                                                              |
| 98  | vcpu_create                         |                                                                              |
| 99  | vcpu_resume                         |                                                                              |
| 100 | vcpu_interrupt                      |                                                                              |
| 101 | vcpu_read_state                     |                                                                              |
| 102 | vcpu_write_state                    |                                                                              |
| 103 | interrupt_bind_vcpu                 |                                                                              |
| 104 | system_get_dcache_line_size         |                                                                              |
| 105 | system_get_features                 |                                                                              |
| 106 | system_get_num_cpus                 |                                                                              |
| 107 | system_get_physmem                  |                                                                              |
| 108 | system_get_version_string           |                                                                              |
| 109 | debuglog_create                     |                                                                              | ✅    |
| 110 | debuglog_write                      |                                                                              |
| 111 | debuglog_read                       |                                                                              |
| 112 | debug_read                          |                                                                              |
| 113 | debug_write                         |                                                                              |
| 114 | debug_send_command                  |                                                                              |
| 115 | vmar_unmap_handle_close_thread_exit |                                                                              |
| 116 | futex_wake_handle_close_thread_exit |                                                                              |
| 117 | system_mexec                        |                                                                              |
| 118 | system_mexec_payload_get            |                                                                              |
| 119 | system_powerctl                     |                                                                              |
| 120 | bti_create                          |                                                                              |
| 121 | bti_pin                             |                                                                              |
| 122 | bti_release_quarantine              |                                                                              |
| 123 | cache_flush                         |                                                                              |
| 124 | interrupt_ack                       |                                                                              |
| 125 | interrupt_bind                      |                                                                              |
| 126 | interrupt_create                    |                                                                              |
| 127 | interrupt_destroy                   |                                                                              |
| 128 | interrupt_trigger                   |                                                                              |
| 129 | interrupt_wait                      |                                                                              |
| 130 | iommu_create                        |                                                                              |
| 131 | pmt_unpin                           |                                                                              |
| 132 | resource_create                     |                                                                              |
| 133 | smc_call                            |                                                                              |
| 134 | framebuffer_get_info                |                                                                              |
| 135 | framebugger_set_range               |                                                                              |
| 136 | ktrace_control                      |                                                                              |
| 137 | ktrace_read                         |                                                                              |
| 138 | ktrace_write                        |                                                                              |
| 139 | mtrace_control                      |                                                                              |
| 140 | ioports_release                     |                                                                              |
| 141 | pc_firmware_tables                  |                                                                              |
| 142 | pci_add_subtract_io_range           |                                                                              |
| 143 | pci_cfg_pio_rw                      |                                                                              |
| 144 | pci_config_read                     |                                                                              |
| 145 | pci_config_write                    |                                                                              |
| 146 | pci_enable_bus_master               |                                                                              |
| 147 | pci_get_bar                         |                                                                              |
| 148 | pci_get_nth_device                  |                                                                              |
| 149 | pci_init                            |                                                                              |
| 150 | pci_map_interrupt                   |                                                                              |
| 151 | pci_query_irq_mode                  |                                                                              |
| 152 | pci_reset_device                    |                                                                              |
| 153 | pci_set_irq_mode                    |                                                                              |
