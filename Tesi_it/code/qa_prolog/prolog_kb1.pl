sings(mia).
listens2Music(yolanda).
party.

dance(yolanda):- listens2Music(yolanda).
happy(yolanda):- dance(yolanda).
happy(mia):- sings(mia).

smile(X) :- happy(X).
