parent(adam, john).
parent(eve, john).
parent(eve, lisa).
parent(john, anne).
parent(john, pat).
parent(pat, jacob).
parent(carol, jacob).

ancestor(X, Z) :- parent(X, Z).
ancestor(X, Z) :- parent(X, Y), parent(Y, Z).
/*ancestor(X, Z) :- parent(X, Y), parent(Y, W), parent(W, Z).*/

/*head([Head | Tail], Head). gives a warning
tail([Head | Tail], Tail).*/

head([Head | _], Head).
tail([_ | Tail], Tail).

isMember(X, [X | _]).
isMember(X, [_ | Tail]) :- isMember(X, Tail).
/*isMember(X, L) :- L = [H|T], (X = H; isMember(X, T)).*/

concatenate([], L, L).
concatenate([H|T], L, [H|ExtendedTail]) :- concatenate(T, L, ExtendedTail).

prepend(E, T, [E|T]).

addElement([], E, [E]).
addElement([H|T], E, [H|ExtendedTail]) :- addElement(T, E, ExtendedTail).

hasLength([], 0).
hasLength([_|T], L) :- hasLength(T, N), L is N+1.

remove(E, [E|T], T).
remove(E, [H|T], [H|RemovedTail]) :- remove(E, T, RemovedTail).
