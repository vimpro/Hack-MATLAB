function [a,b,c,d] = DMux4Way(in,sel)
    sel0 = sel(1);
    sel1 = sel(2);
    [x,y] = DMux(in,sel1);
    [a,b] = DMux(x,sel0);
    [c,d] = DMux(y,sel0);
end