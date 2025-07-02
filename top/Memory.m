function out = Memory(in, load, address)
    persistent ram16k screen keyboard
    if isempty(ram16k)
        ram16k = zeros(16384,16);
        screen = zeros(8192,16);
        keyboard = zeros(1,16);
    end

    addr = bi2de(address,'left-msb') + 1;

    if addr < 16384
        if load
            ram16k(addr,:) = in;
        end
        out = ram16k(addr,:);
    elseif addr >= 16384 && addr < 24576
        if load
            screen(addr-16384+1,:) = in;
        end
        out = screen(addr-16384+1,:);
    elseif addr == 24576
        out = keyboard;
    else
        out = zeros(1,16);
    end

end

