#include <stdlib.h> // malloc, free
#include <stdio.h> // printf

typedef struct {
    int counter;
} data_t;

typedef int (int_combine_t)(int, int);

data_t create_data(int v);
void print_data(data_t* p_data);
void apply(data_t* p_data, int v, int_combine_t combiner);

void* test_malloc();
void test_free(void* ptr);