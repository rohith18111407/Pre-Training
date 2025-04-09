REM Dropping Tables Customers and Orders

DROP TABLE Customers CASCADE CONSTRAINTS;

DROP TABLE Orders CASCADE CONSTRAINTS;



REM Create the Tables

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);




REM Insert into Customers

INSERT INTO Customers VALUES (1, 'Mitchell', 'Johnson', 'alice@example.com');
INSERT INTO Customers VALUES (2, 'Steve', 'Smith', 'bob@example.com');
INSERT INTO Customers VALUES (3, 'Mahendra Singh', 'Dhoni', 'charlie@example.com');


REM Insert into Orders

INSERT INTO Orders VALUES (101, 1, DATE '2024-01-15', 250.00);
INSERT INTO Orders VALUES (102, 2, DATE '2024-01-17', 125.00);
INSERT INTO Orders VALUES (103, 1, DATE '2024-02-01', 300.00);
-- Note: Mahendra Singh Dhoni (CustomerID 3) has no orders
INSERT INTO Orders VALUES (104, 4, DATE '2024-02-10', 500.00);


REM Perform JOINs

REM  1. INNER JOIN: Customers with Orders
REM Only customers with orders will be shown.

SELECT C.FirstName, C.LastName, O.OrderID, O.OrderDate, O.Amount
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID;


REM 2. LEFT JOIN: All Customers with or without Orders
REM Shows all customers, and for those without orders (like Dhoni), order columns will be NULL.

SELECT C.FirstName, C.LastName, O.OrderID, O.OrderDate, O.Amount
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID;


REM 3. RIGHT JOIN (RIGHT OUTER JOIN)
REM Returns all orders, and customer data if available (NULLs if customer not found).

SELECT C.FirstName, C.LastName, O.OrderID, O.Amount
FROM Customers C
RIGHT JOIN Orders O ON C.CustomerID = O.CustomerID;


REM 4. FULL OUTER JOIN
REM Returns all records from both tables, matched where possible.

-- Simulating FULL OUTER JOIN
SELECT C.FirstName, C.LastName, O.OrderID, O.Amount
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
UNION
SELECT C.FirstName, C.LastName, O.OrderID, O.Amount
FROM Customers C
RIGHT JOIN Orders O ON C.CustomerID = O.CustomerID;


REM 5. CROSS JOIN
REM Returns the Cartesian product: every row of Customers with every row of Orders.
REM Total rows = #Customers × #Orders = 3 × 4 = 12 rows

SELECT C.FirstName, O.OrderID, O.Amount
FROM Customers C
CROSS JOIN Orders O;




