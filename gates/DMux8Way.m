function [a,b,c,d,e,f,g,h] = DMux8Way(in,sel)
    sel0 = sel(1);
    sel1 = sel(2);
    sel2 = sel(3);
    [x,y] = DMux(in,sel2);
    [a,b,c,d] = DMux4Way(x,[sel0 sel1]);
    [e,f,g,h] = DMux4Way(y,[sel0 sel1]);
end

