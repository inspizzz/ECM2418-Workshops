

% list digits as an array
digits( N, [N] ) :-
    N < 10.
digits( N, P ) :-
    N >= 10,
    D is N div 10,
    M is N mod 10,
    digits( D, R ),
    append(R, [M], P ).

% remove duplicates
nub( [], [] ).
nub( [X|XS], [X|W] ) :-
	\+ member( X, XS ),
    nub( XS, W ).
nub( [X|XS], W ) :-
    member( X, XS ),
    nub( XS, W ).
    
par( N ) :-
    digits( N, [X1,X2,X3,X4] ),
   	X1 > 0, X2 > 0, X3 > 0, X4 > 0,
    nub( [X1,X2,X3,X4], [X1,X2,X3,X4] ),
    0 is (10 * X3 + X4) mod (10 * X1 + X2).

% intercection of two lists
intersection( [], _, [] ).
intersection( [X|XS], YS, [X|W] ) :-
	member( X, YS ),
    intersection( XS, YS, W ).
intersection( [X|XS], YS, W) :-
    \+ member( X, YS ),
    intersection( XS, YS, W ).

difference( [], _, [] ).
difference( [X|XS], YS, [X|W] ) :-
    \+ member( X, YS ),
    difference( XS, YS, W ).
difference( [X|XS], YS, W ) :-
    member( X, YS ),
    difference( XS, YS, W ).

party( [M,N] ) :-
    digits( M, [X1,X2,X3,X4] ),
    digits( N, [Y1,Y2,Y3,Y4] ),
    intersection( [X1,X2,X3,X4], [Y1,Y2,Y3,Y4], [] ),
    difference( [1,2,3,4,5,6,7,8,9],
                [X1,X2,X3,X4,Y1,Y2,Y3,Y4], [W] ),
    0 is M mod W,
    0 is N mod W.

generator( [M|N] ) :-
    between( 1234, 9876, M), par( M ),
    between( 1234, 9876, N), par( N ).
    
             
main :-
    generator( P ), party( P ), write( P ).
