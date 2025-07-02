function out = Bit(in,load)
    persistent state
    if isempty(state)
        state = 0;
    end
    if load
        state = in;
    end
    out = state;
end