Max-Flow Min-Cut Optimization Project

A comprehensive MATLAB suite implementing multiple algorithmic paradigms to solve the classical Maximum Flow / Minimum Cut problem. This project provides comparative foundational implementations ranging from traditional augmenting path methods to linear programming formulations solved via a custom Simplex engine.
## Features

The repository includes implementations of three distinct computational approaches to solve maximum network flow problems:

    Edmonds-Karp Algorithm: An implementation of the augmenting path method using a Breadth-First Search (BFS) visitor pattern variant to compute shortest paths locally.

    Dinitz's (Dinic's) Algorithm: An optimized level-graph-based network flow solver utilizing iterative BFS for level-graph generation and Depth-First Search (DFS) for blocking flow computations.

    Linear Programming via Simplex Method: Formulates the network flow problem as a standard optimization problem, translating node flow conservation and edge capacity bounds into linear constraints solved by a custom-built Simplex tableau implementation.

## Repository Structure

The core MATLAB scripts and helper functions are organized as follows:
Plaintext

├── edmonds_karp.m        # Main entry point for Edmonds-Karp algorithm
├── edmonds_bfs_helper.m  # BFS visitor pattern helper to find augmenting paths
├── build_path.m          # Backtracking helper to reconstruct graph paths
│
├── dinics.m              # Main entry point for Dinitz's algorithm
├── bfs_dinics_helper.m   # BFS script to build the network level graphs
├── dfs_dinics_helper.m   # DFS recursive script to find blocking flows
│
├── maxflow_simplex.m     # Main entry point for the Linear Programming solver
├── initTable.m           # Formulates edge and node constraints into standard matrix form
└── simplex_method.m      # Custom Simplex algorithm engine featuring automated pivoting

## Technical Details
1. Edmonds-Karp

    Complexity: O(V⋅E2)

    Utilizes a classic queue-driven BFS approach (edmonds_bfs_helper.m) to safely traverse remaining capacity bottlenecks within residual networks.

2. Dinitz's Algorithm

    Complexity: O(V2⋅E)

    Divides the computational overhead into phases:

        BFS Phase: Constructs a layered node structure based on strict level-hops from the source node.

        DFS Phase: Pushes maximum possible bottleneck allocations dynamically over the generated level-graph until a blocking flow configuration is met.

3. Max-Flow Simplex

    Converts the network graph into a linear system:
    maxv:(s,v)∈E∑​f(s,v)
    subject to: u:(u,v)∈E∑​f(u,v)=w:(v,w)∈E∑​f(v,w)∀v∈/{s,t}
    0≤f(u,v)≤c(u,v)∀(u,v)∈E

    initTable.m maps these rules directly into basic inequality matrices (A,b) and equality systems (Aeq​,beq​).

    simplex_method.m iterates structural row-echelon operations across a standard Simplex tableau using a minimal ratio test pivot execution model.

## Usage

All primary solvers share a uniform execution interface. They require an N×N Capacity/Weight Matrix (where index positions i,j define the capacity cap between nodes), a Source Node index, and a Sink Node index.
Quickstart Example

Define your network graph topology within MATLAB and call any of the available algorithms:
Matlab

% Example: 4-node network setup
% Nodes: 1 (Source), 2, 3, 4 (Sink)
capacity = [
    0, 10,  5,  0;  % Node 1 (Source) connections
    0,  0, 15, 10;  % Node 2 connections
    0,  0,  0, 10;  % Node 3 connections
    0,  0,  0,  0   % Node 4 (Sink) connections
];

source_node = 1;
sink_node = 4;

% 1. Run Edmonds-Karp Solver
ek_flow = edmonds_karp(capacity, source_node, sink_node);
fprintf('Edmonds-Karp Max Flow: %d\n', ek_flow);

% 2. Run Dinic's Solver
dinic_flow = dinics(capacity, source_node, sink_node);
fprintf("Dinic's Max Flow: %d\n", dinic_flow);

% 3. Run Custom Linear Programming Simplex Solver
simplex_flow = maxflow_simplex(capacity, source_node, sink_node);
fprintf('Simplex Method Max Flow: %d\n', simplex_flow);

## Requirements

    MATLAB (R2019a or newer recommended)

    No additional structural toolboxes required—the Simplex implementation runs entirely natively without external dependencies on linprog.
