function [path, weight] = edmonds_bfs_helper(capacity, source, sink)
    %BFS helper using vistor pattern to calculate augmenting path
    N = size(capacity, 1);
    visitors = false(1, N);
    parent = -1 * ones(1, N);
    queue = [source];
    visitors(source) = true;
    residuals = capacity;

    path_flow = inf;
    while ~isempty(queue)
        cur = queue(1);
        queue(1) = [];

        for i = 1:N
            if ~visitors(i) && residuals(cur, i) > 0
                queue(end+1) = i;
                visitors(i) = true;
                parent(i) = cur;
                path_flow = min(path_flow, residuals(cur, i));

                if i == sink
                    %build the augmenting path from the bfs method then
                    %send flow along path
                    path = build_path(parent, source, sink);
                    weight = path_flow;
                    return;
                end
            end
        end
        %reset path and min weight before finding new augmenting path
        path = [];
        weight = 0;
    end
end 