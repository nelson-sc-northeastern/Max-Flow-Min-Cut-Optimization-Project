# Max-Flow Min-Cut Optimization Project

A comprehensive MATLAB suite implementing multiple algorithmic paradigms to solve the classical **Maximum Flow / Minimum Cut** problem. This project provides comparative foundational implementations ranging from traditional augmenting path methods to linear programming formulations solved via a custom Simplex engine.

## Features

The repository includes implementations of three distinct computational approaches to solve maximum network flow problems:

1. **Edmonds-Karp Algorithm:** An implementation of the augmenting path method using a Breadth-First Search (BFS) visitor pattern variant to compute shortest paths locally.
2. **Dinitz's (Dinic's) Algorithm:** An optimized level-graph-based network flow solver utilizing iterative BFS for level-graph generation and Depth-First Search (DFS) for blocking flow computations.
3. **Linear Programming via Simplex Method:** Formulates the network flow problem as a standard optimization problem, translating node flow conservation and edge capacity bounds into linear constraints solved by a custom-built Simplex tableau implementation.

---

## Repository Structure

The core MATLAB scripts and helper functions are organized as follows:

```text
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
