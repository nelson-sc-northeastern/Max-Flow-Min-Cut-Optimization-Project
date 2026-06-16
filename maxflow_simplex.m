function maxflow = maxflow_simplex(capacity, source, sink)
    [A, b, A_eq, b_eq, c, flow] = initTable(capacity, source, sink);
    % flow from inittable was for testing not used in actual calc
    c = c';
    
    maxflow = -simplex_method(c, A, b, A_eq, b_eq); 
    
end