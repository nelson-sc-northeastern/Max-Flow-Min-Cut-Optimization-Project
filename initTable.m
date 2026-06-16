function [A, b, A_eq, b_eq, c, flow] = initTable(capacity, source, sink)
    N = size(capacity, 1);
    [from, to] = find(capacity > 0);
    tempcapacity = capacity(sub2ind(size(capacity), from, to));
    nEdges = length(tempcapacity);
    
    nVars = nEdges;

    nRows = (N - 2) + nEdges + 1;
    nCols = nVars + 1;

    data = zeros(nRows, nCols);
    
    rowid = 1;
    for node = 1:N
        if node == source || node == sink
            continue
        end
        
        inFlow = find(to == node);
        outFlow = find(from == node);

        for i = 1:length(inFlow)
            data(rowid, inFlow(i)) = 1;
        end
        for i = 1:length(outFlow)
            data(rowid, outFlow(i)) = -1;
        end

        data(rowid, end) = 0;
        rowid = rowid + 1;
    end


    for i = 1:nEdges
        data(N - 2 + i, i) = 1;   
        data(N - 2 + i, end) = tempcapacity(i);
    end

    cnt = 0;
    for i = 1:nEdges
        if from(i) == source
            data(end, i) = -1;
            cnt = cnt + 1;
        end
    end

    data(end, end) = 0;
    A = data(1:end-1, 1:end-1);
    b = data(1:end-1, end);
    c = data(end, 1:end);
    lb = zeros(nEdges,1);
    A_eq = A(1:N-2, :);
    b_eq = zeros(N-2, 1);
    A = A(N-1:end, :);
    b = b(N-1:end);
    c = c(1:end-1);
    
    
    %[x, guess] = linprog( c, A, b, A_eq, b_eq, lb );
    % Using the linprog while debugging simplex code
    guess = 0;
    flow = guess;
    
end