Clang and LLVM
---

Installing [Clang](https://clang.llvm.org/):

```bash
sudo apt install clang
```

_Simple program Hello.c:_
```c
#include <stdio.h>

int main() {
  int x = 10;
  int y = 20;
  int z = (x + y) / (y - x);
  printf("z=%d\n", z);
  return 0;
}
```

Translating a C program into LLVM IR (human-readable) using Clang:
```bash
clang -emit-llvm -c -S hello.c
cat hello.ll
```

The generated code:
```
; ModuleID = 'hello.c'
source_filename = "hello.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"z=%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 10, ptr %2, align 4
  store i32 20, ptr %3, align 4
  %5 = load i32, ptr %2, align 4
  %6 = load i32, ptr %3, align 4
  %7 = add nsw i32 %5, %6
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %2, align 4
  %10 = sub nsw i32 %8, %9
  %11 = sdiv i32 %7, %10
  store i32 %11, ptr %4, align 4
  %12 = load i32, ptr %4, align 4
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %12)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
```

Converting LLVM IR into bitcode (binary format) with [llvm-as](https://llvm.org/docs/CommandGuide/llvm-as.html):
```bash
llvm-as hello.ll -o hello.bc
```

Interpreting LLVM bitcode with [lli](https://llvm.org/docs/CommandGuide/lli.html):
```bash
lli hello.bc 
```

Translating LLVM bitcode to an assembly file:
```bash
llc hello.bc -o hello.s
```

Compiling LLVM bitcode to an executable file:
```bash
clang hello.bc -o hello
```

# References

* [LLVM](https://en.wikipedia.org/wiki/LLVM) (Wikipedia)
* [Clang](https://en.wikipedia.org/wiki/Clang) (Wikipedia)
* [The LLVM Compiler Infrastructure](https://llvm.org/)
* Chris Lattner. [The Architecture of Open Source Applications (Volume 1) / LLVM](https://aosabook.org/en/v1/llvm.html)
