%% 403 Final Examination
% Cassie Jeng

% Problem 1: Mixed Integer Linear Programming Solver

% testing affect of inaccuracy in cost parameter estimation

% original
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
disp('--------------------------------')
disp('original optimal solution')
disp(['xac = ' num2str(x(1))])
disp(['xad = ' num2str(x(2))])
disp(['xbc = ' num2str(x(3))])
disp(['xbd = ' num2str(x(4))])
disp(['xct = ' num2str(x(5))])
disp(['xdt = ' num2str(x(6))])
disp(['minimized order cost = $', num2str(zmin)])
disp('--------------------------------')
disp(newline)

originalX = x;

%% check cost parameter inaccuracy by 10,20,30 percent increase/decrease

for i=[10 20 30]
    less = 1-(i*.01);
    more = 1+(i*.01);
    
    % c1 i percent more/less
    c = [36*less 28 46 24 50 48];
    [x,zmin] = c_model(c,'c1',i,'less',originalX);
    c = [36*more 28 46 24 50 48];
    [x,zmin] = c_model(c,'c1',i,'more',originalX);

    % c2 i percent more/less
    c = [36 28*less 46 24 50 48];
    [x,zmin] = c_model(c,'c2',i,'less',originalX);
    c = [36 28*more 46 24 50 48];
    [x,zmin] = c_model(c,'c2',i,'more',originalX);

    % c3 i percent more/less
    c = [36 28 46*less 24 50 48];
    [x,zmin] = c_model(c,'c3',i,'less',originalX);
    c = [36 28 46*more 24 50 48];
    [x,zmin] = c_model(c,'c3',i,'more',originalX);

    % c4 i percent more/less
    c = [36 28 46 24*less 50 48];
    [x,zmin] = c_model(c,'c4',i,'less',originalX);
    c = [36 28 46 24*more 50 48];
    [x,zmin] = c_model(c,'c4',i,'more',originalX);

    % c5 i percent more/less
    c = [36 28 46 24 50*less 48];
    [x,zmin] = c_model(c,'c5',i,'less',originalX);
    c = [36 28 46 24 50*more 48];
    [x,zmin] = c_model(c,'c5',i,'more',originalX);

    % c6 i percent more/less
    c = [36 28 46 24 50 48*less];
    [x,zmin] = c_model(c,'c6',i,'less',originalX);
    c = [36 28 46 24 50 48*more];
    [x,zmin] = c_model(c,'c6',i,'more',originalX);
end

%% function definition for model

function [x,zmin] = c_model(c,cnum,per,am,originalX)

    % c = [36 28 46 24 50 48];
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
    
    disp('--------------------------------')
    disp(['for ' cnum ' ' num2str(per) '% ' am ' than estimated:'])
    disp(['xac = ' num2str(x(1))])
    disp(['xad = ' num2str(x(2))])
    disp(['xbc = ' num2str(x(3))])
    disp(['xbd = ' num2str(x(4))])
    disp(['xct = ' num2str(x(5))])
    disp(['xdt = ' num2str(x(6))])
    disp(['minimized order cost = $', num2str(zmin)])

    if (x == originalX)
        disp('same optimal solution')
    else
        disp('different optimal solution: estimate more closely.')
    end
    disp(['--------------------------------' newline])
end
