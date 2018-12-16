#include "lib.h"

data_t create_data(int v) {
    data_t data;
    data.counter = v;
    return data;
}

void print_data(data_t* p_data) {
    printf("data:%d\n", p_data->counter);
}

void apply(data_t* p_data, int v, int_combine_t combiner) {
    p_data->counter = combiner(p_data->counter, v);
}

void* test_malloc() {
    return malloc(1);
}

void test_free(void* ptr) {
    free(ptr);
}