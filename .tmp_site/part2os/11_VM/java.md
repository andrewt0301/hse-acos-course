Java Virtual Machine and Bytecode
---

Installing Java:

```bash
sudo apt install openjdk-21-jdk
```

_Simple program Hello.java:_
```java
public class Hello {
  public static void main(String[] args) {
    int x = 10;
    int y = 20;
    int z = (x + y) / (y - x);
    System.out.printf("z=%d\n", z);
  }
}
```

Compiling the program and viewing its bytecode:
```bash
javac Hello.java 
javap -c Hello
```

The bytecode:
```java
Compiled from "Hello.java"
public class Hello {
  public Hello();
    Code:
       0: aload_0
       1: invokespecial #1                  // Method java/lang/Object."<init>":()V
       4: return

  public static void main(java.lang.String[]);
    Code:
       0: bipush        10
       2: istore_1
       3: bipush        20
       5: istore_2
       6: iload_1
       7: iload_2
       8: iadd
       9: iload_2
      10: iload_1
      11: isub
      12: idiv
      13: istore_3
      14: getstatic     #7                  // Field java/lang/System.out:Ljava/io/PrintStream;
      17: ldc           #13                 // String z=%d\n
      19: iconst_1
      20: anewarray     #2                  // class java/lang/Object
      23: dup
      24: iconst_0
      25: iload_3
      26: invokestatic  #15                 // Method java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
      29: aastore
      30: invokevirtual #21                 // Method java/io/PrintStream.printf:(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
      33: pop
      34: return
}
```

Running the program:
```bash
java Hello 
z=3
```

# References

* [Java Virtual Machine](https://en.wikipedia.org/wiki/Java_virtual_machine) (Wikipedia).
* [Java bytecode](https://en.wikipedia.org/wiki/Java_bytecode) (Wikipedia).
* [The Java® Virtual Machine Specification](https://docs.oracle.com/javase/specs/jvms/se24/html/index.html)
