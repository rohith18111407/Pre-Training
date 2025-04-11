SQL> SET ECHO ON
SQL> 
SQL> @"C:\Rohith\Backup\Desktop\Presidio\Pre-Training\5.SQL\Task9\Task9.sql"
SQL> REM Drop table Sales
SQL> 
SQL> DROP TABLE Sales CASCADE CONSTRAINTS;

Table dropped.

SQL> 
SQL> 
SQL> REM Creation of table Sales
SQL> 
SQL> CREATE TABLE Sales (
  2  	 SaleID      NUMBER PRIMARY KEY,
  3  	 SaleDate    DATE,
  4  	 Amount      NUMBER
  5  );

Table created.

SQL> 
SQL> 
SQL> REM Insertion of data into Sales
SQL> 
SQL> INSERT INTO Sales VALUES (1, TO_DATE('2024-12-01','YYYY-MM-DD'), 1000);

1 row created.

SQL> INSERT INTO Sales VALUES (2, TO_DATE('2024-12-15','YYYY-MM-DD'), 2000);

1 row created.

SQL> INSERT INTO Sales VALUES (3, TO_DATE('2025-01-10','YYYY-MM-DD'), 1500);

1 row created.

SQL> 
SQL> 
SQL> REM Data present in Sales
SQL> 
SQL> SELECT *
  2  FROM Sales;

    SALEID SALEDATE      AMOUNT                                                 
---------- --------- ----------                                                 
         1 01-DEC-24       1000                                                 
         2 15-DEC-24       2000                                                 
         3 10-JAN-25       1500                                                 

SQL> 
SQL> 
SQL> REM 1. Stored Procedure: Total Sales Within a Date Range
SQL> 
SQL> REM Procedure
SQL> 
SQL> 
SQL> CREATE OR REPLACE PROCEDURE GetTotalSales (
  2  	 p_start_date IN DATE,
  3  	 p_end_date   IN DATE,
  4  	 p_total      OUT NUMBER
  5  )
  6  AS
  7  BEGIN
  8  	 SELECT SUM(Amount)
  9  	 INTO p_total
 10  	 FROM Sales
 11  	 WHERE SaleDate BETWEEN p_start_date AND p_end_date;
 12  END;
 13  /

Procedure created.

SQL> 
SQL> 
SQL> 
SQL> REM Test for the Procedure Creation
SQL> 
SQL> SET SERVEROUTPUT ON;
SQL> DECLARE
  2  	 v_total NUMBER;
  3  BEGIN
  4  	 GetTotalSales(TO_DATE('2024-12-01','YYYY-MM-DD'), TO_DATE('2024-12-31','YYYY-MM-DD'), v_total);
  5  	 DBMS_OUTPUT.PUT_LINE('Total Sales in Dec 2024: ' || v_total);
  6  END;
  7  /
Total Sales in Dec 2024: 3000                                                   

PL/SQL procedure successfully completed.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 2. Scalar Function: Calculate Discount
SQL> 
SQL> CREATE OR REPLACE FUNCTION CalculateDiscount (
  2  	 p_amount IN NUMBER
  3  ) RETURN NUMBER
  4  AS
  5  	 v_discount NUMBER;
  6  BEGIN
  7  	 IF p_amount >= 2000 THEN
  8  	     v_discount := p_amount * 0.10;
  9  	 ELSIF p_amount >= 1000 THEN
 10  	     v_discount := p_amount * 0.05;
 11  	 ELSE
 12  	     v_discount := 0;
 13  	 END IF;
 14  	 RETURN v_discount;
 15  END;
 16  /

Function created.

SQL> 
SQL> 
SQL> 
SQL> REM Test for the Function
SQL> 
SQL> SELECT SaleID, Amount, CalculateDiscount(Amount) AS Discount
  2  FROM Sales;

    SALEID     AMOUNT   DISCOUNT                                                
---------- ---------- ----------                                                
         1       1000         50                                                
         2       2000        200                                                
         3       1500         75                                                

SQL> 
SQL> 
SQL> 
SQL> spool off
