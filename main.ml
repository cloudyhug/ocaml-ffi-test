open Ctypes
open Foreign

(* typedef struct {
    int counter;
    char message[40];
} data_t;

typedef int (int_combine_t)(int, int);

data_t create_data(int v, const char* msg);
void print_data(data_t* p_data);
void apply(data_t* p_data, int v, int_combine_t combiner);
void change_msg(data_t* p_data, const char* msg);

void* test_malloc();
void test_free(void* ptr); *)

type data_t
let data_t : data_t structure typ = structure "data_t"
let counter = field data_t "counter" int
let message = field data_t "message" (ptr char)
let () = seal data_t

let int_combine_t = int @-> int @-> returning int

let create_data = foreign "create_data" (int @-> ptr char @-> returning data_t)
let print_data = foreign "print_data" (ptr data_t @-> returning void)
let apply =
  foreign "apply"
    (ptr data_t @-> int @-> funptr int_combine_t @-> returning void)
let change_msg =
  foreign "change_msg" (ptr data_t @-> ptr char @-> returning void)
let test_malloc = foreign "test_malloc" (void @-> returning (ptr void))
let test_free = foreign "test_free" (ptr void @-> returning void)

let add a b = a + b

let () =
  let d = create_data 2 (from_voidp char null) in
  print_data (addr d);
  apply (addr d) 5 add;
  print_data (addr d)