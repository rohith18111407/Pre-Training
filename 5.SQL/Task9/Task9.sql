REM Drop table Sales

DROP TABLE Sales CASCADE CONSTRAINTS;


REM Creation of table Sales

CREATE TABLE Sales (
    SaleID      NUMBER PRIMARY KEY,
    SaleDate    DATE,
    Amount      NUMBER
);


REM Insertion of data into Sales

INSERT INTO Sales VALUES (1, TO_DATE('2024-12-01','YYYY-MM-DD'), 1000);
INSERT INTO Sales VALUES (2, TO_DATE('2024-12-15','YYYY-MM-DD'), 2000);
INSERT INTO Sales VALUES (3, TO_DATE('2025-01-10','YYYY-MM-DD'), 1500);


REM Data present in Sales

SELECT *
FROM Sales;


REM 1. Stored Procedure: Total Sales Within a Date Range

REM Procedure


CREATE OR REPLACE PROCEDURE GetTotalSales (
    p_start_date IN DATE,
    p_end_date   IN DATE,
    p_total      OUT NUMBER
)
AS
BEGIN
    SELECT SUM(Amount)
    INTO p_total
    FROM Sales
    WHERE SaleDate BETWEEN p_start_date AND p_end_date;
END;
/



REM Test for the Procedure Creation

SET SERVEROUTPUT ON;
DECLARE
    v_total NUMBER;
BEGIN
    GetTotalSales(TO_DATE('2024-12-01','YYYY-MM-DD'), TO_DATE('2024-12-31','YYYY-MM-DD'), v_total);
    DBMS_OUTPUT.PUT_LINE('Total Sales in Dec 2024: ' || v_total);
END;
/




REM 2. Scalar Function: Calculate Discount

CREATE OR REPLACE FUNCTION CalculateDiscount (
    p_amount IN NUMBER
) RETURN NUMBER
AS
    v_discount NUMBER;
BEGIN
    IF p_amount >= 2000 THEN
        v_discount := p_amount * 0.10;
    ELSIF p_amount >= 1000 THEN
        v_discount := p_amount * 0.05;
    ELSE
        v_discount := 0;
    END IF;
    RETURN v_discount;
END;
/



REM Test for the Function

SELECT SaleID, Amount, CalculateDiscount(Amount) AS Discount
FROM Sales;
