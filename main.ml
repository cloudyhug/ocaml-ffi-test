open Ctypes
open Foreign

type data_t
let data_t : data_t structure typ = structure "data_t"
let counter = field data_t "counter" int
let () = seal data_t

let int_combine_t = int @-> int @-> returning int

let create_data = foreign "create_data" (int @-> returning data_t)
let print_data = foreign "print_data" (ptr data_t @-> returning void)
let apply =
  foreign "apply"
    (ptr data_t @-> int @-> funptr int_combine_t @-> returning void)
let test_malloc = foreign "test_malloc" (void @-> returning (ptr void))
let test_free = foreign "test_free" (ptr void @-> returning void)

let add a b = a + b

let () =
  let d = create_data 2 in
  print_data (addr d);
  apply (addr d) 5 add;
  print_data (addr d);
  let p = test_malloc() in
  test_free p