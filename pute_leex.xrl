% Pute lexer file

Definitions.
D = [0-9].

Rules.
% Numbers
\-?{D}+ :
{token, {integer, TokenLine, string_to_number(TokenChars)}}.
\-?{D}+\.{D}* :
{token, {float, TokenLine, string_to_number(TokenChars)}}.


Erlang code.

char_to_int(Char) ->
    Char - $0.
string_to_number(String) ->
    string_to_number(String, 0).
string_to_number([$-|T], Number) ->
    0 - string_to_number(T, Number);
string_to_number([$.|T], Number) ->
    Number + string_to_decimals(T);
string_to_number([H|T], Number) ->
    NewNumber = (Number * 10) + char_to_int(H),
    string_to_number(T, NewNumber);
string_to_number([], Number) -> Number.

string_to_decimals(String) ->
    string_to_number(String) / math:pow(10, length(String)).
