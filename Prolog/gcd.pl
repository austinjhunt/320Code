gcd(A,0,A) :-!.
gcd(A,B,D) :- (A > B), (B > 0),!,R is A mod B,gcd(B, R, D). 
gcd(A,B,D) :- (A < B), gcd(B, A, D).
