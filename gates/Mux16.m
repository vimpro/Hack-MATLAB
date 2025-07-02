function out = Mux16(a,b,sel)
    out = (a & repmat(~sel,1,16)) | (b & repmat(sel,1,16));
end