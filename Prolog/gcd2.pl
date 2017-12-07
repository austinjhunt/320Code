gcd2(A,0,A) :- !. 
gcd2(A,B,D) :- (A > B), (B > 0),!, R is A mod B, gcd2(B,R,D). 
gcd2(A,B,D) :- (A < B), gcd2(B,A,D). 
