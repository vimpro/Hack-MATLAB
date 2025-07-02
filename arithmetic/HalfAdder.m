function [sum, carry] = HalfAdder(a,b)
    sum = Xor(a,b);
    carry = And(a,b);
end