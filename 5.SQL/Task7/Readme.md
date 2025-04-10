# Task 7: Window Functions and Ranking (Oracle 10g-Compatible)

## Objective

Simulate window function behavior such as ranking employees by salary within each department

---

## Concepts Covered

- Ranking employees by salary _within their department_
- Using `ROW_NUMBER()`
- Identifying the top-paid employee(s) per department

---

## Key Concepts

### PARTITION BY

Splits data into groups (like departments), each processed separately.

### ORDER BY

Defines the sequence in which window function is applied.

### ROW_NUMBER()

Assigns unique row numbers to ordered rows in each partition.

### RANK()

Gives same rank for duplicates but skips the next ranks.

### DENSE_RANK()

Gives same rank for duplicates but doesn't skip next ranks.

### LEAD()

Returns value from the next row relative to current row.

### LAG()

Returns value from the previous row relative to current row.
