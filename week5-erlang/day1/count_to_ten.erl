-module(count_to_ten).
-export([count_to_ten/0]).

count_to_ten() -> count_to_ten(0).
count_to_ten(10) -> io:fwrite("10\n");
count_to_ten(X) -> io:fwrite(integer_to_list(X) ++ "\n"), count_to_ten(X + 1).
