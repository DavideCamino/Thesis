subClass(C1, C2) :-
    subclass(C1, C2).
subClass(C1, C3) :-
    subclass(C1, C2),
    subclass(C2, C3).
subClass(C1, C4) :-
    subclass(C1, C2),
    subclass(C2, C3),
    subclass(C3, C4).
