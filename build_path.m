function y = build_path(parent, source, sink)
    y = sink;
    while y(1) ~= source
       y = [parent(y(1)), y];
    end
end