%specify the partitioning/splitting relationship
%pivot value will be the first element 

split(_,[],[],[]).
split(Pivot, [Head|Tail], [Head|Sm], Lg ) :- (Head < Pivot), split(Pivot, Tail, Sm, Lg). 
split(Pivot, [Head|Tail], Sm, [Head|Lg]) :- (Pivot =< Head), split(Pivot, Tail, Sm, Lg). 

%specify a sorted relationship according to quicksort
%need an append relationship.

append([],List,List). 
append([Head|List1],List2,[Head|List3]) :- append(List1,List2,List3).

quicksort([],[]). %if empty, it's sorted.
quicksort([Head|[]],[Head]). %if one element, sorted. 
quicksort([Pivot|Unsorted], AllSorted) :-	split(Pivot,Unsorted,Small,Large),
						quicksort(Small,Smsorted),
						quicksort(Large,Lgsorted),
						append(Smsorted, [Pivot | Lgsorted], AllSorted).




