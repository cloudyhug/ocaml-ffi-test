#include "lib.h"

data_t create_data(int v, const char* msg) {
    data_t data;
    data.counter = v;
    strncpy(data.message, msg, 39);
    return data;
}

void print_data(data_t* p_data) {
    printf("%d - %s\n", p_data->counter, p_data->message);
}

void apply(data_t* p_data, int v, int_combine_t combiner) {
    p_data->counter = combiner(p_data->counter, v);
}

void change_msg(data_t* p_data, const char* msg) {
    strncpy(p_data->message, msg, 39);
}

void* test_malloc() {
    return malloc(1);
}

void test_free(void* ptr) {
    free(ptr);
}

int add(int x, int y) {
    return x + y;
}

// int main() {
//     data_t d = create_data(5, "hello");
//     print_data(&d);
//     apply(&d, 3, add);
//     print_data(&d);
//     change_msg(&d, "goodbye");
//     print_data(&d);
// }