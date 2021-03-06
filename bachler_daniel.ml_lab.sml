(***************************************************************
*
* CSCI 305 - ML Programming Lab
*
* Daniel Bachler
* daniel.bachler@comcast.net
*
***************************************************************)

(* Define your data type and functions here *)
(*Creates a recursive datatype called set, with 2 states.  Empty and Set, with Set being the recursive element.
It is a polymorphic datatype*)
datatype 'element set = Empty | Set of 'element * 'element set;

(*Takes 2 arguments, a number and a set.  If the set is defined as empty returns false by default.
Other wise starts going through the set testing for equality until a match is found.  If no match is found
false is returned*)
fun isMember (e,Empty) = false
 | isMember (e,Set(x, theSet)) =
    if (e = x)
      then true
    else isMember(e, theSet);

(*Has 2 possible patterns, an empty list returns an Empty set item
The other takes in a list and sets the head to x, the tail or rest of list to xs
Within the function the value of j is the rest of the list with the function called on it
and that value is used in an if statement.  The if statement checks if the current head is
already in the set, if it is it just moves on to the tail, otherwise it adds the head to the set
and moves on.*)
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

(* Simple function to stringify the contents of a Set of characters *)
fun stringifyCharSet Empty = ""
  | stringifyCharSet (Set(y, ys)) = Char.toString(y) ^ " " ^ stringifyCharSet(ys);

(* Simple function to stringify the contents of a Set of ints *)
fun stringifyIntSet Empty = ""
  | stringifyIntSet (Set(w, ws)) = Int.toString(w) ^ " " ^ stringifyIntSet(ws);

(* Simple function to stringify the contents of a Set of strings *)
fun stringifyStringSet Empty = ""
  | stringifyStringSet (Set(z, zs)) = z ^ " " ^ stringifyStringSet(zs);

(* Simple function that prints a set of integers *)
fun print_int x = print ("{ " ^ stringifyIntSet(x) ^ "}\n");

(* Simple function that prints a set of strings *)
fun print_str x = print ("{ " ^ stringifyStringSet(x) ^ "}\n");

(* Simple function that prints a set of characters *)
fun print_chr x = print ("{ " ^ stringifyCharSet(x) ^ "}\n");

list2Set [1, 3, 2];
list2Set [#"a", #"b", #"c"];
list2Set [];
list2Set [6, 2, 2];
list2Set ["x", "y", "z", "x"];

(* Question 1 *)
fun f [] = [] (* a *)
  | f (x::xs) = (x + 1) :: (f xs); (* b *)

f [3, 1, 4, 1, 5, 9];

(* Question 5 *)
val quest5 = isMember ("one", list2Set ["1", "2", "3", "4"]);
print ("\nQuestion 5: " ^ Bool.toString(quest5) ^ "\n");

(* Question 7 *)
val quest7 = list2Set ["it", "was", "the", "best", "of", "times,", "it", "was", "the", "worst", "of", "times"];
print "\nQuestion 7: ";
print_str quest7;
print "\n";

(* Question 9 *)
print "\nQuestion 9: ";
print_str (union (list2Set ["green", "eggs", "and"]) (list2Set ["ham"]));

(* Question 10 *)
print "\nQuestion 10: ";
print_str (intersect (list2Set ["stewed", "tomatoes", "and", "macaroni"]) (list2Set ["macaroni", "and", "cheese"]));
