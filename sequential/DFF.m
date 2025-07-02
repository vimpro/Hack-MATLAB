function out = DFF(in)
    persistent state
    if isempty(state)
        state = 0;
    end
    state = in;
    out = state;
end