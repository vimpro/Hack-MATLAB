function [] = Computer(ROM)
    pc = zeros(1,16);
    addressM = zeros(1,16);

    for cycle = 1:20
        rom_addr = bi2de(pc,'left-msb') + 1;
        if rom_addr > size(ROM,1)
            fprintf("PC out of ROM bounds at cycle %d, halting", cycle);
            break;
        end
        instruction = ROM(rom_addr,:);

        fprintf('Cycle %d, PC: %d, Instruction: %s\n', cycle, rom_addr-1, num2str(instruction));

        inM = Memory(zeros(1,16),0,zeros(1,15)); % read memory at address 0 (or addressM from last cycle)
        [outM, writeM, addressM, pc] = CPU(inM, instruction, 0);

        fprintf('  writeM: %d, addressM: %d, outM: %s\n', writeM, bi2de(addressM,'left-msb'), num2str(outM));

        Memory(outM, writeM, addressM);
    end


    mem0 = Memory(zeros(1,16), 0, zeros(1,15));
    fprintf("RAM[0] after execution: %d\n", bi2de(mem0, 'left-msb'));
end

