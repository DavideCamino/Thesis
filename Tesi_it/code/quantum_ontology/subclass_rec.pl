subClass(C1, C2) :-
    subclass(C1, C2).
subClass(C1, C2) :-
    subclass(C1, C3),
    subClass(C3, C2).
