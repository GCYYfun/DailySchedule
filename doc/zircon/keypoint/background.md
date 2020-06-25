# BackGround

## FBL

FBL is the Fuchsia Base Library, which is shared between kernel and userspace.
As a result, FBL has very strict dependencies.  For example, FBL cannot depend
on the syscall interface because the syscall interface is not available within
the kernel.  Similarly, FBL cannot depend on C library features that are not
available in the kernel.

1. [system/ulib/fbl](/zircon/system/ulib/fbl) which is usable from both
   kernel and userspace.
2. [kernel/lib/fbl](/zircon/kernel/lib/fbl) which is usable only from
    the kernel.

Note: Some FBL interfaces below that overlap with standard C++ library
interfaces will probably be either removed entirely or made kernel-only (and
perhaps renamed inside the kernel) once userspace code has migrated to using
standard C++ library facilities where appropriate.

FBL provides:

- utility code
  - [basic algorithms](/zircon/system/ulib/fbl/include/fbl/algorithm.h)
  - [alloc checking new](/zircon/system/ulib/fbl/include/fbl/alloc_checker.h)
- allocators
  - [slab allocation](/zircon/system/ulib/fbl/include/fbl/slab_allocator.h)
  - [slab malloc](/zircon/system/ulib/fbl/include/fbl/slab_malloc.h)
- arrays
  - [fixed sized arrays](/zircon/system/ulib/fbl/include/fbl/array.h)
  - [fixed sized arrays](/zircon/system/ulib/fbl/include/fbl/inline_array.h),
    which stack allocates small arrays
- inline containers
  - [doubly linked list](/zircon/system/ulib/fbl/include/fbl/intrusive_double_list.h)
  - [hash table](/zircon/system/ulib/fbl/include/fbl/intrusive_hash_table.h)
  - [singly linked list](/zircon/system/ulib/fbl/include/fbl/intrusive_single_list.h)
  - [wavl trees](/zircon/system/ulib/fbl/include/fbl/intrusive_wavl_tree.h)
- smart pointers
  - [intrusive refcounted mixin](/zircon/system/ulib/fbl/include/fbl/ref_counted.h)
  - [intrusive refcounting pointer](/zircon/system/ulib/fbl/include/fbl/ref_ptr.h)

RefPtr<T>持有一个对类型为T的侵入性计数对象的引用，当refcount下降到0时，该对象将被删除。

T应该是fbl::RefCounted<>的一个子类，或者是遵守AddRef()和Release()相同契约的东西。

除了初始构造(见下文)，它一般都遵循std::shared_ptr<>接口的子集。与 std::shared_ptr<>不同的是，这个类型不支持销售弱指针，不支持查询引用计数，也不支持任何会导致分配内存的操作（除非 T::AddRef 或 T::Release 会分配内存）。

构造。 要在一个新创建的对象周围创建一个RefPtr，使用本头底部的AdaptRef free函数。要构造一个RefPtr来持有一个已经存在的对象的引用，可以使用复制或移动构造函数或赋值操作符。

- raii utilities
  - [auto call](/zircon/system/ulib/fbl/include/fbl/auto_call.h) to run
    code upon leaving scope
  - [AutoLock](/zircon/system/ulib/fbl/include/fbl/auto_lock.h)

FBL has strict controls on memory allocation.  Memory allocation should be
explicit, using an AllocChecker to let clients recover from allocation
failures.  In some cases, implicit memory allocation is permitted, but
functions that implicitly allocate memory must be #ifdef'ed to be unavailable
in the kernel.

FBL not available outside the Platform Source Tree.


## ZX

ZX contains C++ wrappers for the Zircon [objects](/docs/reference/kernel_objects/objects.md) and
[syscalls](/docs/reference/syscalls/README.md).  These wrappers provide type safety and move semantics
for handles but offer no opinion beyond what's in syscalls.abigen.  At some
point in the future, we might autogenerate ZX from syscalls.abigen, similar to
how we autogenerate the syscall wrappers in other languages.

ZX is part of the Fuchsia SDK.

## FZL

FZL is the Fuchsia Zircon Library.  This library provides value-add for common
operations involving kernel objects and is free to have opinions about how to
interact with the Zircon syscalls.  If a piece of code has no dependency on
Zircon syscalls, the code should go in FBL instead.

FZL not available outside the Platform Source Tree.


一个进程可以通过3种方式使用内存。

 1. 以堆、线程栈、可执行代码+数据的形式映射内存。
    这个内存用[VMARs](/docs/reference/kernel_objects/vm_address_region.md)表示。
    而这些内存又持有对[VMOs](/docs/reference/kernel_objects/vm_object.md)的引用。
    程序员通常通过内存地址与这个内存接口。
 2. 独立的 VMOs。这是一组不通过映射的内存页。
    VMAR。程序员通过句柄与这个内存接口；通常会发出
    vmo_read]（/docs/reference/syscalls/vmo_read.md）和[vmo_write]（/docs/reference/syscalls/vmo_write.md）。
 3. 内核内存以内核对象的句柄形式存在。