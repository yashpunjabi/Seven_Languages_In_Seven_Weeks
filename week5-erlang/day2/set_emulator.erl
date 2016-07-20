-module(set_emulator).
-export([get_value/2]).

get_value(Item, Set) ->
    [Head|_] = [Value || {Key, Value} <- Set, Key == Item],
    Head.
