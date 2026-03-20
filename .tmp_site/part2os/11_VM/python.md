Python Virtual Machine and Bytecode
---

Simple program "hello.py":
```python
x = 10
y = 20
z = (x + y) / (y - x)
print(f"z={z}\n")
```

Disassembling the program:
```
python3 -m dis hello.py 
  0           0 RESUME                   0

  1           2 LOAD_CONST               0 (10)
              4 STORE_NAME               0 (x)

  2           6 LOAD_CONST               1 (20)
              8 STORE_NAME               1 (y)

  3          10 LOAD_NAME                0 (x)
             12 LOAD_NAME                1 (y)
             14 BINARY_OP                0 (+)
             18 LOAD_NAME                1 (y)
             20 LOAD_NAME                0 (x)
             22 BINARY_OP               10 (-)
             26 BINARY_OP               11 (/)
             30 STORE_NAME               2 (z)

  4          32 PUSH_NULL
             34 LOAD_NAME                3 (print)
             36 LOAD_CONST               2 ('z=')
             38 LOAD_NAME                2 (z)
             40 FORMAT_VALUE             0
             42 LOAD_CONST               3 ('\n')
             44 BUILD_STRING             3
             46 PRECALL                  1
             50 CALL                     1
             60 POP_TOP
             62 LOAD_CONST               4 (None)
             64 RETURN_VALUE
```

Running the program:
```bash
python3 hello.py 
z=3.0
```

# References

* [Disassembler for Python bytecode](https://docs.python.org/id/3.9/library/dis.html)
* [CPython Internals Documentation: The bytecode interpreter](
  https://github.com/python/cpython/blob/main/InternalDocs/interpreter.md)
* Brandt Bucher. [A tour of CPython's bytecode compiler](
  https://github.com/brandtbucher/brandtbucher/blob/master/2023/03/14/a_tour_of_cpythons_bytecode_compiler.pdf)
* Obi Ike-Nwosu. [Inside The Python Virtual Machine](https://leanpub.com/insidethepythonvirtualmachine/read)
* [PEP 744 – JIT Compilation](https://peps.python.org/pep-0744/)


  
