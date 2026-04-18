ancestor1(I1, I2) :-
    hasproperty(I2, sonOf, I1).
ancestor2(I1, I2) :-
    ancestor1(I1, I3),
    hasproperty(I2, sonOf, I3).
ancestor3(I1, I2) :-
    ancestor2(I1, I3),
    hasproperty(I2, sonOf, I3).
		...
ancestor9(I1, I2) :-
    ancestor8(I1, I3),
    hasproperty(I2, sonOf, I3).

ancestor_unfold(I1, I2) :-
    ancestor1(I1, I2);
    ancestor2(I1, I2);
		...
    ancestor9(I1, I2).

hasProperty(I1, P, I2) :-
    hasproperty(I1, P, I2).
hasProperty(I1, ancestor,I2) :-
    ancestor_unfold(I1, I2).
