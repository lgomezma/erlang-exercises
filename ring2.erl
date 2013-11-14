-module(ring2).
-export([start_ring/3, myProc/0]).

start_ring(N, M, Message) ->
	ProcList = create_processes([],N),
	Ring = lists:append(ProcList , [hd(ProcList)]),
	send_message({Message, M}, Ring).

create_processes(ProcList,0)->
		ProcList;
		
create_processes(ProcList, Cont) ->
	case Cont of 
		0 ->
			ProcList;
		_ ->
			create_processes([start()|ProcList], Cont-1)
	end.
		
send_message({_,0},[Following|Rest]) ->
	Following ! {terminate, Rest};
	
send_message({Message, M}, [Following|Rest]) ->
	Following ! {Message, M, Rest},
	send_message({Message, M-1}, [Following|Rest]).
	
myProc() ->
	receive
		{terminate, [Following|Rest]} ->
			io:format("~p received ~p and send to -> ~p~n", [self(), terminate, Following]),
			Following ! {terminate, Rest};
			
		{Message, M, [Following|Rest]} ->
			io:format("~p received the ~p message-> ~p~n", [self(), M, Following]),
			Following ! {Message, M, Rest},
			myProc()
	end.

start() -> spawn(?MODULE, myProc, []).
