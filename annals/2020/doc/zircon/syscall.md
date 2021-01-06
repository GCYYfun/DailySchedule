# Syscall

<!-- 
| syscall | name | descroption | synopsis |
|---------|------|-------------|----------|
| Row1    | p    | p           | p        |
| Row2    | p    | p           | p        | 
-->

从访问的角度来看，系统调用分为三大类

无限制的调用，例如zx_clock_get() ，只有很少的zx_nanosleep()调用，并且可以由任何线程调用。

以Handle作为第一个参数的调用，表示它们所作用的对象，例如zx_channel_write() 和zx_port_queue()。

创建新对象但不使用句柄的调用，例如 zx_event_create()和 zx_channel_create()。对它们的访问（以及对它们的限制）由包含调用进程的Job控制。

## Handles

阅读   
https://fuchsia.dev/fuchsia-src/concepts/kernel/handles

### syscall 

| syscall | name | descroption | synopsis |
|---------|------|-------------|----------|
| Row1    | p    | p           | p        |
| Row2    | p    | p           | p        |
