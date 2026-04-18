hasproperty(I1, ancestor, I2) :-
    hasproperty(I2, sonOf, I1).
hasproperty(I1, ancestor, I2) :-
    hasproperty(I2, sonOf, I3),
    hasproperty(I1, ancestor, I3).
