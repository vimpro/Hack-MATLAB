function [sum, carry] = FullAdder(a,b,c)
    [s1, c1] = HalfAdder(a,b);
    [sum, c2] = HalfAdder(s1,c);
    carry = Or(c1,c2);
end