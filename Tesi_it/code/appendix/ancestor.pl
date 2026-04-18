ancestor1(I1, I2) :-
    hasproperty(I2, sonOf, I1).
ancestor1(I1, I2) :-
    hasproperty(I2, sonOf, I3).
    hasproperty(I1, marry, I3).
ancestor2(I1, I2) :-
	hasproperty(I1, grandParentOf, I2).
ancestor2(I1, I2) :-
    ancestor1(I1, I3),
    hasproperty(I2, sonOf, I3).
ancestor2(I1, I2) :-
    ancestor1(I3, I2),
    hasproperty(I3, sonOf, I4).
    hasproperty(I1, marry, I4).
ancestor3(I1, I2) :-
	ancestor1(I3, I2)
	hasproperty(I1, grandParentOf, I2).
ancestor3(I1, I2) :-
	ancestor2(I3, I2)
	hasproperty(I3, sonOf, I1).
ancestor3(I1, I2) :-
	ancestor2(I3, I2)
	hasproperty(I3, sonOf, I4).
	hasproperty(I1, marry, I4).
	...
