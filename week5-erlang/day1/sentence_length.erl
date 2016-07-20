-module(sentence_length).
-export([sent_length/1]).

sent_length([]) -> 0;
sent_length([Head|[]]) -> 1; %to count the last word (which doesn't have a space after it)
sent_length([32|Tail]) -> 1 + sent_length(Tail);
sent_length([_|Tail]) -> sent_length(Tail).
