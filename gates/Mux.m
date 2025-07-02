function out = Mux(a,b,sel)
    out = Or(And(a,Not(sel)),And(b,sel));
end