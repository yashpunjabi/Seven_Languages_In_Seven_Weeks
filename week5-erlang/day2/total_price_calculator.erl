-module(total_price_calculator).
-export([get_totals/1]).
-export([get_alt_totals/1]).


get_totals(List) ->
    [{Item, Quantity * Price} || {Item, Quantity, Price} <- List].

% another way to do it
get_alt_totals([]) -> [];
get_alt_totals([{Item, Quantity, Price}|Tail]) -> [{Item, Quantity * Price}|get_alt_totals(Tail)].
