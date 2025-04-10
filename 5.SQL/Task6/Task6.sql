REM Drop Tables Orders

DROP TABLE Orders CASCADE CONSTRAINTS;


REM 1. Creation of Orders Table

CREATE TABLE Orders (
    OrderID NUMBER,
    CustomerName VARCHAR2(50),
    OrderDate DATE
);


REM 2. Insertion of data 

INSERT INTO Orders VALUES (1, 'MS Dhoni', TO_DATE('10-MAR-2025', 'DD-MON-YYYY'));

REM Insertion with date Today

INSERT INTO Orders VALUES (2, 'Rohit Sharma', SYSDATE); 

REM Insertion with - 15 days from today

INSERT INTO Orders VALUES (3, 'Virat Kohli', SYSDATE - 15);

REM Insertion with -40 days from today

INSERT INTO Orders VALUES (4, 'Dinesh Karthik', SYSDATE - 40); 




REM 3. Query: Orders in the Last 30 Days

SELECT * 
FROM Orders
WHERE OrderDate >= SYSDATE - 30;



REM 4. Query: Days Since Each Order

REM Calculates how many days have passed since each order was placed.

SELECT OrderID, CustomerName, OrderDate,
TRUNC(SYSDATE - OrderDate) AS DaysAgo
FROM Orders;




REM 5. Add 1 Month to OrderDate For Delivery Schedule

SELECT OrderID, CustomerName, OrderDate,
       ADD_MONTHS(OrderDate, 1) AS DeliveryDate
FROM Orders;



REM 6. Format Date Output

REM Converts OrderDate to a string with a custom format like 10-Apr-2025.

SELECT OrderID, TO_CHAR(OrderDate, 'DD-Mon-YYYY') AS FormattedDate
FROM Orders;



REM 7. Orders Placed on a Monday

SELECT * 
FROM Orders
WHERE TO_CHAR(OrderDate, 'DY') = 'MON';


REM 8. Built-in Date Functions

SELECT SYSDATE FROM dual;



REM 9. TRUNC(date) - Removes the time portion, returns only the date.

SELECT OrderID, OrderDate, TRUNC(OrderDate) AS DateOnly
FROM Orders;



REM 10. ADD_MONTHS(date, n) - Adds n months to a date.

SELECT OrderID, OrderDate, ADD_MONTHS(OrderDate, 1) AS NewDate
FROM Orders;


REM 11. MONTHS_BETWEEN(date1, date2) - Returns the number of months between two dates.

SELECT OrderID, OrderDate, 
ROUND(MONTHS_BETWEEN(SYSDATE, OrderDate), 2) AS MonthsAgo
FROM Orders;



REM 12. NEXT_DAY(date, 'DAY') - Returns the next occurrence of a weekday after a given date.

SELECT OrderID, OrderDate,
NEXT_DAY(OrderDate, 'MONDAY') AS NextMonday
FROM Orders;



REM 13. LAST_DAY(date) - Gives the last day of the month of the given date.

SELECT OrderID, OrderDate, LAST_DAY(OrderDate) AS MonthEnd
FROM Orders;



REM 14. TO_CHAR(date, 'format') - Formats a date into a string.

SELECT OrderID, TO_CHAR(OrderDate, 'DD-Mon-YYYY') AS FormattedDate
FROM Orders;



REM 15. TO_DATE(string, 'format') - Converts a string into a date.

SELECT TO_DATE('10-APR-2025', 'DD-MON-YYYY') AS SampleDate
FROM dual;



REM 16. Filter: Orders in Last 30 Days

SELECT * 
FROM Orders
WHERE OrderDate >= SYSDATE - 30;



REM 17. Calculate Days Since Each Order

SELECT OrderID, CustomerName, OrderDate,
ROUND(SYSDATE - OrderDate) AS DaysPassed
FROM Orders;

