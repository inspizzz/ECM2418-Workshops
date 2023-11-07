
# factorial
factorial( 0, 1 ).
factorial( N, W ) :-
    N1 is N-1,
    factorial( N1, V),
    W is N*V.
    
# sum the list
sum_list( [], 0 ).
sum_list( [X|XS], W ) :-
    sum_list( XS, V ),
    W is X + V.
    
# max list 
max_list( [E], E ).
max_list( [X|XS], X ) :-
    max_list( XS, V ),
    X > V.
    
max_list( [X|XS], V ) :-
    max_list( XS, V ),
    X =< V.

# member list
member_list( E, [X|_] ).
member_list( E, [_|XS] ) :-
    member_list(E, XS).

# reverse list
reverse_list( [], []).
reverse_list( [X|XS], W) :-
    reverse_list( XS, V ),
    append( V, [X], W).

# insert element 
insert_list( E, [], [E] ).
insert_list(E, [X|XS], [E,X|XS] ) :-
    E < X.

# there is another case ...
main :-
    member_list( 1, [1, 2, 3] ).
