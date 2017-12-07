%is_integer(0).
%is_integer(1).
%is_integer(2).
%is_integer(3).
%divide(N1,N2,Result) :- is_integer(Result),
			%Product1 is Result * N2,
			%Product2 is (Result + 1) * N2,
			%Product1 =< N1, Product2 > N1.


divide(n1,n2,X) :- X is n1/n2.

