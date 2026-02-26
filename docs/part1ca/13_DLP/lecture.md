Lecture 13
---

# Data-Level Parallelism

## Lecture

Slides ([PDF](CA_Lecture_13.pdf), [PPTX](CA_Lecture_13.pptx)).

#### Outline

__TODO__


#### Examples

Optimizing DGEMM (Double-precision GEneral Matrix Multiply) using data-level parallelism.

See example [matrix.c](matrix.c). Compile and run it with different versions of DGEMM:
```bash
gcc -o matrix matrix.c -march=native
./matrix
```

Unoptimized version:
```c
void dgemm(int n, double* A, double* B, double* C) {
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            double cij = C[i+j*n]; /* cij = C[i][j] */
            for (int k = 0; k < n; k++)
                cij += A[i+k*n] * B[k+j*n]; /* cij += A[i][k]*B[k][j] */
            C[i+j*n] = cij; /* C[i][j] = cij */
        }
    }
}
```


## Workshop

#### Outline

* Using RISC-V 64-bit instructions to simulate vector operations

#### Examples

* [add_vector.s](add_vector.s)

_NOTE_:
The `ld` and `sd` instructions are 64-bit load and store correspondingly.
They are available in the 64-bit version of RISC-V and 64-bit mode of RARS.
To enable 64-bit mode in RARS, tick the checkbox in the `Setting | 64-bit` menu item.
This will make all general-purpose registers 64-bit wide.
The `ld` and `sd` instructions work in the same way as `lw` and `sw`,
the only difference is the data size that becomes 64 bits (or 8 bytes).
See the "Chapter 7. RV64I Base Integer Instruction Set" in the [RISC-V instruction set manual](
https://github.com/riscv/riscv-isa-manual/releases/latest) for details.

#### Tasks

* Write a program that inputs an integer value `N`, inputs 2 matrices of size 4 * `N`,
  adds the two matrices, and prints the resulting matrix. Each element of a matrix is a byte value.
  Elements of the matrices are added by `4`, to simulate vector operations.
  _Hint:_ Use the `lw` and `sw` instructions to load and store 4 elements at once.

## Homework

__TODO__

## References

* [RISC-V Vector Intrinsic Document](https://github.com/riscv-non-isa/rvv-intrinsic-doc)
* [Programming with RISC-V Vector Instructions](https://gms.tf/riscv-vector.html)
