datatype 'element set = Empty | Set of 'element * 'element set;

fun isMember (e,Empty) = false
 | isMember (e,Set(x, theSet)) =
    if (e = x)
      then true
    else isMember(e, theSet);

fun list2Set [] = Empty
| list2Set [x::xs] =
    let
      val theSet = Set(x, list2Set [xs])
    in
      if (isMember(x, theSet))
        then
        theSet = theSet
      else
        theSet = Set(x, theSet)
    end;

list2Set [1,2];
