hates(alice, bob).
hates(bob, charlie).

enemy(A, B) :- hates(A, B).
enemy(A, B) :- hates(B, A).

friend(A, B) :- 
	enemy(A, C),
	enemy(C, B).
