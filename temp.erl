-module(temp).
-export([convert/1]).

f2c(F) -> (5*(F-32))/9.

c2f(C) -> ((9*C)/5)+32.

convert({f,T}) -> {c,f2c(T)};

convert({c,T}) -> {f,c2f(T)};

convert({_,_}) -> io:format('Format of temperature incorrect ~n').

    