Lecture 14
---

# Thread-Level Parallelism

## Lecture

Slides ([PDF](CA_Lecture_14.pdf), [PPTX](CA_Lecture_14.pptx)).

#### Outline

* Parallel programming
* Amdahl's law
* Hardware multithreading
* Multiprocessors
* Cache coherence
* Hardware synchronization

#### Examples

Getting CPU information with Linux system utilities:
* [nproc](https://man7.org/linux/man-pages/man1/nproc.1.html) - getting the number of processor available
* [lscpu](https://man7.org/linux/man-pages/man1/lscpu.1.html) - getting CPU information
* [sysctl](https://man7.org/linux/man-pages/man8/sysctl.8.html) - getting kernel parameters (Mas OS: `sysctl -a machdep.cpu hw`)

Core i7-3615QM (MacBook Pro 2012):
```
machdep.cpu.max_basic: 13
machdep.cpu.max_ext: 2147483656
machdep.cpu.vendor: GenuineIntel
machdep.cpu.brand_string: Intel(R) Core(TM) i7-3615QM CPU @ 2.30GHz
machdep.cpu.family: 6
machdep.cpu.model: 58
machdep.cpu.extmodel: 3
machdep.cpu.extfamily: 0
machdep.cpu.stepping: 9
machdep.cpu.feature_bits: 9203919201183202303
machdep.cpu.leaf7_feature_bits: 641 0
machdep.cpu.leaf7_feature_bits_edx: 2617246720
machdep.cpu.extfeature_bits: 4967106816
machdep.cpu.signature: 198313
machdep.cpu.brand: 0
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC POPCNT AES PCID XSAVE OSXSAVE TSCTMR AVX1.0 RDRAND F16C
machdep.cpu.leaf7_features: RDWRFSGS SMEP ERMS MDCLEAR IBRS STIBP L1DF SSBD
machdep.cpu.extfeatures: SYSCALL XD EM64T LAHF RDTSCP TSCI
machdep.cpu.logical_per_package: 16
machdep.cpu.cores_per_package: 8
machdep.cpu.microcode_version: 33
machdep.cpu.processor_flag: 4
machdep.cpu.xsave.extended_state: 7 832 832 0
machdep.cpu.xsave.extended_state1: 1 0 0 0
machdep.cpu.arch_perf.version: 3
machdep.cpu.arch_perf.number: 4
machdep.cpu.arch_perf.width: 48
machdep.cpu.arch_perf.events_number: 7
machdep.cpu.arch_perf.events: 0
machdep.cpu.arch_perf.fixed_number: 3
machdep.cpu.arch_perf.fixed_width: 48
machdep.cpu.cache.linesize: 64
machdep.cpu.cache.L2_associativity: 8
machdep.cpu.cache.size: 256
machdep.cpu.tlb.inst.small: 64
machdep.cpu.tlb.inst.large: 8
machdep.cpu.tlb.data.small: 64
machdep.cpu.tlb.data.large: 32
machdep.cpu.tlb.shared: 512
machdep.cpu.address_bits.physical: 36
machdep.cpu.address_bits.virtual: 48
machdep.cpu.core_count: 4
machdep.cpu.thread_count: 8
machdep.cpu.tsc_ccc.numerator: 0
machdep.cpu.tsc_ccc.denominator: 0
hw.ncpu: 8
hw.byteorder: 1234
hw.memsize: 8589934592
hw.activecpu: 8
hw.physicalcpu: 4
hw.physicalcpu_max: 4
hw.logicalcpu: 8
hw.logicalcpu_max: 8
hw.cputype: 7
hw.cpusubtype: 4
hw.cpu64bit_capable: 1
hw.cpufamily: 526772277
hw.cacheconfig: 8 2 2 8 0 0 0 0 0 0
hw.cachesize: 8589934592 32768 262144 6291456 0 0 0 0 0 0
hw.pagesize: 4096
hw.pagesize32: 4096
hw.cachelinesize: 64
hw.l1icachesize: 32768
hw.l1dcachesize: 32768
hw.l2cachesize: 262144
hw.l3cachesize: 6291456
hw.tbfrequency: 1000000000
hw.packages: 1
hw.targettype: Mac
hw.cputhreadtype: 1
```

Core i7-8665U (Linux Ubuntu 24):
```
Architecture:             x86_64
  CPU op-mode(s):         32-bit, 64-bit
  Address sizes:          39 bits physical, 48 bits virtual
  Byte Order:             Little Endian
CPU(s):                   8
  On-line CPU(s) list:    0-7
Vendor ID:                GenuineIntel
  Model name:             Intel(R) Core(TM) i7-8665U CPU @ 1.90GHz
    CPU family:           6
    Model:                142
    Thread(s) per core:   2
    Core(s) per socket:   4
    Socket(s):            1
    Stepping:             12
    CPU(s) scaling MHz:   17%
    CPU max MHz:          4800.0000
    CPU min MHz:          400.0000
    BogoMIPS:             4199.88
    Flags:                fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rd
                          tscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx s
                          mx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dno
                          wprefetch cpuid_fault epb ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 
                          erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp
                          _epp vnmi md_clear flush_l1d arch_capabilities
Virtualization features:  
  Virtualization:         VT-x
Caches (sum of all):      
  L1d:                    128 KiB (4 instances)
  L1i:                    128 KiB (4 instances)
  L2:                     1 MiB (4 instances)
  L3:                     8 MiB (1 instance)
NUMA:                     
  NUMA node(s):           1
  NUMA node0 CPU(s):      0-7
```

Core i7-13700 (Linux Ubuntu running in Windows 10 WSL):
```
Architecture:             x86_64
  CPU op-mode(s):         32-bit, 64-bit
  Address sizes:          46 bits physical, 48 bits virtual
  Byte Order:             Little Endian
CPU(s):                   24
  On-line CPU(s) list:    0-23
Vendor ID:                GenuineIntel
  Model name:             13th Gen Intel(R) Core(TM) i7-13700
    CPU family:           6
    Model:                183
    Thread(s) per core:   2
    Core(s) per socket:   12
    Socket(s):            1
    Stepping:             1
    BogoMIPS:             4223.99
    Flags:                fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xt
                          opology tsc_reliable nonstop_tsc cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch
                           invpcid_single ssbd ibrs ibpb stibp ibrs_enhanced fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves
                           umip gfni vaes vpclmulqdq rdpid fsrm md_clear flush_l1d arch_capabilities
Virtualization features:
  Hypervisor vendor:      Microsoft
  Virtualization type:    full
Caches (sum of all):
  L1d:                    576 KiB (12 instances)
  L1i:                    384 KiB (12 instances)
  L2:                     24 MiB (12 instances)
  L3:                     30 MiB (1 instance)
```

## Workshop

#### Outline

* Discuss CPU configuration (clock frequency, core number, caches)
* Implementing multitasking in RISC-V

#### Tasks

1. Timer-based multitasking.

   How would you simulate multitasking using interrupts and timer?
   Write a program that contains two for-loops running in a semi-parallel mode.
   The first prints messages `Thread1: 0`..`Thread1: N` and the second prints messages `Thread2: 0`..`Thread2: N`.
   The program must use timer to switch between the threads.

   Hints:
   * Use [timer.s](../11_Exceptions/timer.s) as a basis.
   * Each thread stores in memory (`.data` section) its PC and values of register it uses.
   * When a timer interrupt occurs, the handler saves current register values, loads the new register values,
     and returns control to the PC of the next thread.

## Homework

__TODO__

## References

* Multicore and Other Shared Memory Multiprocessors. Section 6.5 in [[CODR]](../../books.md).
* Thread-Level Parallelism. Chapter 6 in [[CAQA]](../../books.md) (Advanced, full details).
* [How to check how many CPUs are there in Linux system](https://www.geeksforgeeks.org/how-to-check-how-many-cpus-are-there-in-linux-system/) (www.geeksforgeeks.org).
* [List of Intel Core processors](https://en.wikipedia.org/wiki/List_of_Intel_Core_processors) (Wikipedia).
* [Memory barrier](https://en.wikipedia.org/wiki/Memory_barrier) (Wikipedia).
* [Cache coherence](https://en.wikipedia.org/wiki/Cache_coherence) (Wikipedia).
