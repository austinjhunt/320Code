append([],List,List).
append([ Head | List1 ] , List2 , [Head | List3 ] ) :- append(List1,List2,List3).

