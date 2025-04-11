# E-Commerce Database Project – Oracle SQL

This project demonstrates the design and implementation of a comprehensive eCommerce database system It includes a normalized schema, constraints, triggers, indexing, transactions, views, and test cases for a real-world order processing scenario.

---

## Explanation

### SET ECHO ON;

- Purpose: Displays each SQL command as it is executed.
- Use case: Useful for debugging or understanding the flow of a SQL script.
- If you run a script file (@script.sql), you’ll see both the command and the output in your SQL Plus terminal.

### SET SERVEROUTPUT ON

- Purpose: Enables the display of output from DBMS_OUTPUT.PUT_LINE calls (used in PL/SQL blocks).
- Use case: Essential for printing messages during PL/SQL execution.
- Without this, your DBMS_OUTPUT.PUT_LINE('Hello'); won't show anything in the terminal.

### SET LINESIZE 600

- Sets line width for output formatting

### CHECK CONSTRAINT

- The CHECK constraint in SQL is used to enforce a condition on values in a column.
- It ensures that only values that meet the condition can be inserted or updated in that column.

### Indexing

- To optimize performance on frequent queries
- Speeds up queries that search for orders by customer.
- Faster SELECTs (especially with WHERE, JOIN, ORDER BY, etc.).
- Improved performance on large tables
- Indexes take up space.They also slow down INSERT, UPDATE, DELETE slightly because the index must be updated too.

### Triggers

- :NEW is a bind variable that refers to the new row being inserted or updated.
- Always verify if your trigger is enabled using:

```
SELECT trigger_name, status FROM user_triggers;
```

## TRANSACTIONS in SQL

A transaction is a group of SQL operations that are executed as a single unit. Transactions are used to maintain data integrity and consistency.

### 1. COMMIT

- Makes all changes in the current transaction permanent.
- Cannot be undone.
- Permanently saves all changes made during the current transaction.
- When you’ve successfully completed all operations in a transaction and want to make the changes permanent.

### 2. ROLLBACK

- Undoes changes made in the current transaction (since the last COMMIT).
- Useful when something goes wrong.
- Reverts all changes made during the current transaction, effectively undoing them.
- When an error occurs, or you want to discard the changes made during a transaction before committing.

### 3. SAVEPOINT

- A marker in a transaction to which you can roll back partially.
- Sets a point within a transaction to which you can later roll back, allowing you to undo changes back to that specific point without losing all progress.

## PROCEDURES in Oracle

- A stored procedure is a set of precompiled SQL statements that are stored in the database.
- You can execute them by calling their name, which can encapsulate complex logic.
- Can accept parameters.
- Can perform multiple SQL operations.
- Helps in code reuse, security (by limiting direct access to database tables), and performance.

```
CREATE OR REPLACE PROCEDURE UpdateStock(p_product_id IN NUMBER, p_quantity IN NUMBER)
IS
BEGIN
    UPDATE Products
    SET Stock = Stock - p_quantity
    WHERE ProductID = p_product_id;
    COMMIT;
END;
```

- Calling the Procedure:

```
EXEC UpdateStock(10, 2);
```

## Functions

- A function is similar to a stored procedure but it must return a value.
- Functions are generally used for calculations and to return a single value.
- Can return a value (scalar or table).
- Can be used in SELECT statements.
- Usually, they are used for calculations or conversions.

```
CREATE OR REPLACE FUNCTION CalculateDiscount(p_price IN NUMBER)
RETURN NUMBER
IS
BEGIN
    RETURN p_price * 0.10;  -- 10% discount
END;
```

- Calling the Function:

```
SELECT CalculateDiscount(500) FROM dual;
```

## Triggers

- A trigger is a special kind of stored procedure that automatically executes in response to certain events on a table or view.
- They are commonly used for enforcing business rules, auditing, or maintaining data integrity.
- Automatically invoked when specified events occur.
- Can be used for data validation, logging, and referential integrity.
- Can't take parameters like stored procedures and functions.

### 1. DML Triggers (Data Manipulation Language):

- Triggered by INSERT, UPDATE, or DELETE actions on a table.

### 2. BEFORE Triggers:

- Fired before the actual DML operation is executed.

### AFTER Triggers:

- Fired after the DML operation has been executed.
