#include <stdlib.h> // malloc, free
#include <string.h> // strncpy
#include <stdio.h> // printf

typedef struct {
    int counter;
    char message[40];
} data_t;

typedef int (int_combine_t)(int, int);

data_t create_data(int v, const char* msg);
void print_data(data_t* p_data);
void apply(data_t* p_data, int v, int_combine_t combiner);
void change_msg(data_t* p_data, const char* msg);

void* test_malloc();
void test_free(void* ptr);