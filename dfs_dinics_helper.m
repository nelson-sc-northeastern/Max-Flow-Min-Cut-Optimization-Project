function [flow, capacity] = dfs_dinics_helper(cur, fin, levels, capacity, sink)
    if cur == sink
        flow = fin;
        return
    end

    N = size(capacity, 1);
    flow = 0;
    for i = 1:N
        if levels(i) == levels(cur) + 1 && capacity(cur, i) > 0
            minflow = min(fin, capacity(cur, i));
            [pushflow, capacity] = dfs_dinics_helper(i, minflow, levels, capacity, sink);

            if pushflow > 0
                capacity(cur, i) = capacity(cur, i) - pushflow;
                capacity(i, cur) = capacity(i, cur) + pushflow;

                flow = flow + pushflow;
                fin = fin - pushflow;

                if fin == 0
                    break;
                end
            end
        end
    end


end