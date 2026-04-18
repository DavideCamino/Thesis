isNotA(I, C) :-
    disjointClasses(C, C2),
    isA(I, C2).

error(I, C, M) :- 
    isA(I, C),
    isNotA(I, C),
    M = 'Individual X cannot belong and not belong to class Y'.
