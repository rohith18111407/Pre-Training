# Task 4: Multi-Table JOINs in SQL

## Objective

Learn how to retrieve and combine data from multiple related tables using various SQL JOIN operations:

- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- `FULL OUTER JOIN`
- `CROSS JOIN`

---

## Summary of JOINs

### INNER JOIN

- Includes Non-Matching Rows? No
- Description: Matching rows from both tables

### LEFT OUTER JOIN

- Includes Non-Matching Rows? Left table (Customers)
- Description: All customers, orders if matched

### RIGHT OUTER JOIN

- Includes Non-Matching Rows? Right table (Orders)
- Description: All orders, customers if matched

### FULL OUTER JOIN

- Includes Non-Matching Rows? Both tables
- Description: All customers and orders (matched/unmatched)

### CROSS JOIN

- Includes Non-Matching Rows? No match condition
- Description: All combinations (Cartesian product)
