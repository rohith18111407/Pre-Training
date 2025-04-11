SQL> @"C:\Rohith\Backup\Desktop\Presidio\Pre-Training\5.SQL\Task10\Task10.sql"
SQL> SET ECHO ON;
SQL> SET SERVEROUTPUT ON;
SQL> SET LINESIZE 600;
SQL> 
SQL> 
SQL> REM Drop Tables
SQL> 
SQL> DROP TABLE Customers CASCADE CONSTRAINTS;

Table dropped.

SQL> 
SQL> DROP TABLE Products CASCADE CONSTRAINTS;

Table dropped.

SQL> 
SQL> DROP TABLE Orders CASCADE CONSTRAINTS;

Table dropped.

SQL> 
SQL> DROP TABLE OrderDetails CASCADE CONSTRAINTS;

Table dropped.

SQL> 
SQL> 
SQL> REM 1.1 Create Customers Table
SQL> 
SQL> CREATE TABLE Customers (
  2  	 CustomerID NUMBER PRIMARY KEY,
  3  	 Name VARCHAR2(100),
  4  	 Email VARCHAR2(100) UNIQUE,
  5  	 Phone VARCHAR2(15),
  6  	 Address VARCHAR2(200)
  7  );

Table created.

SQL> 
SQL> 
SQL> 
SQL> REM 1.2 Create Products Table
SQL> REM The CHECK constraint in SQL is used to enforce a condition on values in a column. It ensures that only values that meet the condition can be inserted or updated in that column.
SQL> 
SQL> 
SQL> CREATE TABLE Products (
  2  	 ProductID NUMBER PRIMARY KEY,
  3  	 ProductName VARCHAR2(100),
  4  	 Price NUMBER(10, 2),
  5  	 Stock NUMBER CHECK (Stock >= 0)
  6  );

Table created.

SQL> 
SQL> 
SQL> 
SQL> REM 1.3 Create Orders Table
SQL> 
SQL> CREATE TABLE Orders (
  2  	 OrderID NUMBER PRIMARY KEY,
  3  	 CustomerID NUMBER,
  4  	 OrderDate DATE DEFAULT SYSDATE,
  5  	 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
  6  );

Table created.

SQL> 
SQL> 
SQL> 
SQL> REM 1.4 Create OrderDetails Table
SQL> 
SQL> CREATE TABLE OrderDetails (
  2  	 OrderDetailID NUMBER PRIMARY KEY,
  3  	 OrderID NUMBER,
  4  	 ProductID NUMBER,
  5  	 Quantity NUMBER CHECK (Quantity > 0),
  6  	 FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  7  	 FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
  8  );

Table created.

SQL> 
SQL> REM Insert sample data:
SQL> 
SQL> INSERT INTO Customers VALUES (1, 'Sachin Tendulkar', 'sachin@gmail.com', '934216364', 'Chennai');

1 row created.

SQL> INSERT INTO Products VALUES (10, 'Laptop', 60000, 10);

1 row created.

SQL> INSERT INTO Products VALUES (11, 'Mouse', 500, 50);

1 row created.

SQL> 
SQL> 
SQL> REM 2. Indexing
SQL> REM To optimize performance on frequent queries
SQL> REM Speeds up queries that search for orders by customer.
SQL> REM Faster SELECTs (especially with WHERE, JOIN, ORDER BY, etc.). Improved performance on large tables
SQL> REM ndexes take up space.They also slow down INSERT, UPDATE, DELETE slightly because the index must be updated too.
SQL> 
SQL> 
SQL> CREATE INDEX idx_orders_customer
  2  ON Orders(CustomerID);

Index created.

SQL> 
SQL> CREATE INDEX idx_orderdetails_product
  2  ON OrderDetails(ProductID);

Index created.

SQL> 
SQL> 
SQL> REM 3. Triggers
SQL> 
SQL> REM 3.1 Update Stock on Order Insert
SQL> REM :NEW is a bind variable that refers to the new row being inserted or updated.
SQL> 
SQL> CREATE OR REPLACE TRIGGER trg_update_stock
  2  AFTER INSERT ON OrderDetails
  3  FOR EACH ROW
  4  BEGIN
  5  	 UPDATE Products
  6  	 SET Stock = Stock - :NEW.Quantity
  7  	 WHERE ProductID = :NEW.ProductID;
  8  END;
  9  /

Trigger created.

SQL> 
SQL> 
SQL> 
SQL> REM 3.2 Prevent Order If Insufficient Stock
SQL> 
SQL> CREATE OR REPLACE TRIGGER trg_check_stock
  2  BEFORE INSERT ON OrderDetails
  3  FOR EACH ROW
  4  DECLARE
  5  	 available_stock NUMBER;
  6  BEGIN
  7  	 SELECT Stock INTO available_stock FROM Products WHERE ProductID = :NEW.ProductID;
  8  	 IF :NEW.Quantity > available_stock THEN
  9  	     RAISE_APPLICATION_ERROR(-20001, 'Insufficient stock for Product ID: ' || :NEW.ProductID);
 10  	 END IF;
 11  END;
 12  /

Trigger created.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 4. Transactions - Place an order safely
SQL> 
SQL> BEGIN
  2  	 SAVEPOINT start_transaction;
  3  
  4  	 INSERT INTO Orders (OrderID, CustomerID, OrderDate)
  5  	 VALUES (101, 1, SYSDATE);
  6  
  7  	 INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
  8  	 VALUES (1, 101, 10, 2); -- Assume ProductID 10 exists
  9  
 10  	 COMMIT;
 11  EXCEPTION
 12  	 WHEN OTHERS THEN
 13  	     ROLLBACK TO start_transaction;
 14  	     DBMS_OUTPUT.PUT_LINE(SQLERRM);
 15  END;
 16  /

PL/SQL procedure successfully completed.

SQL> 
SQL> 
SQL> REM 5. Views and Materialized Views
SQL> 
SQL> CREATE OR REPLACE VIEW Ordersummary AS
  2  SELECT o.OrderID, c.Name AS CustomerName, o.OrderDate,
  3  	    p.ProductName, od.Quantity, p.Price, (od.Quantity * p.Price) AS Total
  4  FROM Orders o
  5  JOIN Customers c ON o.CustomerID = c.CustomerID
  6  JOIN OrderDetails od ON o.OrderID = od.OrderID
  7  JOIN Products p ON od.ProductID = p.ProductID;

View created.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 6. Testing Scenarios
SQL> 
SQL> REM Valid order:
SQL> 
SQL> -- Should succeed
SQL> INSERT INTO Orders VALUES (201, 1, SYSDATE);

1 row created.

SQL> INSERT INTO OrderDetails VALUES (301, 201, 10, 1); -- Laptop
  2  
SQL> REM Invalid order (Insufficient stock):
SQL> 
SQL> -- Should fail with trigger
SQL> INSERT INTO Orders VALUES (202, 1, SYSDATE);

1 row created.

SQL> -- Trying to buy 20 laptops when stock < 10
SQL> INSERT INTO OrderDetails VALUES (302, 202, 10, 20);
INSERT INTO OrderDetails VALUES (302, 202, 10, 20)
           *
ERROR at line 1:
ORA-20001: Insufficient stock for Product ID: 10 
ORA-06512: at "SCOTT.TRG_CHECK_STOCK", line 6 
ORA-04088: error during execution of trigger 'SCOTT.TRG_CHECK_STOCK' 


SQL> 
SQL> 
SQL> REM Check View:
SQL> 
SQL> SELECT * FROM Ordersummary;

   ORDERID CUSTOMERNAME                                                                                         ORDERDATE PRODUCTNAME                                                                                            QUANTITY      PRICE      TOTAL                                                                                                                                                                                                                                                                                                                                                         
---------- ---------------------------------------------------------------------------------------------------- --------- ---------------------------------------------------------------------------------------------------- ---------- ---------- ----------                                                                                                                                                                                                                                                                                                                                                         
       101 Sachin Tendulkar                                                                                     11-APR-25 Laptop                                                                                                        2      60000     120000                                                                                                                                                                                                                                                                                                                                                         

SQL> 
SQL> 
SQL> spool off;
