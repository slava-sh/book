open Core_kernel

let%test_unit "List.rev_append is List.append of List.rev" =
  let generator =
    let int_list_gen =
      List.gen_non_empty (Int.gen_incl Int.min_value Int.max_value)
    in
    Quickcheck.Generator.both int_list_gen int_list_gen
  in
  Quickcheck.test
    ~sexp_of:[%sexp_of: int list * int list]
    generator
    ~f:(fun (l1,l2) ->
        [%test_eq: int list]
          (List.rev_append l1 l2)
          (List.append (List.rev l1) l2))
