function test_edmonds_karp()
    %Test Case 1
    fprintf('Test 1 \n')
    cap = [
    0, 16, 13,  0,  0,  0;  % Node 1
    0,  0, 10, 12,  0,  0;  % Node 2
    0,  4,  0,  0, 14,  0;  % Node 3
    0,  0,  9,  0,  0, 20;  % Node 4
    0,  0,  0,  7,  0,  4;  % Node 5
    0,  0,  0,  0,  0,  0;  % Node 6
    ];

    % Define the source and sink nodes
    source = 1;
    sink = 6;
    tic
    calc1 = edmonds_karp(cap, source, sink);
    toc
    fprintf('Expected max flow:23 \n')
    fprintf('Calculated max flow:%2.0f \n', calc1)

    %Test Case 2
    fprintf('Test 2 \n')
    cap = [
    0, 16, 4,  0;  % Node 1
    0,  0, 10, 12;  % Node 2
    0,  0,  0,  5;  % Node 3
    0,  0,  0,  0;  % Node 4
    ];

    % Define the source and sink nodes
    source = 1;
    sink = 4;
    tic
    calcval = edmonds_karp(cap, source, sink);
    toc
    fprintf('Expected max flow:17 \n')
    fprintf('Calculated max flow:%2.0f \n', calcval)

    %Test case 3
    fprintf('Test 3 \n')
    cap = [0, 10, 10, 0, 0, 0; %node 1
        0, 0, 2, 4, 8, 0; %node 2
        0, 0, 0, 0, 9, 0; %node 3
        0, 0, 0, 0, 0 ,10; %node 4
        0, 0, 0, 6, 0, 10; %node 5
        0, 0, 0, 0, 0, 0]; %node 6
    source = 1;
    sink = 6;
    tic
    calcmf = edmonds_karp(cap, source, sink);
    toc
    fprintf('Expected max flow:19 \n')
    fprintf('Calculated max flow:%2.0f \n', calcmf)

    %Test case 4
    fprintf('Test 4 \n')
    cap = [0, 1, 1, 0, 0; %node 1
        0, 0, 1, 1, 1; %node 2
        0, 0, 0, 0, 1; %node 3
        0, 0, 0, 0, 1; %node 4
        0, 0, 0, 0, 0]; %node 5
    
    source = 1;
    sink = 5;
    tic
    calctest4 = edmonds_karp(cap, source, sink);
    toc
    fprintf('Expected max flow:2 \n')
    fprintf('Calculated max flow:%2.0f \n', calctest4)

    %Test Case 5
    fprintf('Test 5 \n')
    cap = [0, 1, 0; %node 1
        0, 0, 1; %node 2
        0, 0, 0]; %node 3
    
    source = 1;
    sink = 3;
    tic
    calctest5 = edmonds_karp(cap, source, sink);
    toc
    fprintf('Expected max flow:1 \n')
    fprintf('Calculated max flow:%2.0f \n', calctest5)

    %Test Case 6
    fprintf('Test 6 \n')
    cap = [0, 25, 0, 0, 0, 0, 0, 0; %node 1
        0, 0, 25, 0, 0, 0, 0, 0; %node 2
        0, 0, 0, 25, 0, 0, 0, 0; %node 3
        0, 0, 0, 0, 25, 0, 0, 0; %node 4
        0, 0, 0, 0, 0, 25, 0, 0; %node 5
        0, 0, 0, 0, 0, 0, 25, 0; %node 6
        0, 0, 0, 0, 0, 0, 0, 25; %node 7
        0, 0, 0, 0, 0, 0, 0, 0]; %node 8
    
    source = 1;
    sink = 8;
    tic
    calctest6 = edmonds_karp(cap, source, sink);
    toc
    fprintf('Expected max flow:25 \n')
    fprintf('Calculated max flow:%2.0f \n', calctest6)

    %Test Case 7
    fprintf('Test 7 \n')
    cap = [ 0,  0,  0, 18,  0, 10,  0,  0, 31,  0, 26,  4,  0,  0,  0, 32,  1,  0,  0,  0;
  0,  0,  0,  0, 31,  7,  0,  9,  0,  0, 50,  0,  0,  0, 30,  0,  0,  0, 27, 29;
  0,  0,  0,  0, 31, 43, 43,  0,  0,  0,  0, 25,  0,  0,  0,  0,  0,  3,  0,  0;
  0,  0,  0,  0, 13,  0,  0,  0,  0, 29, 26, 49,  0, 19, 36,  0, 49, 12,  0,  0;
  0,  0,  0,  0,  0, 29,  0,  0,  0,  0,  0, 47, 30,  0,  0,  0,  1,  0,  0,  0;
  0,  0,  0,  0,  0,  0,  0,  4,  0,  0,  0,  0, 49,  0, 42,  0,  7,  0,  0, 49;
  0,  0,  0,  0,  0,  0,  0, 32,  0,  0, 13,  0,  0,  0,  0, 11,  0,  0,  0, 28;
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 28, 34,  0, 40, 43,  0,  3,  0;
  0,  0,  0,  0,  0,  0,  0,  0,  0, 47, 31,  0,  0, 25,  4,  0, 42, 35,  0, 28;
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 16,  0,  0,  0,  0,  0,  0,  0, 42,  4;
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  9,  0,  6,  6, 13,  0,  0,  0, 39;
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 33, 17,  0,  6,  0, 41;
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 50, 24, 21,  0;
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 14;
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  3, 15;
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 19,  0,  0;
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0;
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0;
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0;
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0];

    source = 1;
    sink = 20;

    tic
    calctest7 = edmonds_karp(cap, source, sink);
    toc
    
    fprintf('Expected max flow:89 \n')
    fprintf('Calculated max flow:%2.0f \n', calctest7)
end