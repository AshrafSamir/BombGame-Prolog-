dim(4,4).
start([1,0]).
end([2,2]).
bomb([0,1]).
bomb([1,2]).
bomb([2,0]).
bomb([3,0]).
star([2,1]).
star([2,3]).
star([3,2]).



move([X,Y],[Nx,Y],left):-
Nx is X - 1.

move([X,Y],[Nx,Y],right):-
Nx is X + 1.

move([X,Y],[X,Ny],up):-
Ny is Y - 1.

move([X,Y],[X,Ny],down):-
Ny is Y + 1.


unSafe([X,Y]):-
bomb([X,Y]).

unSafe([X,Y]):-
X < 0 ;
Y < 0 .

unSafe([X,Y]):-
dim(Dx,Dy),
X = Dx.

unSafe([X,Y]):-
dim(Dx,Dy),
Y = Dy.

getStar(S,OStar,NStar):-
star(S),
NStar is OStar + 1.

getStar(S,OStar,OStar):-
\+ star(S).



play(Moves,Stars):-
start(S),
path(S,0,[S],Moves,Stars).

path(State,NStar,Goal,Goal,NStar):-
end(State).

path(State,Star,Visited,Moves,Ns):-
move(State,Nstate,Dir),
\+ member(Nstate,Visited),
\+ unSafe(Nstate),
getStar(Nstate,Star,NStar),
path(Nstate,NStar,[Nstate|Visited],Moves,Ns).






