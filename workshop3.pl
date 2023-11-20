generator( X ) :-
    between( 0, 1000, X ).

inrange( P, Q, P ) :-
    P =< Q.

inrange( P, Q, W ) :-
    P =< Q,
    P1 is P + 1,
    inrange(P1, Q, W ).

celsius_to_fahrenheit( C, F ) :-
    F is C * 1.8 + 32.

/*
# flaw			0.6 -> 0
# ceil			0.6 -> 1
# truncate 		4.6 -> 4
*/

whole_number( X ) :-
    floor( X ) =:= ceil( X ).

digits( N, [N] ) :-
    N < 10.

digits( N, O ) :-
    N >= 10,
    div_mod( N, 10, D, M ),
    digits( D, R ),
    append( R, [M], O ).

div_mod( A, B, D, M) :-
    D is A div B,
    M is A mod B.

decreasing( [] ).
decreasing( [_] ).
decreasing( [D1,D2|DS] ) :-
    D1 > D2,
    decreasing( [D2|DS] ).

increasing( [] ).
increasing( [_] ).
increasing( [D1,D2|DS] ) :-
    D1 < D2,
    increasing( [D2|DS] ).

different( [] ).
different( [H|T] ) :-
    \+ member( H, T ), different( T ).

main :-
    generator( T ), tester( T ), write( T ).

tester( C ) :-
    celsius_to_fahrenheit( C, W ),
    whole_number( W ),
    F is truncate( W ),
    digits( C, Cs ),
    digits( F, Fs ),
    different( Cs ),
    different( Fs ),
    decreasing( Cs ),
    increasing( Fs ).
    
