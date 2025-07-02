function out = Mux8Way16(a,b,c,d,e,f,g,h,sel)
    sel0 = sel(1);
    sel1 = sel(2);
    sel2 = sel(3);
    m0 = Mux4Way16(a,b,c,d,[sel0 sel1]);
    m1 = Mux4Way16(e,f,g,h,[sel0 sel1]);
    out = Mux16(m0,m1,sel2);
end