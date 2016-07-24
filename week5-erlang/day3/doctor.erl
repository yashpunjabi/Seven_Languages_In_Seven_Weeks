-module (doctor).
-export ([loop/0]).

loop() ->
    process_flag(trap_exit, true),
    receive
        restart ->
            io:format("Creating process.~n" ),
            register(translate, spawn_link(fun translate:loop/0)),
            loop();
        {'EXIT', From, Reason} ->
            io:format("The translator ~p died with reason ~p." , [From, Reason]),
            self() ! restart,
            loop()
        end.
