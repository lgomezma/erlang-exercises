-module(roundtrip).
-export([talk/1]).

talk(M) ->
	init(M).
	
init(M) ->
	P1 = start(M),
	P2 = start(M),
	P2 ! {P1, a_message}.
	
myProc(M) ->
	case M of
	0 ->
		io:format("Bye cruel world!~n");
	_ ->
		receive
			{From, a_message} ->
				From ! {self(), a_message},
				myProc(M-1);
			_ -> 
				io:format("I don't understand~n"),
				myProc(M)
		
		end
	end.
	
start(M) ->
	spawn(fun() -> myProc(M) end).
	
	