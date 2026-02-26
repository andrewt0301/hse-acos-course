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

    dgemm(N, A, B, C);

    gettimeofday(&end, NULL);
    printf("%0.6f\n", tdiff(&start, &end));
    return 0;
}
