isA(I, carnivore) :-
    hasproperty(I, hunt, _).
isA(I, predator) :-
    hasproperty(I, hunt, _).
isA(I, prey) :-
    hasproperty(_, hunt, I).
