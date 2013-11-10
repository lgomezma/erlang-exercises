-module(mathStuff).
-export([perimeter/1]).

perimeter(Form) ->
    case Form of 
		{square, Side} -> 4*Side;
		{circle, Radius} -> 2*math:pi()*Radius;
		{triangle,A,B,C} -> A+B+C;
		_ -> io:format('Form not supported ~n')
	end.
	