-module(pattern_match).
-export([pattern_match/1]).

pattern_match(success) -> io:fwrite("success!\n");
pattern_match({error, Message}) ->
    io:fwrite("error: " ++ Message ++ "\n").
