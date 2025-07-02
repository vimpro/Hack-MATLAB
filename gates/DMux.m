function [out1,out2] = DMux(in,sel)
    out1 = And(in,Not(sel));
    out2 = And(in,sel);
end

