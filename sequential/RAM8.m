function out = RAM8(in,load,address)
    persistent mem
    if isempty(mem)
        mem = zeros(8,16);
    end
    if load
        mem(address+1,:) = in;
    end
    out = mem(address+1,:);
end