SQL> SET ECHO ON
SQL> @"C:\Rohith\Backup\Desktop\Presidio\Pre-Training\5.SQL\Task4\Task4.sql"
SQL> REM Dropping Tables Customers and Orders
SQL> 
SQL> DROP TABLE Customers CASCADE CONSTRAINTS;

Table dropped.

SQL> 
SQL> DROP TABLE Orders CASCADE CONSTRAINTS;
DROP TABLE Orders CASCADE CONSTRAINTS
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> 
SQL> 
SQL> 
SQL> REM Create the Tables
SQL> 
SQL> CREATE TABLE Customers (
  2  	 CustomerID INT PRIMARY KEY,
  3  	 FirstName VARCHAR(50),
  4  	 LastName VARCHAR(50),
  5  	 Email VARCHAR(100)
  6  );

Table created.

SQL> 
SQL> 
SQL> CREATE TABLE Orders (
  2  	 OrderID INT PRIMARY KEY,
  3  	 CustomerID INT,
  4  	 OrderDate DATE,
  5  	 Amount DECIMAL(10, 2),
  6  	 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
  7  );

Table created.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM Insert into Customers
SQL> 
SQL> INSERT INTO Customers VALUES (1, 'Mitchell', 'Johnson', 'alice@example.com');

1 row created.

SQL> INSERT INTO Customers VALUES (2, 'Steve', 'Smith', 'bob@example.com');

1 row created.

SQL> INSERT INTO Customers VALUES (3, 'Mahendra Singh', 'Dhoni', 'charlie@example.com');

1 row created.

SQL> 
SQL> 
SQL> REM Insert into Orders
SQL> 
SQL> INSERT INTO Orders VALUES (101, 1, DATE '2024-01-15', 250.00);

1 row created.

SQL> INSERT INTO Orders VALUES (102, 2, DATE '2024-01-17', 125.00);

1 row created.

SQL> INSERT INTO Orders VALUES (103, 1, DATE '2024-02-01', 300.00);

1 row created.

SQL> -- Note: Mahendra Singh Dhoni (CustomerID 3) has no orders
SQL> INSERT INTO Orders VALUES (104, 4, DATE '2024-02-10', 500.00);
INSERT INTO Orders VALUES (104, 4, DATE '2024-02-10', 500.00)
*
ERROR at line 1:
ORA-02291: integrity constraint (SCOTT.SYS_C0010001) violated - parent key not 
found 


SQL> 
SQL> 
SQL> REM Perform JOINs
SQL> 
SQL> REM  1. INNER JOIN: Customers with Orders
SQL> REM Only customers with orders will be shown.
SQL> 
SQL> SELECT C.FirstName, C.LastName, O.OrderID, O.OrderDate, O.Amount
  2  FROM Customers C
  3  INNER JOIN Orders O ON C.CustomerID = O.CustomerID;

FIRSTNAME                                                                       
--------------------------------------------------                              
LASTNAME                                              ORDERID ORDERDATE         
-------------------------------------------------- ---------- ---------         
    AMOUNT                                                                      
----------                                                                      
Mitchell                                                                        
Johnson                                                   101 15-JAN-24         
       250                                                                      
                                                                                
Steve                                                                           
Smith                                                     102 17-JAN-24         
       125                                                                      

FIRSTNAME                                                                       
--------------------------------------------------                              
LASTNAME                                              ORDERID ORDERDATE         
-------------------------------------------------- ---------- ---------         
    AMOUNT                                                                      
----------                                                                      
                                                                                
Mitchell                                                                        
Johnson                                                   103 01-FEB-24         
       300                                                                      
                                                                                

SQL> 
SQL> 
SQL> REM 2. LEFT JOIN: All Customers with or without Orders
SQL> REM Shows all customers, and for those without orders (like Dhoni), order columns will be NULL.
SQL> 
SQL> SELECT C.FirstName, C.LastName, O.OrderID, O.OrderDate, O.Amount
  2  FROM Customers C
  3  LEFT JOIN Orders O ON C.CustomerID = O.CustomerID;

FIRSTNAME                                                                       
--------------------------------------------------                              
LASTNAME                                              ORDERID ORDERDATE         
-------------------------------------------------- ---------- ---------         
    AMOUNT                                                                      
----------                                                                      
Mitchell                                                                        
Johnson                                                   101 15-JAN-24         
       250                                                                      
                                                                                
Steve                                                                           
Smith                                                     102 17-JAN-24         
       125                                                                      

FIRSTNAME                                                                       
--------------------------------------------------                              
LASTNAME                                              ORDERID ORDERDATE         
-------------------------------------------------- ---------- ---------         
    AMOUNT                                                                      
----------                                                                      
                                                                                
Mitchell                                                                        
Johnson                                                   103 01-FEB-24         
       300                                                                      
                                                                                
Mahendra Singh                                                                  
Dhoni                                                                           

FIRSTNAME                                                                       
--------------------------------------------------                              
LASTNAME                                              ORDERID ORDERDATE         
-------------------------------------------------- ---------- ---------         
    AMOUNT                                                                      
----------                                                                      
                                                                                
                                                                                

SQL> 
SQL> 
SQL> REM 3. RIGHT JOIN (RIGHT OUTER JOIN)
SQL> REM Returns all orders, and customer data if available (NULLs if customer not found).
SQL> 
SQL> SELECT C.FirstName, C.LastName, O.OrderID, O.Amount
  2  FROM Customers C
  3  RIGHT JOIN Orders O ON C.CustomerID = O.CustomerID;

FIRSTNAME                                                                       
--------------------------------------------------                              
LASTNAME                                              ORDERID     AMOUNT        
-------------------------------------------------- ---------- ----------        
Mitchell                                                                        
Johnson                                                   101        250        
                                                                                
Steve                                                                           
Smith                                                     102        125        
                                                                                
Mitchell                                                                        
Johnson                                                   103        300        
                                                                                

SQL> 
SQL> 
SQL> REM 4. FULL OUTER JOIN
SQL> REM Returns all records from both tables, matched where possible.
SQL> 
SQL> -- Simulating FULL OUTER JOIN
SQL> SELECT C.FirstName, C.LastName, O.OrderID, O.Amount
  2  FROM Customers C
  3  LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
  4  UNION
  5  SELECT C.FirstName, C.LastName, O.OrderID, O.Amount
  6  FROM Customers C
  7  RIGHT JOIN Orders O ON C.CustomerID = O.CustomerID;

FIRSTNAME                                                                       
--------------------------------------------------                              
LASTNAME                                              ORDERID     AMOUNT        
-------------------------------------------------- ---------- ----------        
Mahendra Singh                                                                  
Dhoni                                                                           
                                                                                
Mitchell                                                                        
Johnson                                                   101        250        
                                                                                
Mitchell                                                                        
Johnson                                                   103        300        
                                                                                

FIRSTNAME                                                                       
--------------------------------------------------                              
LASTNAME                                              ORDERID     AMOUNT        
-------------------------------------------------- ---------- ----------        
Steve                                                                           
Smith                                                     102        125        
                                                                                

SQL> 
SQL> 
SQL> REM 5. CROSS JOIN
SQL> REM Returns the Cartesian product: every row of Customers with every row of Orders.
SQL> REM Total rows = #Customers × #Orders = 3 × 4 = 12 rows
SQL> 
SQL> SELECT C.FirstName, O.OrderID, O.Amount
  2  FROM Customers C
  3  CROSS JOIN Orders O;

FIRSTNAME                                             ORDERID     AMOUNT        
-------------------------------------------------- ---------- ----------        
Mitchell                                                  101        250        
Steve                                                     101        250        
Mahendra Singh                                            101        250        
Mitchell                                                  102        125        
Steve                                                     102        125        
Mahendra Singh                                            102        125        
Mitchell                                                  103        300        
Steve                                                     103        300        
Mahendra Singh                                            103        300        

9 rows selected.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> spool off
