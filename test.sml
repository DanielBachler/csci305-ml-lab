datatype 'element set = Empty | Set of 'element * 'element set;

fun isMember (e,Empty) = false
 | isMember (e,Set(x, theSet)) =
    if (e = x)
      then true
    else isMember(e, theSet);

fun list2Set [] = Empty
| list2Set (x::xs) =
    Set(x, list2Set xs);

list2Set [1,2,3,4];

(*isMember ("one", Set("1", Set("2", Set("3", Set("4", Empty)))));*)
