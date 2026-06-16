function maxflow = simplex_method(c, A, b, A_eq, b_eq)
    % pull size values from input for matrix manipulation
    [s_ineq, N] = size(A);
    [s_eq, p] = size(A_eq);

    % Add slack variables for edge constrints but dont add for intermediary
    % node equations
    A_slacks = [A, eye(s_ineq)];
    c_slack = [c; zeros(s_ineq, 1)];
    
    A_combined = [A_slacks; A_eq, zeros(s_eq, s_ineq)];
    b_combined = [b; b_eq];
    c_combined = c_slack;

    tableau = [A_combined, b_combined; c_combined', 0];
    %seperate slack and edege variables
    slackvars = N + 1:N+s_ineq;
    edgevars = 1:N;

    max_iter = 1000;
    iter = 0;
    maxflow = 0;
    while iter < max_iter
        % loop through tableau and perform pivots as specified in class
        % till all values in last row are above zero
        iter = iter + 1;

        zend = tableau(end, 1:end-1);
        %check stopping condition
        if all(zend > 0)
            break
        end
        
        %pivoting logic
        [t, evar] = min(zend);
        col = tableau(1:end-1, evar);
        rhs = tableau(1:end-1, end);
        ratios = rhs./col;
        ratios(col <= 0) = inf;
        [minratio, lvar] = min(ratios);

        if minratio == inf
            maxflow = 0;
            return
        end

        pivot = tableau(lvar, evar);
        tableau(lvar, :) = tableau(lvar, :) / pivot;
        for i = 1:size(tableau, 1)
            if i ~= lvar
                tableau(i, :) = tableau(i, :) - (tableau(i, evar) * tableau(lvar, :));
            end
        end
        %update after pivots
        edgevars(lvar) = evar;
        
    end
    % negate flow to maximize value
    maxflow = -tableau(end, end);
end