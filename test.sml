datatype 'element set = Empty | Set of 'element * 'element set;

fun isMember (e,Empty) = false
 | isMember (e,Set(x, theSet)) =
    if (e = x)
      then true
    else isMember(e, theSet);

fun list2Set [] = Empty
| list2Set (x::xs) =
  let
    val j = list2Set xs
  in
    if (isMember (x, j))
    then
      list2Set xs
    else
      Set(x,j)
    end;

val quest5 = isMember ("one", list2Set ["1", "2", "3", "4"]);
