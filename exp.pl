% op ::= `+` | `-`
% exp ::= INTEGER | `(` op exp exp `)`

op(plus_token, plus_op).
op(minus_token, minus_op).

% exp: InputTokens, Exp, OutputTokens
exp([integer_token(Value)|Rest],
    integer_exp(Value),
    Rest).
exp([left_paren, OpToken|Rest1],
    op_exp(Op, Exp1, Exp2),
    Rest3) :-
    op(OpToken, Op),
    exp(Rest1, Exp1, Rest2),
    exp(Rest2, Exp2, [right_paren|Rest3]).
     
