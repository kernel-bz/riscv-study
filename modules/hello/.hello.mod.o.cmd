cmd_/home/risc-v/kernel/kernel-modules/hello/hello.mod.o := riscv64-unknown-linux-gnu-gcc -Wp,-MMD,/home/risc-v/kernel/kernel-modules/hello/.hello.mod.o.d -nostdinc -I/home/risc-v/kernel/linux-stable/arch/riscv/include -I./arch/riscv/include/generated -I/home/risc-v/kernel/linux-stable/include -I./include -I/home/risc-v/kernel/linux-stable/arch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -I/home/risc-v/kernel/linux-stable/include/uapi -I./include/generated/uapi -include /home/risc-v/kernel/linux-stable/include/linux/compiler-version.h -include /home/risc-v/kernel/linux-stable/include/linux/kconfig.h -include /home/risc-v/kernel/linux-stable/include/linux/compiler_types.h -D__KERNEL__ -fmacro-prefix-map=/home/risc-v/kernel/linux-stable/= -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -std=gnu11 -mabi=lp64 -march=rv64imac -mno-save-restore -DCONFIG_PAGE_OFFSET=0xff60000000000000 -mcmodel=medany -fno-asynchronous-unwind-tables -fno-unwind-tables -mstrict-align -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -O2 --param=allow-store-data-races=0 -Wframe-larger-than=2048 -fstack-protector-strong -Wno-main -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-stack-clash-protection -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-truncation -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wimplicit-fallthrough=5 -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wno-packed-not-aligned -g -DMODULE -mno-relax -DKBUILD_BASENAME='"hello.mod"' -DKBUILD_MODNAME='"hello"' -D__KBUILD_MODNAME=kmod_hello -c -o /home/risc-v/kernel/kernel-modules/hello/hello.mod.o /home/risc-v/kernel/kernel-modules/hello/hello.mod.c

source_/home/risc-v/kernel/kernel-modules/hello/hello.mod.o := /home/risc-v/kernel/kernel-modules/hello/hello.mod.c

deps_/home/risc-v/kernel/kernel-modules/hello/hello.mod.o := \
    $(wildcard include/config/MODULE_UNLOAD) \
    $(wildcard include/config/RETPOLINE) \
  /home/risc-v/kernel/linux-stable/include/linux/compiler-version.h \
    $(wildcard include/config/CC_VERSION_TEXT) \
  /home/risc-v/kernel/linux-stable/include/linux/kconfig.h \
    $(wildcard include/config/CPU_BIG_ENDIAN) \
    $(wildcard include/config/BOOGER) \
    $(wildcard include/config/FOO) \
  /home/risc-v/kernel/linux-stable/include/linux/compiler_types.h \
    $(wildcard include/config/DEBUG_INFO_BTF) \
    $(wildcard include/config/PAHOLE_HAS_BTF_TAG) \
    $(wildcard include/config/HAVE_ARCH_COMPILER_H) \
    $(wildcard include/config/CC_HAS_ASM_INLINE) \
  /home/risc-v/kernel/linux-stable/include/linux/compiler_attributes.h \
  /home/risc-v/kernel/linux-stable/include/linux/compiler-gcc.h \
    $(wildcard include/config/ARCH_USE_BUILTIN_BSWAP) \
    $(wildcard include/config/SHADOW_CALL_STACK) \
    $(wildcard include/config/KCOV) \
  /home/risc-v/kernel/linux-stable/include/linux/module.h \
    $(wildcard include/config/MODULES) \
    $(wildcard include/config/SYSFS) \
    $(wildcard include/config/MODULES_TREE_LOOKUP) \
    $(wildcard include/config/LIVEPATCH) \
    $(wildcard include/config/STACKTRACE_BUILD_ID) \
    $(wildcard include/config/ARCH_USES_CFI_TRAPS) \
    $(wildcard include/config/MODULE_SIG) \
    $(wildcard include/config/ARCH_WANTS_MODULES_DATA_IN_VMALLOC) \
    $(wildcard include/config/GENERIC_BUG) \
    $(wildcard include/config/KALLSYMS) \
    $(wildcard include/config/SMP) \
    $(wildcard include/config/TRACEPOINTS) \
    $(wildcard include/config/TREE_SRCU) \
    $(wildcard include/config/BPF_EVENTS) \
    $(wildcard include/config/DEBUG_INFO_BTF_MODULES) \
    $(wildcard include/config/JUMP_LABEL) \
    $(wildcard include/config/TRACING) \
    $(wildcard include/config/EVENT_TRACING) \
    $(wildcard include/config/FTRACE_MCOUNT_RECORD) \
    $(wildcard include/config/KPROBES) \
    $(wildcard include/config/HAVE_STATIC_CALL_INLINE) \
    $(wildcard include/config/KUNIT) \
    $(wildcard include/config/PRINTK_INDEX) \
    $(wildcard include/config/CONSTRUCTORS) \
    $(wildcard include/config/FUNCTION_ERROR_INJECTION) \
  /home/risc-v/kernel/linux-stable/include/linux/list.h \
    $(wildcard include/config/DEBUG_LIST) \
  /home/risc-v/kernel/linux-stable/include/linux/container_of.h \
  /home/risc-v/kernel/linux-stable/include/linux/build_bug.h \
  /home/risc-v/kernel/linux-stable/include/linux/compiler.h \
    $(wildcard include/config/TRACE_BRANCH_PROFILING) \
    $(wildcard include/config/PROFILE_ALL_BRANCHES) \
    $(wildcard include/config/OBJTOOL) \
  /home/risc-v/kernel/linux-stable/include/linux/compiler_types.h \
  arch/riscv/include/generated/asm/rwonce.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/rwonce.h \
  /home/risc-v/kernel/linux-stable/include/linux/kasan-checks.h \
    $(wildcard include/config/KASAN_GENERIC) \
    $(wildcard include/config/KASAN_SW_TAGS) \
  /home/risc-v/kernel/linux-stable/include/linux/types.h \
    $(wildcard include/config/HAVE_UID16) \
    $(wildcard include/config/UID16) \
    $(wildcard include/config/ARCH_DMA_ADDR_T_64BIT) \
    $(wildcard include/config/PHYS_ADDR_T_64BIT) \
    $(wildcard include/config/64BIT) \
    $(wildcard include/config/ARCH_32BIT_USTAT_F_TINODE) \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/types.h \
  arch/riscv/include/generated/uapi/asm/types.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/types.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/int-ll64.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/int-ll64.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/uapi/asm/bitsperlong.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/bitsperlong.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/bitsperlong.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/posix_types.h \
  /home/risc-v/kernel/linux-stable/include/linux/stddef.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/stddef.h \
  arch/riscv/include/generated/uapi/asm/posix_types.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/posix_types.h \
  /home/risc-v/kernel/linux-stable/include/linux/kcsan-checks.h \
    $(wildcard include/config/KCSAN) \
    $(wildcard include/config/KCSAN_WEAK_MEMORY) \
    $(wildcard include/config/KCSAN_IGNORE_ATOMICS) \
  /home/risc-v/kernel/linux-stable/include/linux/err.h \
  arch/riscv/include/generated/uapi/asm/errno.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/errno.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/errno-base.h \
  /home/risc-v/kernel/linux-stable/include/linux/poison.h \
    $(wildcard include/config/ILLEGAL_POINTER_VALUE) \
  /home/risc-v/kernel/linux-stable/include/linux/const.h \
  /home/risc-v/kernel/linux-stable/include/vdso/const.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/const.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/barrier.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/barrier.h \
  /home/risc-v/kernel/linux-stable/include/linux/stat.h \
  arch/riscv/include/generated/uapi/asm/stat.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/stat.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/stat.h \
  /home/risc-v/kernel/linux-stable/include/linux/time.h \
    $(wildcard include/config/POSIX_TIMERS) \
  /home/risc-v/kernel/linux-stable/include/linux/cache.h \
    $(wildcard include/config/ARCH_HAS_CACHE_LINE_SIZE) \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/kernel.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/sysinfo.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/cache.h \
    $(wildcard include/config/RISCV_DMA_NONCOHERENT) \
    $(wildcard include/config/MMU) \
  /home/risc-v/kernel/linux-stable/include/linux/math64.h \
    $(wildcard include/config/ARCH_SUPPORTS_INT128) \
  /home/risc-v/kernel/linux-stable/include/linux/math.h \
  arch/riscv/include/generated/asm/div64.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/div64.h \
  /home/risc-v/kernel/linux-stable/include/vdso/math64.h \
  /home/risc-v/kernel/linux-stable/include/linux/time64.h \
  /home/risc-v/kernel/linux-stable/include/vdso/time64.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/time.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/time_types.h \
  /home/risc-v/kernel/linux-stable/include/linux/time32.h \
  /home/risc-v/kernel/linux-stable/include/linux/timex.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/timex.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/param.h \
  arch/riscv/include/generated/uapi/asm/param.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/param.h \
    $(wildcard include/config/HZ) \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/param.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/timex.h \
    $(wildcard include/config/RISCV_M_MODE) \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/csr.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/asm.h \
  /home/risc-v/kernel/linux-stable/include/vdso/time32.h \
  /home/risc-v/kernel/linux-stable/include/vdso/time.h \
  /home/risc-v/kernel/linux-stable/include/linux/uidgid.h \
    $(wildcard include/config/MULTIUSER) \
    $(wildcard include/config/USER_NS) \
  /home/risc-v/kernel/linux-stable/include/linux/highuid.h \
  /home/risc-v/kernel/linux-stable/include/linux/buildid.h \
    $(wildcard include/config/CRASH_CORE) \
  /home/risc-v/kernel/linux-stable/include/linux/mm_types.h \
    $(wildcard include/config/HAVE_ALIGNED_STRUCT_PAGE) \
    $(wildcard include/config/MEMCG) \
    $(wildcard include/config/KMSAN) \
    $(wildcard include/config/USERFAULTFD) \
    $(wildcard include/config/SWAP) \
    $(wildcard include/config/NUMA) \
    $(wildcard include/config/HAVE_ARCH_COMPAT_MMAP_BASES) \
    $(wildcard include/config/MEMBARRIER) \
    $(wildcard include/config/AIO) \
    $(wildcard include/config/MMU_NOTIFIER) \
    $(wildcard include/config/TRANSPARENT_HUGEPAGE) \
    $(wildcard include/config/NUMA_BALANCING) \
    $(wildcard include/config/ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH) \
    $(wildcard include/config/PREEMPT_RT) \
    $(wildcard include/config/HUGETLB_PAGE) \
    $(wildcard include/config/IOMMU_SVA) \
    $(wildcard include/config/KSM) \
    $(wildcard include/config/LRU_GEN) \
  /home/risc-v/kernel/linux-stable/include/linux/mm_types_task.h \
    $(wildcard include/config/SPLIT_PTLOCK_CPUS) \
    $(wildcard include/config/ARCH_ENABLE_SPLIT_PMD_PTLOCK) \
  /home/risc-v/kernel/linux-stable/include/linux/threads.h \
    $(wildcard include/config/NR_CPUS) \
    $(wildcard include/config/BASE_SMALL) \
  /home/risc-v/kernel/linux-stable/include/linux/atomic.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/atomic.h \
    $(wildcard include/config/GENERIC_ATOMIC64) \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/cmpxchg.h \
  /home/risc-v/kernel/linux-stable/include/linux/bug.h \
    $(wildcard include/config/BUG_ON_DATA_CORRUPTION) \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/bug.h \
    $(wildcard include/config/GENERIC_BUG_RELATIVE_POINTERS) \
    $(wildcard include/config/DEBUG_BUGVERBOSE) \
  /home/risc-v/kernel/linux-stable/include/asm-generic/bug.h \
    $(wildcard include/config/BUG) \
  /home/risc-v/kernel/linux-stable/include/linux/instrumentation.h \
    $(wildcard include/config/NOINSTR_VALIDATION) \
  /home/risc-v/kernel/linux-stable/include/linux/once_lite.h \
  /home/risc-v/kernel/linux-stable/include/linux/panic.h \
    $(wildcard include/config/PANIC_TIMEOUT) \
  /home/risc-v/kernel/linux-stable/include/linux/printk.h \
    $(wildcard include/config/MESSAGE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_QUIET) \
    $(wildcard include/config/EARLY_PRINTK) \
    $(wildcard include/config/PRINTK) \
    $(wildcard include/config/DYNAMIC_DEBUG) \
    $(wildcard include/config/DYNAMIC_DEBUG_CORE) \
  /home/risc-v/kernel/linux-stable/include/linux/stdarg.h \
  /home/risc-v/kernel/linux-stable/include/linux/init.h \
    $(wildcard include/config/HAVE_ARCH_PREL32_RELOCATIONS) \
    $(wildcard include/config/STRICT_KERNEL_RWX) \
    $(wildcard include/config/STRICT_MODULE_RWX) \
    $(wildcard include/config/LTO_CLANG) \
  /home/risc-v/kernel/linux-stable/include/linux/kern_levels.h \
  /home/risc-v/kernel/linux-stable/include/linux/linkage.h \
    $(wildcard include/config/ARCH_USE_SYM_ANNOTATIONS) \
  /home/risc-v/kernel/linux-stable/include/linux/stringify.h \
  /home/risc-v/kernel/linux-stable/include/linux/export.h \
    $(wildcard include/config/MODVERSIONS) \
    $(wildcard include/config/TRIM_UNUSED_KSYMS) \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/linkage.h \
  /home/risc-v/kernel/linux-stable/include/linux/ratelimit_types.h \
  /home/risc-v/kernel/linux-stable/include/linux/bits.h \
  /home/risc-v/kernel/linux-stable/include/vdso/bits.h \
  /home/risc-v/kernel/linux-stable/include/linux/spinlock_types_raw.h \
    $(wildcard include/config/DEBUG_SPINLOCK) \
    $(wildcard include/config/DEBUG_LOCK_ALLOC) \
  arch/riscv/include/generated/asm/spinlock_types.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/spinlock_types.h \
  arch/riscv/include/generated/asm/qrwlock_types.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/qrwlock_types.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/uapi/asm/byteorder.h \
  /home/risc-v/kernel/linux-stable/include/linux/byteorder/little_endian.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/byteorder/little_endian.h \
  /home/risc-v/kernel/linux-stable/include/linux/swab.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/swab.h \
  arch/riscv/include/generated/uapi/asm/swab.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/swab.h \
  /home/risc-v/kernel/linux-stable/include/linux/byteorder/generic.h \
  /home/risc-v/kernel/linux-stable/include/linux/lockdep_types.h \
    $(wildcard include/config/PROVE_RAW_LOCK_NESTING) \
    $(wildcard include/config/LOCKDEP) \
    $(wildcard include/config/LOCK_STAT) \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/fence.h \
  /home/risc-v/kernel/linux-stable/include/linux/atomic/atomic-arch-fallback.h \
  /home/risc-v/kernel/linux-stable/include/linux/atomic/atomic-long.h \
  /home/risc-v/kernel/linux-stable/include/linux/atomic/atomic-instrumented.h \
  /home/risc-v/kernel/linux-stable/include/linux/instrumented.h \
  /home/risc-v/kernel/linux-stable/include/linux/kmsan-checks.h \
  /home/risc-v/kernel/linux-stable/include/linux/cpumask.h \
    $(wildcard include/config/FORCE_NR_CPUS) \
    $(wildcard include/config/HOTPLUG_CPU) \
    $(wildcard include/config/DEBUG_PER_CPU_MAPS) \
    $(wildcard include/config/CPUMASK_OFFSTACK) \
  /home/risc-v/kernel/linux-stable/include/linux/kernel.h \
    $(wildcard include/config/PREEMPT_VOLUNTARY_BUILD) \
    $(wildcard include/config/PREEMPT_DYNAMIC) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_CALL) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_KEY) \
    $(wildcard include/config/PREEMPT_) \
    $(wildcard include/config/DEBUG_ATOMIC_SLEEP) \
    $(wildcard include/config/PROVE_LOCKING) \
  /home/risc-v/kernel/linux-stable/include/linux/align.h \
  /home/risc-v/kernel/linux-stable/include/linux/limits.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/limits.h \
  /home/risc-v/kernel/linux-stable/include/vdso/limits.h \
  /home/risc-v/kernel/linux-stable/include/linux/bitops.h \
  /home/risc-v/kernel/linux-stable/include/linux/typecheck.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/bitops/generic-non-atomic.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/bitops.h \
  /home/risc-v/kernel/linux-stable/include/linux/irqflags.h \
    $(wildcard include/config/TRACE_IRQFLAGS) \
    $(wildcard include/config/IRQSOFF_TRACER) \
    $(wildcard include/config/PREEMPT_TRACER) \
    $(wildcard include/config/DEBUG_IRQFLAGS) \
    $(wildcard include/config/TRACE_IRQFLAGS_SUPPORT) \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/irqflags.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/processor.h \
  /home/risc-v/kernel/linux-stable/include/vdso/processor.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/vdso/processor.h \
    $(wildcard include/config/TOOLCHAIN_HAS_ZIHINTPAUSE) \
  /home/risc-v/kernel/linux-stable/include/linux/jump_label.h \
    $(wildcard include/config/HAVE_ARCH_JUMP_LABEL_RELATIVE) \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/jump_label.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/hwcap.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/uapi/asm/hwcap.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/ptrace.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/uapi/asm/ptrace.h \
  arch/riscv/include/generated/asm/percpu.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/percpu.h \
    $(wildcard include/config/DEBUG_PREEMPT) \
    $(wildcard include/config/HAVE_SETUP_PER_CPU_AREA) \
  /home/risc-v/kernel/linux-stable/include/linux/percpu-defs.h \
    $(wildcard include/config/DEBUG_FORCE_WEAK_PER_CPU) \
    $(wildcard include/config/AMD_MEM_ENCRYPT) \
  /home/risc-v/kernel/linux-stable/include/asm-generic/bitops/__ffs.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/bitops/ffz.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/bitops/fls.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/bitops/__fls.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/bitops/fls64.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/bitops/sched.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/bitops/ffs.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/bitops/hweight.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/bitops/arch_hweight.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/bitops/const_hweight.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/bitops/non-atomic.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/bitops/non-instrumented-non-atomic.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/bitops/le.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/bitops/ext2-atomic.h \
  /home/risc-v/kernel/linux-stable/include/linux/kstrtox.h \
  /home/risc-v/kernel/linux-stable/include/linux/log2.h \
    $(wildcard include/config/ARCH_HAS_ILOG2_U32) \
    $(wildcard include/config/ARCH_HAS_ILOG2_U64) \
  /home/risc-v/kernel/linux-stable/include/linux/minmax.h \
  /home/risc-v/kernel/linux-stable/include/linux/static_call_types.h \
    $(wildcard include/config/HAVE_STATIC_CALL) \
  /home/risc-v/kernel/linux-stable/include/linux/instruction_pointer.h \
  /home/risc-v/kernel/linux-stable/include/linux/bitmap.h \
  /home/risc-v/kernel/linux-stable/include/linux/find.h \
  /home/risc-v/kernel/linux-stable/include/linux/string.h \
    $(wildcard include/config/BINARY_PRINTF) \
    $(wildcard include/config/FORTIFY_SOURCE) \
  /home/risc-v/kernel/linux-stable/include/linux/errno.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/errno.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/string.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/string.h \
    $(wildcard include/config/KASAN) \
  /home/risc-v/kernel/linux-stable/include/linux/gfp_types.h \
    $(wildcard include/config/KASAN_HW_TAGS) \
  /home/risc-v/kernel/linux-stable/include/linux/numa.h \
    $(wildcard include/config/NODES_SHIFT) \
    $(wildcard include/config/NUMA_KEEP_MEMINFO) \
    $(wildcard include/config/HAVE_ARCH_NODE_DEV_GROUP) \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/page.h \
    $(wildcard include/config/PAGE_OFFSET) \
    $(wildcard include/config/XIP_KERNEL) \
    $(wildcard include/config/DEBUG_VIRTUAL) \
    $(wildcard include/config/FLATMEM) \
  /home/risc-v/kernel/linux-stable/include/linux/pfn.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/memory_model.h \
    $(wildcard include/config/SPARSEMEM_VMEMMAP) \
    $(wildcard include/config/SPARSEMEM) \
  /home/risc-v/kernel/linux-stable/include/asm-generic/getorder.h \
  /home/risc-v/kernel/linux-stable/include/linux/auxvec.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/auxvec.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/uapi/asm/auxvec.h \
  /home/risc-v/kernel/linux-stable/include/linux/kref.h \
  /home/risc-v/kernel/linux-stable/include/linux/spinlock.h \
    $(wildcard include/config/PREEMPTION) \
  /home/risc-v/kernel/linux-stable/include/linux/preempt.h \
    $(wildcard include/config/PREEMPT_COUNT) \
    $(wildcard include/config/TRACE_PREEMPT_TOGGLE) \
    $(wildcard include/config/PREEMPT_NOTIFIERS) \
  arch/riscv/include/generated/asm/preempt.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/preempt.h \
  /home/risc-v/kernel/linux-stable/include/linux/thread_info.h \
    $(wildcard include/config/THREAD_INFO_IN_TASK) \
    $(wildcard include/config/GENERIC_ENTRY) \
    $(wildcard include/config/HAVE_ARCH_WITHIN_STACK_FRAMES) \
    $(wildcard include/config/HARDENED_USERCOPY) \
  /home/risc-v/kernel/linux-stable/include/linux/restart_block.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/current.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/thread_info.h \
    $(wildcard include/config/VMAP_STACK) \
  /home/risc-v/kernel/linux-stable/include/linux/bottom_half.h \
  /home/risc-v/kernel/linux-stable/include/linux/lockdep.h \
    $(wildcard include/config/DEBUG_LOCKING_API_SELFTESTS) \
  /home/risc-v/kernel/linux-stable/include/linux/smp.h \
    $(wildcard include/config/UP_LATE_INIT) \
  /home/risc-v/kernel/linux-stable/include/linux/smp_types.h \
  /home/risc-v/kernel/linux-stable/include/linux/llist.h \
    $(wildcard include/config/ARCH_HAVE_NMI_SAFE_CMPXCHG) \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/smp.h \
  /home/risc-v/kernel/linux-stable/include/linux/irqreturn.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/mmiowb.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/mmiowb.h \
    $(wildcard include/config/MMIOWB) \
  /home/risc-v/kernel/linux-stable/include/asm-generic/mmiowb_types.h \
  /home/risc-v/kernel/linux-stable/include/linux/spinlock_types.h \
  /home/risc-v/kernel/linux-stable/include/linux/rwlock_types.h \
  arch/riscv/include/generated/asm/spinlock.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/spinlock.h \
  arch/riscv/include/generated/asm/qrwlock.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/qrwlock.h \
  /home/risc-v/kernel/linux-stable/include/linux/rwlock.h \
    $(wildcard include/config/PREEMPT) \
  /home/risc-v/kernel/linux-stable/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/INLINE_SPIN_LOCK) \
    $(wildcard include/config/INLINE_SPIN_LOCK_BH) \
    $(wildcard include/config/INLINE_SPIN_LOCK_IRQ) \
    $(wildcard include/config/INLINE_SPIN_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_SPIN_TRYLOCK) \
    $(wildcard include/config/INLINE_SPIN_TRYLOCK_BH) \
    $(wildcard include/config/UNINLINE_SPIN_UNLOCK) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_BH) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_IRQRESTORE) \
    $(wildcard include/config/GENERIC_LOCKBREAK) \
  /home/risc-v/kernel/linux-stable/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/INLINE_READ_LOCK) \
    $(wildcard include/config/INLINE_WRITE_LOCK) \
    $(wildcard include/config/INLINE_READ_LOCK_BH) \
    $(wildcard include/config/INLINE_WRITE_LOCK_BH) \
    $(wildcard include/config/INLINE_READ_LOCK_IRQ) \
    $(wildcard include/config/INLINE_WRITE_LOCK_IRQ) \
    $(wildcard include/config/INLINE_READ_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_WRITE_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_READ_TRYLOCK) \
    $(wildcard include/config/INLINE_WRITE_TRYLOCK) \
    $(wildcard include/config/INLINE_READ_UNLOCK) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK) \
    $(wildcard include/config/INLINE_READ_UNLOCK_BH) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_BH) \
    $(wildcard include/config/INLINE_READ_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_READ_UNLOCK_IRQRESTORE) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_IRQRESTORE) \
  /home/risc-v/kernel/linux-stable/include/linux/refcount.h \
  /home/risc-v/kernel/linux-stable/include/linux/rbtree.h \
  /home/risc-v/kernel/linux-stable/include/linux/rbtree_types.h \
  /home/risc-v/kernel/linux-stable/include/linux/rcupdate.h \
    $(wildcard include/config/PREEMPT_RCU) \
    $(wildcard include/config/TINY_RCU) \
    $(wildcard include/config/RCU_STRICT_GRACE_PERIOD) \
    $(wildcard include/config/TASKS_RCU_GENERIC) \
    $(wildcard include/config/RCU_STALL_COMMON) \
    $(wildcard include/config/NO_HZ_FULL) \
    $(wildcard include/config/KVM_XFER_TO_GUEST_WORK) \
    $(wildcard include/config/RCU_NOCB_CPU) \
    $(wildcard include/config/TASKS_RCU) \
    $(wildcard include/config/TASKS_TRACE_RCU) \
    $(wildcard include/config/TASKS_RUDE_RCU) \
    $(wildcard include/config/TREE_RCU) \
    $(wildcard include/config/DEBUG_OBJECTS_RCU_HEAD) \
    $(wildcard include/config/PROVE_RCU) \
    $(wildcard include/config/ARCH_WEAK_RELEASE_ACQUIRE) \
  /home/risc-v/kernel/linux-stable/include/linux/context_tracking_irq.h \
    $(wildcard include/config/CONTEXT_TRACKING_IDLE) \
  /home/risc-v/kernel/linux-stable/include/linux/rcutree.h \
  /home/risc-v/kernel/linux-stable/include/linux/maple_tree.h \
    $(wildcard include/config/MAPLE_RCU_DISABLED) \
    $(wildcard include/config/DEBUG_MAPLE_TREE_VERBOSE) \
    $(wildcard include/config/DEBUG_MAPLE_TREE) \
  /home/risc-v/kernel/linux-stable/include/linux/rwsem.h \
    $(wildcard include/config/RWSEM_SPIN_ON_OWNER) \
    $(wildcard include/config/DEBUG_RWSEMS) \
  /home/risc-v/kernel/linux-stable/include/linux/osq_lock.h \
  /home/risc-v/kernel/linux-stable/include/linux/completion.h \
  /home/risc-v/kernel/linux-stable/include/linux/swait.h \
  /home/risc-v/kernel/linux-stable/include/linux/wait.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/wait.h \
  /home/risc-v/kernel/linux-stable/include/linux/uprobes.h \
    $(wildcard include/config/UPROBES) \
  /home/risc-v/kernel/linux-stable/include/linux/page-flags-layout.h \
  include/generated/bounds.h \
  /home/risc-v/kernel/linux-stable/include/linux/workqueue.h \
    $(wildcard include/config/DEBUG_OBJECTS_WORK) \
    $(wildcard include/config/FREEZER) \
    $(wildcard include/config/WQ_WATCHDOG) \
  /home/risc-v/kernel/linux-stable/include/linux/timer.h \
    $(wildcard include/config/DEBUG_OBJECTS_TIMERS) \
  /home/risc-v/kernel/linux-stable/include/linux/ktime.h \
  /home/risc-v/kernel/linux-stable/include/linux/jiffies.h \
  /home/risc-v/kernel/linux-stable/include/vdso/jiffies.h \
  include/generated/timeconst.h \
  /home/risc-v/kernel/linux-stable/include/vdso/ktime.h \
  /home/risc-v/kernel/linux-stable/include/linux/timekeeping.h \
    $(wildcard include/config/GENERIC_CMOS_UPDATE) \
  /home/risc-v/kernel/linux-stable/include/linux/clocksource_ids.h \
  /home/risc-v/kernel/linux-stable/include/linux/debugobjects.h \
    $(wildcard include/config/DEBUG_OBJECTS) \
    $(wildcard include/config/DEBUG_OBJECTS_FREE) \
  /home/risc-v/kernel/linux-stable/include/linux/seqlock.h \
  /home/risc-v/kernel/linux-stable/include/linux/mutex.h \
    $(wildcard include/config/MUTEX_SPIN_ON_OWNER) \
    $(wildcard include/config/DEBUG_MUTEXES) \
  /home/risc-v/kernel/linux-stable/include/linux/debug_locks.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/mmu.h \
  /home/risc-v/kernel/linux-stable/include/linux/kmod.h \
  /home/risc-v/kernel/linux-stable/include/linux/umh.h \
  /home/risc-v/kernel/linux-stable/include/linux/gfp.h \
    $(wildcard include/config/HIGHMEM) \
    $(wildcard include/config/ZONE_DMA) \
    $(wildcard include/config/ZONE_DMA32) \
    $(wildcard include/config/ZONE_DEVICE) \
    $(wildcard include/config/PM_SLEEP) \
    $(wildcard include/config/CONTIG_ALLOC) \
    $(wildcard include/config/CMA) \
  /home/risc-v/kernel/linux-stable/include/linux/mmzone.h \
    $(wildcard include/config/ARCH_FORCE_MAX_ORDER) \
    $(wildcard include/config/MEMORY_ISOLATION) \
    $(wildcard include/config/ZSMALLOC) \
    $(wildcard include/config/LRU_GEN_STATS) \
    $(wildcard include/config/MEMORY_HOTPLUG) \
    $(wildcard include/config/COMPACTION) \
    $(wildcard include/config/PAGE_EXTENSION) \
    $(wildcard include/config/DEFERRED_STRUCT_PAGE_INIT) \
    $(wildcard include/config/HAVE_MEMORYLESS_NODES) \
    $(wildcard include/config/SPARSEMEM_EXTREME) \
    $(wildcard include/config/HAVE_ARCH_PFN_VALID) \
  /home/risc-v/kernel/linux-stable/include/linux/nodemask.h \
  /home/risc-v/kernel/linux-stable/include/linux/random.h \
    $(wildcard include/config/VMGENID) \
  /home/risc-v/kernel/linux-stable/include/linux/once.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/random.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/ioctl.h \
  arch/riscv/include/generated/uapi/asm/ioctl.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/ioctl.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/ioctl.h \
  /home/risc-v/kernel/linux-stable/include/linux/irqnr.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/irqnr.h \
  /home/risc-v/kernel/linux-stable/include/linux/prandom.h \
  /home/risc-v/kernel/linux-stable/include/linux/percpu.h \
    $(wildcard include/config/NEED_PER_CPU_EMBED_FIRST_CHUNK) \
    $(wildcard include/config/NEED_PER_CPU_PAGE_FIRST_CHUNK) \
  /home/risc-v/kernel/linux-stable/include/linux/mmdebug.h \
    $(wildcard include/config/DEBUG_VM) \
    $(wildcard include/config/DEBUG_VM_IRQSOFF) \
    $(wildcard include/config/DEBUG_VM_PGFLAGS) \
  arch/riscv/include/generated/asm/archrandom.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/archrandom.h \
  /home/risc-v/kernel/linux-stable/include/linux/pageblock-flags.h \
    $(wildcard include/config/HUGETLB_PAGE_SIZE_VARIABLE) \
  /home/risc-v/kernel/linux-stable/include/linux/page-flags.h \
    $(wildcard include/config/ARCH_USES_PG_UNCACHED) \
    $(wildcard include/config/MEMORY_FAILURE) \
    $(wildcard include/config/PAGE_IDLE_FLAG) \
    $(wildcard include/config/HUGETLB_PAGE_OPTIMIZE_VMEMMAP) \
  /home/risc-v/kernel/linux-stable/include/linux/local_lock.h \
  /home/risc-v/kernel/linux-stable/include/linux/local_lock_internal.h \
  /home/risc-v/kernel/linux-stable/include/linux/memory_hotplug.h \
    $(wildcard include/config/HAVE_ARCH_NODEDATA_EXTENSION) \
    $(wildcard include/config/ARCH_HAS_ADD_PAGES) \
    $(wildcard include/config/MEMORY_HOTREMOVE) \
  /home/risc-v/kernel/linux-stable/include/linux/notifier.h \
  /home/risc-v/kernel/linux-stable/include/linux/srcu.h \
    $(wildcard include/config/TINY_SRCU) \
    $(wildcard include/config/SRCU) \
  /home/risc-v/kernel/linux-stable/include/linux/rcu_segcblist.h \
  /home/risc-v/kernel/linux-stable/include/linux/srcutree.h \
  /home/risc-v/kernel/linux-stable/include/linux/rcu_node_tree.h \
    $(wildcard include/config/RCU_FANOUT) \
    $(wildcard include/config/RCU_FANOUT_LEAF) \
  /home/risc-v/kernel/linux-stable/include/linux/topology.h \
    $(wildcard include/config/USE_PERCPU_NUMA_NODE_ID) \
    $(wildcard include/config/SCHED_SMT) \
  /home/risc-v/kernel/linux-stable/include/linux/arch_topology.h \
    $(wildcard include/config/ACPI_CPPC_LIB) \
    $(wildcard include/config/GENERIC_ARCH_TOPOLOGY) \
  arch/riscv/include/generated/asm/topology.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/topology.h \
  /home/risc-v/kernel/linux-stable/include/linux/sysctl.h \
    $(wildcard include/config/SYSCTL) \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/sysctl.h \
  /home/risc-v/kernel/linux-stable/include/linux/elf.h \
    $(wildcard include/config/ARCH_USE_GNU_PROPERTY) \
    $(wildcard include/config/ARCH_HAVE_ELF_PROT) \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/elf.h \
    $(wildcard include/config/COMPAT) \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/elf.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/elf-em.h \
  /home/risc-v/kernel/linux-stable/include/linux/compat.h \
    $(wildcard include/config/ARCH_HAS_SYSCALL_WRAPPER) \
    $(wildcard include/config/X86_X32_ABI) \
    $(wildcard include/config/COMPAT_OLD_SIGACTION) \
    $(wildcard include/config/ODD_RT_SIGACTION) \
  /home/risc-v/kernel/linux-stable/include/linux/sem.h \
    $(wildcard include/config/SYSVIPC) \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/sem.h \
  /home/risc-v/kernel/linux-stable/include/linux/ipc.h \
  /home/risc-v/kernel/linux-stable/include/linux/rhashtable-types.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/ipc.h \
  arch/riscv/include/generated/uapi/asm/ipcbuf.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/ipcbuf.h \
  arch/riscv/include/generated/uapi/asm/sembuf.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/sembuf.h \
  /home/risc-v/kernel/linux-stable/include/linux/socket.h \
    $(wildcard include/config/PROC_FS) \
  arch/riscv/include/generated/uapi/asm/socket.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/socket.h \
  arch/riscv/include/generated/uapi/asm/sockios.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/sockios.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/sockios.h \
  /home/risc-v/kernel/linux-stable/include/linux/uio.h \
    $(wildcard include/config/ARCH_HAS_UACCESS_FLUSHCACHE) \
    $(wildcard include/config/ARCH_HAS_COPY_MC) \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/uio.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/socket.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/if.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/libc-compat.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/hdlc/ioctl.h \
  /home/risc-v/kernel/linux-stable/include/linux/fs.h \
    $(wildcard include/config/READ_ONLY_THP_FOR_FS) \
    $(wildcard include/config/FS_POSIX_ACL) \
    $(wildcard include/config/SECURITY) \
    $(wildcard include/config/CGROUP_WRITEBACK) \
    $(wildcard include/config/IMA) \
    $(wildcard include/config/FILE_LOCKING) \
    $(wildcard include/config/FSNOTIFY) \
    $(wildcard include/config/FS_ENCRYPTION) \
    $(wildcard include/config/FS_VERITY) \
    $(wildcard include/config/EPOLL) \
    $(wildcard include/config/UNICODE) \
    $(wildcard include/config/QUOTA) \
    $(wildcard include/config/FS_DAX) \
    $(wildcard include/config/BLOCK) \
  /home/risc-v/kernel/linux-stable/include/linux/wait_bit.h \
  /home/risc-v/kernel/linux-stable/include/linux/kdev_t.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/kdev_t.h \
  /home/risc-v/kernel/linux-stable/include/linux/dcache.h \
  /home/risc-v/kernel/linux-stable/include/linux/rculist.h \
    $(wildcard include/config/PROVE_RCU_LIST) \
  /home/risc-v/kernel/linux-stable/include/linux/rculist_bl.h \
  /home/risc-v/kernel/linux-stable/include/linux/list_bl.h \
  /home/risc-v/kernel/linux-stable/include/linux/bit_spinlock.h \
  /home/risc-v/kernel/linux-stable/include/linux/lockref.h \
    $(wildcard include/config/ARCH_USE_CMPXCHG_LOCKREF) \
  /home/risc-v/kernel/linux-stable/include/linux/stringhash.h \
    $(wildcard include/config/DCACHE_WORD_ACCESS) \
  /home/risc-v/kernel/linux-stable/include/linux/hash.h \
    $(wildcard include/config/HAVE_ARCH_HASH) \
  /home/risc-v/kernel/linux-stable/include/linux/path.h \
  /home/risc-v/kernel/linux-stable/include/linux/list_lru.h \
    $(wildcard include/config/MEMCG_KMEM) \
  /home/risc-v/kernel/linux-stable/include/linux/shrinker.h \
    $(wildcard include/config/SHRINKER_DEBUG) \
  /home/risc-v/kernel/linux-stable/include/linux/xarray.h \
    $(wildcard include/config/XARRAY_MULTI) \
  /home/risc-v/kernel/linux-stable/include/linux/kconfig.h \
  /home/risc-v/kernel/linux-stable/include/linux/sched/mm.h \
    $(wildcard include/config/ARCH_HAS_MEMBARRIER_CALLBACKS) \
  /home/risc-v/kernel/linux-stable/include/linux/sched.h \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_NATIVE) \
    $(wildcard include/config/SCHED_INFO) \
    $(wildcard include/config/SCHEDSTATS) \
    $(wildcard include/config/SCHED_CORE) \
    $(wildcard include/config/FAIR_GROUP_SCHED) \
    $(wildcard include/config/RT_GROUP_SCHED) \
    $(wildcard include/config/RT_MUTEXES) \
    $(wildcard include/config/UCLAMP_TASK) \
    $(wildcard include/config/UCLAMP_BUCKETS_COUNT) \
    $(wildcard include/config/KMAP_LOCAL) \
    $(wildcard include/config/CGROUP_SCHED) \
    $(wildcard include/config/BLK_DEV_IO_TRACE) \
    $(wildcard include/config/PSI) \
    $(wildcard include/config/COMPAT_BRK) \
    $(wildcard include/config/CGROUPS) \
    $(wildcard include/config/BLK_CGROUP) \
    $(wildcard include/config/PAGE_OWNER) \
    $(wildcard include/config/EVENTFD) \
    $(wildcard include/config/CPU_SUP_INTEL) \
    $(wildcard include/config/TASK_DELAY_ACCT) \
    $(wildcard include/config/STACKPROTECTOR) \
    $(wildcard include/config/ARCH_HAS_SCALED_CPUTIME) \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_GEN) \
    $(wildcard include/config/POSIX_CPUTIMERS) \
    $(wildcard include/config/POSIX_CPU_TIMERS_TASK_WORK) \
    $(wildcard include/config/KEYS) \
    $(wildcard include/config/DETECT_HUNG_TASK) \
    $(wildcard include/config/IO_URING) \
    $(wildcard include/config/AUDIT) \
    $(wildcard include/config/AUDITSYSCALL) \
    $(wildcard include/config/UBSAN) \
    $(wildcard include/config/UBSAN_TRAP) \
    $(wildcard include/config/TASK_XACCT) \
    $(wildcard include/config/CPUSETS) \
    $(wildcard include/config/X86_CPU_RESCTRL) \
    $(wildcard include/config/FUTEX) \
    $(wildcard include/config/PERF_EVENTS) \
    $(wildcard include/config/RSEQ) \
    $(wildcard include/config/FAULT_INJECTION) \
    $(wildcard include/config/LATENCYTOP) \
    $(wildcard include/config/FUNCTION_GRAPH_TRACER) \
    $(wildcard include/config/BCACHE) \
    $(wildcard include/config/BPF_SYSCALL) \
    $(wildcard include/config/GCC_PLUGIN_STACKLEAK) \
    $(wildcard include/config/X86_MCE) \
    $(wildcard include/config/KRETPROBES) \
    $(wildcard include/config/RETHOOK) \
    $(wildcard include/config/ARCH_HAS_PARANOID_L1D_FLUSH) \
    $(wildcard include/config/RV) \
    $(wildcard include/config/ARCH_TASK_STRUCT_ON_STACK) \
    $(wildcard include/config/PREEMPT_NONE) \
    $(wildcard include/config/PREEMPT_VOLUNTARY) \
    $(wildcard include/config/DEBUG_RSEQ) \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/sched.h \
  /home/risc-v/kernel/linux-stable/include/linux/pid.h \
  /home/risc-v/kernel/linux-stable/include/linux/shm.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/shm.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/hugetlb_encode.h \
  arch/riscv/include/generated/uapi/asm/shmbuf.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/shmbuf.h \
  arch/riscv/include/generated/asm/shmparam.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/shmparam.h \
  /home/risc-v/kernel/linux-stable/include/linux/kmsan_types.h \
  /home/risc-v/kernel/linux-stable/include/linux/plist.h \
    $(wildcard include/config/DEBUG_PLIST) \
  /home/risc-v/kernel/linux-stable/include/linux/hrtimer.h \
    $(wildcard include/config/HIGH_RES_TIMERS) \
    $(wildcard include/config/TIME_LOW_RES) \
    $(wildcard include/config/TIMERFD) \
  /home/risc-v/kernel/linux-stable/include/linux/hrtimer_defs.h \
  /home/risc-v/kernel/linux-stable/include/linux/timerqueue.h \
  /home/risc-v/kernel/linux-stable/include/linux/seccomp.h \
    $(wildcard include/config/SECCOMP) \
    $(wildcard include/config/HAVE_ARCH_SECCOMP_FILTER) \
    $(wildcard include/config/SECCOMP_FILTER) \
    $(wildcard include/config/CHECKPOINT_RESTORE) \
    $(wildcard include/config/SECCOMP_CACHE_DEBUG) \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/seccomp.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/seccomp.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/unistd.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/uapi/asm/unistd.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/unistd.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/seccomp.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/unistd.h \
  /home/risc-v/kernel/linux-stable/include/linux/resource.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/resource.h \
  arch/riscv/include/generated/uapi/asm/resource.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/resource.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/resource.h \
  /home/risc-v/kernel/linux-stable/include/linux/latencytop.h \
  /home/risc-v/kernel/linux-stable/include/linux/sched/prio.h \
  /home/risc-v/kernel/linux-stable/include/linux/sched/types.h \
  /home/risc-v/kernel/linux-stable/include/linux/signal_types.h \
    $(wildcard include/config/OLD_SIGACTION) \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/signal.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/signal.h \
  arch/riscv/include/generated/uapi/asm/signal.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/signal.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/signal.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/signal-defs.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/uapi/asm/sigcontext.h \
  arch/riscv/include/generated/uapi/asm/siginfo.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/siginfo.h \
  /home/risc-v/kernel/linux-stable/include/linux/syscall_user_dispatch.h \
  /home/risc-v/kernel/linux-stable/include/linux/task_io_accounting.h \
    $(wildcard include/config/TASK_IO_ACCOUNTING) \
  /home/risc-v/kernel/linux-stable/include/linux/posix-timers.h \
  /home/risc-v/kernel/linux-stable/include/linux/alarmtimer.h \
    $(wildcard include/config/RTC_CLASS) \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/rseq.h \
  /home/risc-v/kernel/linux-stable/include/linux/kcsan.h \
  /home/risc-v/kernel/linux-stable/include/linux/rv.h \
    $(wildcard include/config/RV_REACTORS) \
  arch/riscv/include/generated/asm/kmap_size.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/kmap_size.h \
    $(wildcard include/config/DEBUG_KMAP_LOCAL) \
  /home/risc-v/kernel/linux-stable/include/linux/sync_core.h \
    $(wildcard include/config/ARCH_HAS_SYNC_CORE_BEFORE_USERMODE) \
  /home/risc-v/kernel/linux-stable/include/linux/ioasid.h \
    $(wildcard include/config/IOASID) \
  /home/risc-v/kernel/linux-stable/include/linux/radix-tree.h \
  /home/risc-v/kernel/linux-stable/include/linux/capability.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/capability.h \
  /home/risc-v/kernel/linux-stable/include/linux/semaphore.h \
  /home/risc-v/kernel/linux-stable/include/linux/fcntl.h \
    $(wildcard include/config/ARCH_32BIT_OFF_T) \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/fcntl.h \
  arch/riscv/include/generated/uapi/asm/fcntl.h \
  /home/risc-v/kernel/linux-stable/include/uapi/asm-generic/fcntl.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/openat2.h \
  /home/risc-v/kernel/linux-stable/include/linux/migrate_mode.h \
  /home/risc-v/kernel/linux-stable/include/linux/percpu-rwsem.h \
  /home/risc-v/kernel/linux-stable/include/linux/rcuwait.h \
  /home/risc-v/kernel/linux-stable/include/linux/sched/signal.h \
    $(wildcard include/config/SCHED_AUTOGROUP) \
    $(wildcard include/config/BSD_PROCESS_ACCT) \
    $(wildcard include/config/TASKSTATS) \
    $(wildcard include/config/STACK_GROWSUP) \
  /home/risc-v/kernel/linux-stable/include/linux/signal.h \
    $(wildcard include/config/DYNAMIC_SIGFRAME) \
  /home/risc-v/kernel/linux-stable/include/linux/sched/jobctl.h \
  /home/risc-v/kernel/linux-stable/include/linux/sched/task.h \
    $(wildcard include/config/HAVE_EXIT_THREAD) \
    $(wildcard include/config/ARCH_WANTS_DYNAMIC_TASK_STRUCT) \
    $(wildcard include/config/HAVE_ARCH_THREAD_STRUCT_WHITELIST) \
  /home/risc-v/kernel/linux-stable/include/linux/uaccess.h \
    $(wildcard include/config/ARCH_HAS_SUBPAGE_FAULTS) \
  /home/risc-v/kernel/linux-stable/include/linux/fault-inject-usercopy.h \
    $(wildcard include/config/FAULT_INJECTION_USERCOPY) \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/uaccess.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/asm-extable.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/gpr-num.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/pgtable.h \
    $(wildcard include/config/XIP_PHYS_ADDR) \
    $(wildcard include/config/PHYS_RAM_BASE) \
    $(wildcard include/config/PAGE_TABLE_CHECK) \
    $(wildcard include/config/ARCH_ENABLE_THP_MIGRATION) \
  /home/risc-v/kernel/linux-stable/include/linux/sizes.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/pgtable-bits.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/tlbflush.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/errata_list.h \
    $(wildcard include/config/ERRATA_SIFIVE) \
    $(wildcard include/config/ERRATA_THEAD) \
    $(wildcard include/config/ERRATA_SIFIVE_CIP_453) \
    $(wildcard include/config/ERRATA_SIFIVE_CIP_1200) \
    $(wildcard include/config/RISCV_ISA_SVPBMT) \
    $(wildcard include/config/ERRATA_THEAD_PBMT) \
    $(wildcard include/config/RISCV_ISA_ZICBOM) \
    $(wildcard include/config/ERRATA_THEAD_CMO) \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/alternative.h \
    $(wildcard include/config/RISCV_ALTERNATIVE) \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/alternative-macros.h \
    $(wildcard include/config/k) \
    $(wildcard include/config/k_1) \
    $(wildcard include/config/k_2) \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/vendorid_list.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/pgtable-64.h \
  /home/risc-v/kernel/linux-stable/include/linux/page_table_check.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/extable.h \
    $(wildcard include/config/BPF_JIT) \
    $(wildcard include/config/ARCH_RV64I) \
  /home/risc-v/kernel/linux-stable/include/asm-generic/access_ok.h \
    $(wildcard include/config/ALTERNATE_USER_ADDRESS_SPACE) \
  /home/risc-v/kernel/linux-stable/include/linux/cred.h \
    $(wildcard include/config/DEBUG_CREDENTIALS) \
  /home/risc-v/kernel/linux-stable/include/linux/key.h \
    $(wildcard include/config/KEY_NOTIFICATIONS) \
    $(wildcard include/config/NET) \
  /home/risc-v/kernel/linux-stable/include/linux/assoc_array.h \
    $(wildcard include/config/ASSOCIATIVE_ARRAY) \
  /home/risc-v/kernel/linux-stable/include/linux/sched/user.h \
    $(wildcard include/config/VFIO_PCI_ZDEV_KVM) \
    $(wildcard include/config/WATCH_QUEUE) \
  /home/risc-v/kernel/linux-stable/include/linux/percpu_counter.h \
  /home/risc-v/kernel/linux-stable/include/linux/ratelimit.h \
  /home/risc-v/kernel/linux-stable/include/linux/rcu_sync.h \
  /home/risc-v/kernel/linux-stable/include/linux/delayed_call.h \
  /home/risc-v/kernel/linux-stable/include/linux/uuid.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/uuid.h \
  /home/risc-v/kernel/linux-stable/include/linux/errseq.h \
  /home/risc-v/kernel/linux-stable/include/linux/ioprio.h \
  /home/risc-v/kernel/linux-stable/include/linux/sched/rt.h \
  /home/risc-v/kernel/linux-stable/include/linux/iocontext.h \
    $(wildcard include/config/BLK_ICQ) \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/ioprio.h \
  /home/risc-v/kernel/linux-stable/include/linux/fs_types.h \
  /home/risc-v/kernel/linux-stable/include/linux/mount.h \
  /home/risc-v/kernel/linux-stable/include/linux/mnt_idmapping.h \
  /home/risc-v/kernel/linux-stable/include/linux/slab.h \
    $(wildcard include/config/DEBUG_SLAB) \
    $(wildcard include/config/FAILSLAB) \
    $(wildcard include/config/KFENCE) \
    $(wildcard include/config/SLAB) \
    $(wildcard include/config/SLUB) \
    $(wildcard include/config/SLOB) \
  /home/risc-v/kernel/linux-stable/include/linux/overflow.h \
  /home/risc-v/kernel/linux-stable/include/linux/percpu-refcount.h \
  /home/risc-v/kernel/linux-stable/include/linux/kasan.h \
    $(wildcard include/config/KASAN_STACK) \
    $(wildcard include/config/KASAN_VMALLOC) \
    $(wildcard include/config/KASAN_INLINE) \
  /home/risc-v/kernel/linux-stable/include/linux/kasan-enabled.h \
  /home/risc-v/kernel/linux-stable/include/linux/static_key.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/fs.h \
  /home/risc-v/kernel/linux-stable/include/linux/quota.h \
    $(wildcard include/config/QUOTA_NETLINK_INTERFACE) \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/dqblk_xfs.h \
  /home/risc-v/kernel/linux-stable/include/linux/dqblk_v1.h \
  /home/risc-v/kernel/linux-stable/include/linux/dqblk_v2.h \
  /home/risc-v/kernel/linux-stable/include/linux/dqblk_qtree.h \
  /home/risc-v/kernel/linux-stable/include/linux/projid.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/quota.h \
  /home/risc-v/kernel/linux-stable/include/linux/nfs_fs_i.h \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/aio_abi.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/compat.h \
  /home/risc-v/kernel/linux-stable/include/linux/sched/task_stack.h \
    $(wildcard include/config/DEBUG_STACK_USAGE) \
  /home/risc-v/kernel/linux-stable/include/uapi/linux/magic.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/compat.h \
    $(wildcard include/config/COMPAT_FOR_U64_ALIGNMENT) \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/uapi/asm/elf.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/cacheinfo.h \
  /home/risc-v/kernel/linux-stable/include/linux/cacheinfo.h \
    $(wildcard include/config/ACPI_PPTT) \
  /home/risc-v/kernel/linux-stable/include/linux/kobject.h \
    $(wildcard include/config/UEVENT_HELPER) \
    $(wildcard include/config/DEBUG_KOBJECT_RELEASE) \
  /home/risc-v/kernel/linux-stable/include/linux/sysfs.h \
  /home/risc-v/kernel/linux-stable/include/linux/kernfs.h \
    $(wildcard include/config/KERNFS) \
  /home/risc-v/kernel/linux-stable/include/linux/idr.h \
  /home/risc-v/kernel/linux-stable/include/linux/kobject_ns.h \
  /home/risc-v/kernel/linux-stable/include/linux/moduleparam.h \
    $(wildcard include/config/ALPHA) \
    $(wildcard include/config/IA64) \
    $(wildcard include/config/PPC64) \
  /home/risc-v/kernel/linux-stable/include/linux/rbtree_latch.h \
  /home/risc-v/kernel/linux-stable/include/linux/error-injection.h \
  /home/risc-v/kernel/linux-stable/include/asm-generic/error-injection.h \
  /home/risc-v/kernel/linux-stable/include/linux/tracepoint-defs.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/module.h \
    $(wildcard include/config/MODULE_SECTIONS) \
  /home/risc-v/kernel/linux-stable/include/asm-generic/module.h \
    $(wildcard include/config/HAVE_MOD_ARCH_SPECIFIC) \
    $(wildcard include/config/MODULES_USE_ELF_REL) \
    $(wildcard include/config/MODULES_USE_ELF_RELA) \
  /home/risc-v/kernel/linux-stable/include/linux/build-salt.h \
    $(wildcard include/config/BUILD_SALT) \
  /home/risc-v/kernel/linux-stable/include/linux/elfnote.h \
  /home/risc-v/kernel/linux-stable/include/linux/elfnote-lto.h \
    $(wildcard include/config/LTO) \
  /home/risc-v/kernel/linux-stable/include/linux/export-internal.h \
  /home/risc-v/kernel/linux-stable/include/linux/vermagic.h \
    $(wildcard include/config/PREEMPT_BUILD) \
  include/generated/utsrelease.h \
  /home/risc-v/kernel/linux-stable/arch/riscv/include/asm/vermagic.h \

/home/risc-v/kernel/kernel-modules/hello/hello.mod.o: $(deps_/home/risc-v/kernel/kernel-modules/hello/hello.mod.o)

$(deps_/home/risc-v/kernel/kernel-modules/hello/hello.mod.o):
