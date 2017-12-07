factor(X,X) :- !. 
factor(_,1) :- !. 
factor(0,_) :- !. 
factor(X,Y) :- (X @>= Y),R is X mod Y, factor(R,Y). 
 
