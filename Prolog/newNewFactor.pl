newNewFactor(0,_) :- !.
newNewFactor(A,B) :- (A =:= B),!.
newNewFactor(A,B) :- (A>B), (0 is A mod B).
