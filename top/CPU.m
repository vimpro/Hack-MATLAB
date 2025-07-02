function [outM, writeM, addressM, pc] = CPU(inM, instruction, reset)
    persistent A D pcState
    if isempty(A)
        A = zeros(1,16);
    end
    if isempty(D)
        D = zeros(1,16);
    end
    if isempty(pcState)
        pcState = zeros(1,16);
    end

    opcode = instruction(1); % 0=A instruction, 1=C instruction
    a_bit  = instruction(4);
    c_bits = instruction(5:10); % comp
    d_bits = instruction(11:13); % dest
    j_bits = instruction(14:16); % jump

    % defaults
    outM = zeros(1,16);
    writeM = 0;
    addressM = A;
    pc = pcState;

    if opcode == 0
        % A instruction
        A = [0 instruction(2:16)]; % pad to make 16 bits
        addressM = A;
        pcState = Inc16(pcState);

        pc = pcState;
    else
        % C instruction
        x = D;
        if a_bit
            y = inM;
        else
            y = A;
        end

        [alu_out, zr, ng] = ALU( ...
            x, ...
            y, ...
            c_bits(1), ...
            c_bits(2), ...
            c_bits(3), ...
            c_bits(4), ...
            c_bits(5), ...
            c_bits(6) ...
        );

        fprintf('  ALU output: %s, zr: %d, ng: %d\n', num2str(alu_out), zr, ng);


        % destinations
        if d_bits(1)
            A = alu_out;
        end
        if d_bits(2)
           D = alu_out;
        end
        if d_bits(3)
            outM = alu_out;
            writeM = 1;
        end

        fprintf('CPU D: %s\n', num2str(D));
        fprintf('CPU A: %s\n', num2str(A));


        addressM = A;

        % jumps
        jump = (j_bits(1) && ng) || ...
               (j_bits(2) && zr) || ...
               (j_bits(3) && ~ng && ~zr);
        if jump
            pcState = A;
        else
            pcState = Inc16(pcState);
        end
        pc = pcState;
    end

end

