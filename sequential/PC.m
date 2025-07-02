function out = PC(in,load,inc,reset)
    persistent state
    if isempty(state)
        state = zeros(1,16);
    end
    if reset
        state = zeros(1,16);
    elseif load
        state = in;
    elseif inc
        state = Inc16(state);
    end
    out = state;
end
