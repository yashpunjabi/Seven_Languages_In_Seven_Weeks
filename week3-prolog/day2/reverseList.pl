reverse([], []).
reverse([Head1|Tail1], B) :-
    reverse(Tail1, Tail1-rev),
    append(Tail1-rev, Head1, B).
