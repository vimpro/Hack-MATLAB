function out = Add16(a,b)
    carry = 0;
    out = zeros(1,16);
    for i = 16:-1:1
        [s,c] = FullAdder(a(i),b(i),carry);
        out(i) = s;
        carry = c;
    end
end