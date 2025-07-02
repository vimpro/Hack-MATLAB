function [out, zr, ng] = ALU(x,y,zx,nx,zy,ny,f,no)
    if zx
        x = zeros(1,16);
    end
    if nx
        x = Not16(x);
    end
    if zy
        y = zeros(1,16);
    end
    if ny
        y = Not16(y);
    end
    if f
        out = Add16(x,y);
    else
        out = And16(x,y);
    end
    if no
        out = Not16(out);
    end
    zr = ~any(out);
    ng = out(1);

    fprintf('  ALU in x: %s\n', num2str(x));
    fprintf('  ALU in y: %s\n', num2str(y));
    fprintf('  ALU out: %s\n', num2str(out));
    fprintf('  ALU zr: %d, ng: %d\n', zr, ng);
end
