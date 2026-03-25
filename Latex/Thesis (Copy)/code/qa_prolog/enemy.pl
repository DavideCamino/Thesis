hates(alice, bob).
hates(bob, charlie).

enemy(X, Y) :- hates(X, Y).
enemy(X, Y) :- hates(Y, X).

friend(X, Y) :- 
	enemy(X, Z),
	enemy(Z, Y).
