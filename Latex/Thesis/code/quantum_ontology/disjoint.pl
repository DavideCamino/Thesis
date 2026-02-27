disjointClasses(carnivore, herbivore).

logicNot(isA(I, C)) :-
    disjointClasses(C, C2),
    isA(I, C2).
