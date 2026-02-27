#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>
#include <x86intrin.h>

#define N 1024 // Default matrix size

float tdiff(struct timeval *start, struct timeval *end) {
    return (end->tv_sec - start->tv_sec) +
           1e-6 *(end->tv_usec - start->tv_usec);
}

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

void dgemm_avx2(int n, double* A, double* B, double* C) {
    for (int i = 0; i < n; i += 4) {
        for (int j = 0; j < n; j++) {
            __m256d c0 = _mm256_load_pd(C+i+j*n); /* c0 = C[i][j] */
            for (int k = 0; k < n; k++)
                /* c0 += A[i][k]*B[k][j] */
                c0 = _mm256_add_pd(c0, _mm256_mul_pd(
                            _mm256_load_pd(A+i+k*n),
                            _mm256_broadcast_sd(B+k+j*n)
                        ));
            _mm256_store_pd(C+i+j*n, c0); /* C[i][j] = c0 */
        }
    }
}

// Supported only in AMD and some Intel Xeon microprocessors.
// void dgemm_avx512(int n, double* A, double* B, double* C) {
//     for (int i = 0; i < n; i += 8) {
//         for (int j = 0; j < n; j++) {
//             __m512d c0 = _mm512_load_pd(C+i+j*n); /* c0 = C[i][j] */
//             for (int k = 0; k < n; k++)
//                 /* c0 += A[i][k]*B[k][j] */
//                 c0 = _mm512_add_pd(c0, _mm512_mul_pd(
//                             _mm512_load_pd(A+i+k*n),
//                             _mm512_broadcastsd_pd(_mm_load_sd(B+k+j*n))
//                         ));
//             _mm512_store_pd(C+i+j*n, c0); /* C[i][j] = c0 */
//         }
//     }
// }

void print(int n, double* M) {
    for (int j = 0; j < n; ++j) {
        for (int i = 0; i < n; ++i) {
            if (i) printf(", ");
            printf("%0.2f", *M++);
        }
        printf("\n");
    }
    printf("\n");
}

double A[N * N];
double B[N * N];
double C[N * N];

int main(int argc, const char *argv[]) {
    for (int i = 0; i < N * N; ++i) {
        A[i] = (double)rand() / (double)RAND_MAX;
        B[i] = (double)rand() / (double)RAND_MAX;
        C[i] = 0;
    }
    struct timeval start, end;
    gettimeofday(&start, NULL);

    dgemm_avx2(N, A, B, C);

    gettimeofday(&end, NULL);
    printf("%0.6f\n", tdiff(&start, &end));

    //print(N, A);
    //print(N, B);
    //print(N, C);
    return 0;
}
