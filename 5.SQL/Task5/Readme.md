# Task 5: Subqueries and Nested Queries

## Objective

To learn how to:

- Use subqueries in `SELECT`, `WHERE`, and `FROM` clauses.
- Differentiate between correlated and non-correlated subqueries.
- Filter, compute, and summarize data using nested queries.

---

## Correlated Subqueries

- Depends on outer query? Yes
- Executed per row? Yes (can be slow on large data)
- Use Case: Filtering with conditions per-row

## Non-Correlated Subqueries

- Depends on outer query? No
- Executed per row? No (runs once)
- Use Case: Static comparisons or one-time computations
