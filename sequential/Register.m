function out = Register(in,load)
    persistent state
    if isempty(state)
        state = zeros(1,16);
    end
    if load
        state = in;
    end
    out = state;
end