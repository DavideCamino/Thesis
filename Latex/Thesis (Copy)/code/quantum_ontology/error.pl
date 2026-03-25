error(['A term cannot be true and false.', P]) :- logicNot(P), P.
