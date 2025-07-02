function out = RAM16K(in,load,address)
    persistent mem
    if isempty(mem)
        mem = zeros(16384,16);
    end
    if load
        mem(address+1,:) = in;
    end
    out = mem(address+1,:);
end