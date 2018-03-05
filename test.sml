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


fun union set1 (e, Empty) = set1
| union set1 (y, set2) =
    if (isMember(y, set1))
    then
      set1 = union (set1, set2)
    else
      set1 = (y, union(set1, set2));


val i = list2Set [1,2,3,4];
val j = list2Set [5,6,7,8];
union (i, j)
