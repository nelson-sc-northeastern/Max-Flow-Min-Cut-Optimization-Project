function maxflow = dinics(capacity, source, sink)
    N = size(capacity, 1);

    residuals = capacity;

    maxflow = 0;

    while true
        % build level graph using helper
        levels = bfs_dinics_helper(residuals, source);
        if levels(sink) == -1
            break %no path to sink exists
        end

        while true
            % augmenting path algorithm very similar to edmond karp
            [blockingflow, residuals] = dfs_dinics_helper(source, inf, levels, residuals, sink);
            if blockingflow == 0
                break
            end
            %blockingflow is minimum flow along path
            maxflow = maxflow + blockingflow;
        end
    end
    %disp(residuals) %debugging
end