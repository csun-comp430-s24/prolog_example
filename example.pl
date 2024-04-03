% exp_list: InputTokens, [Exp], OutputTokens
exp_list(Tokens1, [Exp|RestExps], TokensFinal) :-
    exp(Tokens1, Exp, Tokens2),
    exp_list(Tokens2, RestExps, TokensFinal).
exp_list(Tokens, [], Tokens).

% exp ::= `(` `call` exp methodname exp `)`
exp([lparen_token, call_token|Tokens1],
    call_exp(Exp1, MethodName, Exp2),
    FinalTokens) :-
    exp(Tokens1, Exp1, [method_name(MethodName)|Tokens2]),
    exp(Tokens2, Exp2, [rparen_token|FinalTokens]).

    
    
