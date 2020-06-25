bootloader
⬇️
start
⬇️
main
⬇️
loader run
⬇️
⬇️
⬇️
⬇️
⬇️
⬇️


A Handle is how a specific process refers to a specific Dispatcher.

Base class for all kernel objects that can be exposed to user-mode via the syscall API and referenced by handles.

It implements RefCounted because handles are abstractions to a multiple references from user mode or kernel mode that control the lifetime over the object.

It implements Recyclable because upon final Release() on the RefPtr it might be necessary to implement a destruction pattern that avoids deep recursion since the kernel stack is very limited.

You don't derive directly from this class; instead derive from SoloDispatcher or PeeredDispatcher.



每个实现 不尽相同 

先有 Object

然后 syscall 操作 object
 
channel 是队列