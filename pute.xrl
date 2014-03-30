% Pute lexer file

%% Numbers
D = [0-9]

{D}+ : {int, string_to_int(TokenChars)}.
