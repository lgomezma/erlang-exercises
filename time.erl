-module(time).
-export([swedish_date/0]).

swedish_date() -> swedish_date(date()).

swedish_date({Y,M,D}) -> lists:concat([lists:sublist(integer_to_list(Y),3,2),M,D]).