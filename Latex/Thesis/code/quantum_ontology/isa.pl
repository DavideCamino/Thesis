isA(I, C) :-
    isa(I, C).
isA(I, C) :-
    isa(I, C2),
    subClass(C, C2).
