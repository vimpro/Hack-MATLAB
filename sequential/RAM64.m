function out = RAM64(in,load,address)
    persistent mem
    if isempty(mem)
        mem = zeros(64,16);
    end
    if load
        mem(address+1,:) = in;
    end
    out = mem(address+1,:);
end