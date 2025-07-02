function out = Inc16(a)
    one = zeros(1,16);
    one(end) = 1;
    out = Add16(a,one);
end

