function levels = bfs_dinics_helper(capacity, source)
    N = size(capacity, 1);
    levels = -1 * ones(1, N);
    levels(source) = 0;
    queue = [source];

    while ~isempty(queue)
        cur = queue(1);
        queue(1) = [];

        for i = 1:N
            if levels(i) == -1 && capacity(cur, i) > 0
                levels(i) = levels(cur) + 1;
                queue(end+1) = i;
            end
        end
    end

end