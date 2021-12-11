%% 403 Final Examination
% Cassie Jeng

% Problem 1: Mixed Integer Linear Programming Solver

% MILP matlab function
% define problem vectors

c = [36 28 46 24 50 48];
ints = [5 6];
A = zeros(5,6);
b = zeros(5,1);
Aeq = [1 1 0 0 0 0;
       0 0 1 1 0 0;
       -1 0 -1 0 1 0;
       0 -1 0 -1 0 1;
       0 0 0 0 -1 -1];
beq = [15; 10; 0; 0; -25];
lb = [0 0 0 0 0 0];
ub = [15 inf inf 14 20 18];

[x,zmin] = intlinprog(c,ints,A,b,Aeq,beq,lb,ub);
disp(['xac = ' num2str(x(1))])
disp(['xad = ' num2str(x(2))])
disp(['xbc = ' num2str(x(3))])
disp(['xbd = ' num2str(x(4))])
disp(['xct = ' num2str(x(5))])
disp(['xdt = ' num2str(x(6))])
disp(['minimized order cost = $', num2str(zmin)])

