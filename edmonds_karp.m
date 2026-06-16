function mf = edmonds_karp(weights, source, sink)
    %implementation of edmonds karp to calculate the max flow of a graph

    N = size(weights, 1);
    
    % initialise "holder" variables
    residuals = weights;
    mf = 0;

    while true
        [path, cur_flow] = edmonds_bfs_helper(residuals, source, sink);
        if isempty(path)
            break;
        end
        %create residual graph from augmenting path information for final
        %calculation
        for i = 1:length(path) - 1
            u = path(i);
            v = path(i+1);
            residuals(u, v) = residuals(u, v) - cur_flow;
            residuals(v, u) = residuals(v, u) + cur_flow;
        end
        %add flow of path s->t to max flow
        mf = mf + cur_flow;
    end
    %disp(residuals) %debugging
end