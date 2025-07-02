function out = Mux4Way16(a,b,c,d,sel)
    sel0 = sel(1);
    sel1 = sel(2);
    out_ab = Mux16(a,b,sel0);
    out_cd = Mux16(c,d,sel0);
    out = Mux16(out_ab,out_cd,sel1);
end