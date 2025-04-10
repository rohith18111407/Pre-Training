SQL> SET ECHO ON
SQL> 
SQL> @"C:\Rohith\Backup\Desktop\Presidio\Pre-Training\5.SQL\Task6\Task6.sql"
SQL> REM Drop Tables Orders
SQL> 
SQL> DROP TABLE Orders CASCADE CONSTRAINTS;

Table dropped.

SQL> 
SQL> 
SQL> REM 1. Creation of Orders Table
SQL> 
SQL> CREATE TABLE Orders (
  2  	 OrderID NUMBER,
  3  	 CustomerName VARCHAR2(50),
  4  	 OrderDate DATE
  5  );

Table created.

SQL> 
SQL> 
SQL> REM 2. Insertion of data
SQL> 
SQL> INSERT INTO Orders VALUES (1, 'MS Dhoni', TO_DATE('10-MAR-2025', 'DD-MON-YYYY'));

1 row created.

SQL> 
SQL> REM Insertion with date Today
SQL> 
SQL> INSERT INTO Orders VALUES (2, 'Rohit Sharma', SYSDATE);

1 row created.

SQL> 
SQL> REM Insertion with - 15 days from today
SQL> 
SQL> INSERT INTO Orders VALUES (3, 'Virat Kohli', SYSDATE - 15);

1 row created.

SQL> 
SQL> REM Insertion with -40 days from today
SQL> 
SQL> INSERT INTO Orders VALUES (4, 'Dinesh Karthik', SYSDATE - 40);

1 row created.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 3. Query: Orders in the Last 30 Days
SQL> 
SQL> SELECT *
  2  FROM Orders
  3  WHERE OrderDate >= SYSDATE - 30;

   ORDERID CUSTOMERNAME                                       ORDERDATE         
---------- -------------------------------------------------- ---------         
         2 Rohit Sharma                                       10-APR-25         
         3 Virat Kohli                                        26-MAR-25         

SQL> 
SQL> 
SQL> 
SQL> REM 4. Query: Days Since Each Order
SQL> 
SQL> REM Calculates how many days have passed since each order was placed.
SQL> 
SQL> SELECT OrderID, CustomerName, OrderDate,
  2  TRUNC(SYSDATE - OrderDate) AS DaysAgo
  3  FROM Orders;

   ORDERID CUSTOMERNAME                                       ORDERDATE         
---------- -------------------------------------------------- ---------         
   DAYSAGO                                                                      
----------                                                                      
         1 MS Dhoni                                           10-MAR-25         
        31                                                                      
                                                                                
         2 Rohit Sharma                                       10-APR-25         
         0                                                                      
                                                                                
         3 Virat Kohli                                        26-MAR-25         
        15                                                                      
                                                                                

   ORDERID CUSTOMERNAME                                       ORDERDATE         
---------- -------------------------------------------------- ---------         
   DAYSAGO                                                                      
----------                                                                      
         4 Dinesh Karthik                                     01-MAR-25         
        40                                                                      
                                                                                

SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 5. Add 1 Month to OrderDate For Delivery Schedule
SQL> 
SQL> SELECT OrderID, CustomerName, OrderDate,
  2  	    ADD_MONTHS(OrderDate, 1) AS DeliveryDate
  3  FROM Orders;

   ORDERID CUSTOMERNAME                                       ORDERDATE         
---------- -------------------------------------------------- ---------         
DELIVERYD                                                                       
---------                                                                       
         1 MS Dhoni                                           10-MAR-25         
10-APR-25                                                                       
                                                                                
         2 Rohit Sharma                                       10-APR-25         
10-MAY-25                                                                       
                                                                                
         3 Virat Kohli                                        26-MAR-25         
26-APR-25                                                                       
                                                                                

   ORDERID CUSTOMERNAME                                       ORDERDATE         
---------- -------------------------------------------------- ---------         
DELIVERYD                                                                       
---------                                                                       
         4 Dinesh Karthik                                     01-MAR-25         
01-APR-25                                                                       
                                                                                

SQL> 
SQL> 
SQL> 
SQL> REM 6. Format Date Output
SQL> 
SQL> REM Converts OrderDate to a string with a custom format like 10-Apr-2025.
SQL> 
SQL> SELECT OrderID, TO_CHAR(OrderDate, 'DD-Mon-YYYY') AS FormattedDate
  2  FROM Orders;

   ORDERID FORMATTEDDA                                                          
---------- -----------                                                          
         1 10-Mar-2025                                                          
         2 10-Apr-2025                                                          
         3 26-Mar-2025                                                          
         4 01-Mar-2025                                                          

SQL> 
SQL> 
SQL> 
SQL> REM 7. Orders Placed on a Monday
SQL> 
SQL> SELECT *
  2  FROM Orders
  3  WHERE TO_CHAR(OrderDate, 'DY') = 'MON';

   ORDERID CUSTOMERNAME                                       ORDERDATE         
---------- -------------------------------------------------- ---------         
         1 MS Dhoni                                           10-MAR-25         

SQL> 
SQL> 
SQL> REM 8. Built-in Date Functions
SQL> 
SQL> SELECT SYSDATE FROM dual;

SYSDATE                                                                         
---------                                                                       
10-APR-25                                                                       

SQL> 
SQL> 
SQL> 
SQL> REM 9. TRUNC(date) - Removes the time portion, returns only the date.
SQL> 
SQL> SELECT OrderID, OrderDate, TRUNC(OrderDate) AS DateOnly
  2  FROM Orders;

   ORDERID ORDERDATE DATEONLY                                                   
---------- --------- ---------                                                  
         1 10-MAR-25 10-MAR-25                                                  
         2 10-APR-25 10-APR-25                                                  
         3 26-MAR-25 26-MAR-25                                                  
         4 01-MAR-25 01-MAR-25                                                  

SQL> 
SQL> 
SQL> 
SQL> REM 10. ADD_MONTHS(date, n) - Adds n months to a date.
SQL> 
SQL> SELECT OrderID, OrderDate, ADD_MONTHS(OrderDate, 1) AS NewDate
  2  FROM Orders;

   ORDERID ORDERDATE NEWDATE                                                    
---------- --------- ---------                                                  
         1 10-MAR-25 10-APR-25                                                  
         2 10-APR-25 10-MAY-25                                                  
         3 26-MAR-25 26-APR-25                                                  
         4 01-MAR-25 01-APR-25                                                  

SQL> 
SQL> 
SQL> REM 11. MONTHS_BETWEEN(date1, date2) - Returns the number of months between two dates.
SQL> 
SQL> SELECT OrderID, OrderDate,
  2  ROUND(MONTHS_BETWEEN(SYSDATE, OrderDate), 2) AS MonthsAgo
  3  FROM Orders;

   ORDERID ORDERDATE  MONTHSAGO                                                 
---------- --------- ----------                                                 
         1 10-MAR-25          1                                                 
         2 10-APR-25          0                                                 
         3 26-MAR-25        .48                                                 
         4 01-MAR-25       1.29                                                 

SQL> 
SQL> 
SQL> 
SQL> REM 12. NEXT_DAY(date, 'DAY') - Returns the next occurrence of a weekday after a given date.
SQL> 
SQL> SELECT OrderID, OrderDate,
  2  NEXT_DAY(OrderDate, 'MONDAY') AS NextMonday
  3  FROM Orders;

   ORDERID ORDERDATE NEXTMONDA                                                  
---------- --------- ---------                                                  
         1 10-MAR-25 17-MAR-25                                                  
         2 10-APR-25 14-APR-25                                                  
         3 26-MAR-25 31-MAR-25                                                  
         4 01-MAR-25 03-MAR-25                                                  

SQL> 
SQL> 
SQL> 
SQL> REM 13. LAST_DAY(date) - Gives the last day of the month of the given date.
SQL> 
SQL> SELECT OrderID, OrderDate, LAST_DAY(OrderDate) AS MonthEnd
  2  FROM Orders;

   ORDERID ORDERDATE MONTHEND                                                   
---------- --------- ---------                                                  
         1 10-MAR-25 31-MAR-25                                                  
         2 10-APR-25 30-APR-25                                                  
         3 26-MAR-25 31-MAR-25                                                  
         4 01-MAR-25 31-MAR-25                                                  

SQL> 
SQL> 
SQL> 
SQL> REM 14. TO_CHAR(date, 'format') - Formats a date into a string.
SQL> 
SQL> SELECT OrderID, TO_CHAR(OrderDate, 'DD-Mon-YYYY') AS FormattedDate
  2  FROM Orders;

   ORDERID FORMATTEDDA                                                          
---------- -----------                                                          
         1 10-Mar-2025                                                          
         2 10-Apr-2025                                                          
         3 26-Mar-2025                                                          
         4 01-Mar-2025                                                          

SQL> 
SQL> 
SQL> 
SQL> REM 15. TO_DATE(string, 'format') - Converts a string into a date.
SQL> 
SQL> SELECT TO_DATE('10-APR-2025', 'DD-MON-YYYY') AS SampleDate
  2  FROM dual;

SAMPLEDAT                                                                       
---------                                                                       
10-APR-25                                                                       

SQL> 
SQL> 
SQL> 
SQL> REM 16. Filter: Orders in Last 30 Days
SQL> 
SQL> SELECT *
  2  FROM Orders
  3  WHERE OrderDate >= SYSDATE - 30;

   ORDERID CUSTOMERNAME                                       ORDERDATE         
---------- -------------------------------------------------- ---------         
         2 Rohit Sharma                                       10-APR-25         
         3 Virat Kohli                                        26-MAR-25         

SQL> 
SQL> 
SQL> 
SQL> REM 17. Calculate Days Since Each Order
SQL> 
SQL> SELECT OrderID, CustomerName, OrderDate,
  2  ROUND(SYSDATE - OrderDate) AS DaysPassed
  3  FROM Orders;

   ORDERID CUSTOMERNAME                                       ORDERDATE         
---------- -------------------------------------------------- ---------         
DAYSPASSED                                                                      
----------                                                                      
         1 MS Dhoni                                           10-MAR-25         
        32                                                                      
                                                                                
         2 Rohit Sharma                                       10-APR-25         
         0                                                                      
                                                                                
         3 Virat Kohli                                        26-MAR-25         
        15                                                                      
                                                                                

   ORDERID CUSTOMERNAME                                       ORDERDATE         
---------- -------------------------------------------------- ---------         
DAYSPASSED                                                                      
----------                                                                      
         4 Dinesh Karthik                                     01-MAR-25         
        40                                                                      
                                                                                

SQL> 
SQL> spool off
