# Task 8: Common Table Expressions (CTEs) and Recursive Queries

## Objective

- Simplify complex queries and process hierarchical data using CTEs and Oracle’s hierarchical query capabilities.
- Understand how to use `WITH` clauses for non-recursive CTEs.
- Use Oracle’s `CONNECT BY` clause for recursive-like queries.

---

## Concepts Covered

### What is a CTE?

- A Common Table Expression (CTE) is a temporary result set defined within the execution scope of a single SELECT, INSERT, UPDATE, or DELETE statement using the WITH keyword.
- CTEs make complex queries more readable, modular, and reusable.
- Recursive CTEs are essential for tasks like organizational charts, folder structures, and category trees.

### 1. Non-Recursive CTEs (`WITH` Clause)

Break down a complex query like total salary per department and filtering departments where total salary exceeds a threshold.

### 2. Recursive CTE

- Hierarchical data (e.g., organization tree — who reports to whom).
- START WITH: identifies the root (CEO).
- CONNECT BY: defines the parent-child relationship.
- LEVEL: Oracle pseudo-column that auto-increments with each level.
