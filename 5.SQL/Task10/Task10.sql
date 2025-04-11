SET ECHO ON;
SET SERVEROUTPUT ON;
SET LINESIZE 600;


REM Drop Tables

DROP TABLE Customers CASCADE CONSTRAINTS;

DROP TABLE Products CASCADE CONSTRAINTS;

DROP TABLE Orders CASCADE CONSTRAINTS;

DROP TABLE OrderDetails CASCADE CONSTRAINTS;


REM 1.1 Create Customers Table

CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Email VARCHAR2(100) UNIQUE,
    Phone VARCHAR2(15),
    Address VARCHAR2(200)
);



REM 1.2 Create Products Table
REM The CHECK constraint in SQL is used to enforce a condition on values in a column. It ensures that only values that meet the condition can be inserted or updated in that column.


CREATE TABLE Products (
    ProductID NUMBER PRIMARY KEY,
    ProductName VARCHAR2(100),
    Price NUMBER(10, 2),
    Stock NUMBER CHECK (Stock >= 0)
);



REM 1.3 Create Orders Table

CREATE TABLE Orders (
    OrderID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    OrderDate DATE DEFAULT SYSDATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);



REM 1.4 Create OrderDetails Table

CREATE TABLE OrderDetails (
    OrderDetailID NUMBER PRIMARY KEY,
    OrderID NUMBER,
    ProductID NUMBER,
    Quantity NUMBER CHECK (Quantity > 0),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

REM Insert sample data:

INSERT INTO Customers VALUES (1, 'Sachin Tendulkar', 'sachin@gmail.com', '934216364', 'Chennai');
INSERT INTO Products VALUES (10, 'Laptop', 60000, 10);
INSERT INTO Products VALUES (11, 'Mouse', 500, 50);


REM 2. Indexing
REM To optimize performance on frequent queries
REM Speeds up queries that search for orders by customer.
REM Faster SELECTs (especially with WHERE, JOIN, ORDER BY, etc.). Improved performance on large tables
REM ndexes take up space.They also slow down INSERT, UPDATE, DELETE slightly because the index must be updated too.


CREATE INDEX idx_orders_customer 
ON Orders(CustomerID);

CREATE INDEX idx_orderdetails_product 
ON OrderDetails(ProductID);


REM 3. Triggers

REM 3.1 Update Stock on Order Insert
REM :NEW is a bind variable that refers to the new row being inserted or updated.

CREATE OR REPLACE TRIGGER trg_update_stock
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Products
    SET Stock = Stock - :NEW.Quantity
    WHERE ProductID = :NEW.ProductID;
END;
/



REM 3.2 Prevent Order If Insufficient Stock

CREATE OR REPLACE TRIGGER trg_check_stock
BEFORE INSERT ON OrderDetails
FOR EACH ROW
DECLARE
    available_stock NUMBER;
BEGIN
    SELECT Stock INTO available_stock FROM Products WHERE ProductID = :NEW.ProductID;
    IF :NEW.Quantity > available_stock THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient stock for Product ID: ' || :NEW.ProductID);
    END IF;
END;
/




REM 4. Transactions - Place an order safely

BEGIN
    SAVEPOINT start_transaction;

    INSERT INTO Orders (OrderID, CustomerID, OrderDate)
    VALUES (101, 1, SYSDATE);

    INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
    VALUES (1, 101, 10, 2); -- Assume ProductID 10 exists

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO start_transaction;
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/


REM 5. Views and Materialized Views

CREATE OR REPLACE VIEW Ordersummary AS
SELECT o.OrderID, c.Name AS CustomerName, o.OrderDate,
       p.ProductName, od.Quantity, p.Price, (od.Quantity * p.Price) AS Total
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;




REM 6. Testing Scenarios

REM Valid order:

-- Should succeed
INSERT INTO Orders VALUES (201, 1, SYSDATE);
INSERT INTO OrderDetails VALUES (301, 201, 10, 1); -- Laptop

REM Invalid order (Insufficient stock):

-- Should fail with trigger
INSERT INTO Orders VALUES (202, 1, SYSDATE);
-- Trying to buy 20 laptops when stock < 10
INSERT INTO OrderDetails VALUES (302, 202, 10, 20); 


REM Check View:

SELECT * FROM Ordersummary;


