logicAnd(false, false, false).
logicAnd(false, true,  false).
logicAnd(true,  false, false).
logicAnd(true,  true,  true).

logicNot(false, true).
logicNot(true,  false).

logicOr(false, false, false).
logicOr(false, true,  true).
logicOr(true,  false, true).
logicOr(true,  true,  true).

satFormula(A, B, C, Y) :-
	logicOr(B, C, X),
	logicNot(X, Z),
	logicAnd(A, Z, Y).
