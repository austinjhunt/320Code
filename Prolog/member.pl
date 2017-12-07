
member(X,[X|_]):- !.  %if first element is match, true. 

%recursively iterate through list.

member(X,[_|Z]) :- member(X,Z). 
