addpath('gates', 'arithmetic', 'sequential', 'top');

ROM = [
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1;
    1 1 1 0 1 1 0 0 0 0 0 1 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1;
    1 1 1 0 0 0 0 0 1 0 0 1 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    1 1 1 0 0 0 1 1 0 0 0 0 1 0 0 0;
];

Computer(ROM);

% result stored in RAM[0]
mem = Memory(zeros(1,16),0,zeros(1,15));
disp(bi2de(mem,'left-msb'));

