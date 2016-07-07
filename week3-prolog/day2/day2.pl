reverse([], []).
reverse([Head1|Tail1], B) :-
    reverse(Tail1, Tail1-rev),
    append(Tail1-rev, Head1, B).

smallest([Head|[]], Head).
smallest([Head|Tail], B) :-
    smallest(Tail, SmallTail),
    B is min(Head, SmallTail).

sort([], []).
sort([Head|[]], Head).
sort(Unsorted, Sorted):-
    smallest(Unsorted, Smallest),
    append(Remaining, Smallest, Unsorted),
    sort(Remaining, RemainingSorted),
    append(Smallest, RemainingSorted, Sorted).
