-module(lists1).
-export([min1/1,max1/1,min_max/1]).

min1([H|T]) -> min1(H,T).

min1(Min,[]) -> Min;

min1(Min,[H|T]) ->
	if Min > H ->
		min1(H, T);
	   Min =< H ->
		min1(Min, T)
	end.
	
max1([H|T]) -> max1(H,T).

max1(Max,[]) -> Max;

max1(Max,[H|T]) ->
	if Max < H ->
		max1(H, T);
	   Max >= H ->
		max1(Max, T)
	end.

min_max(L) -> {min1(L),max1(L)}.

