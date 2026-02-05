person(marge).
person(bart).
person(jackie).
person(selma).
person(ling).

parent_of(marge, bart).
parent_of(jackie, marge).
parent_of(jackie, selma).
parent_of(selma, ling).

son_of(P, Q) :- parent_of(Q, P).

gran_parent_of(P, Q) :-
	son_of(Q, X),
	son_of(X, P).

cousins(P, Q):-
	gran_parent_of(X, P),
	gran_parent_of(X, Q),
	parent_of(Y, P),
	parent_of(Z, Q),
	Z \= Y.



