function out = Xor(a,b)
    out = Or(And(a,Not(b)),And(Not(a),b));
end