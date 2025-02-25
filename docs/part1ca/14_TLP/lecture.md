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

Core i7-8665U:
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

Core i7-13700:
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

__TODO__

## Homework

__TODO__

## References

* [How to check how many CPUs are there in Linux system](https://www.geeksforgeeks.org/how-to-check-how-many-cpus-are-there-in-linux-system/) (www.geeksforgeeks.org).
* [List of Intel Core processors](https://en.wikipedia.org/wiki/List_of_Intel_Core_processors) (Wikipedia).
* [Memory barrier](https://en.wikipedia.org/wiki/Memory_barrier) (Wikipedia).
