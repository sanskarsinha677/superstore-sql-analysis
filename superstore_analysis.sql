/*
================================================
SUPERSTORE SALES ANALYSIS
Author   : Sanskar Sinha
Database : spotrix_superstore
Table    : superstore
================================================
*/
/* =====================================================
   SUPERSTORE SALES ANALYSIS
   Database: spotrix_superstore
   Table   : superstore
   ===================================================== */

USE spotrix_superstore;

/* =====================================================
   1. BASIC DATA CHECK
   ===================================================== */

-- Total number of rows
SELECT COUNT(*) AS total_rows
FROM superstore;

-- Preview data
SELECT *
FROM superstore
LIMIT 5;

-- Order date range
SELECT
    MIN(OrderDate) AS first_order_date,
    MAX(OrderDate) AS last_order_date
FROM superstore;


/* =====================================================
   2. OVERALL BUSINESS PERFORMANCE
   ===================================================== */

SELECT
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(AVG(Profit), 2) AS avg_profit_per_row
FROM superstore;


/* =====================================================
   3. CATEGORY-WISE PERFORMANCE
   ===================================================== */

SELECT
    Category,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS profit_margin_pct
FROM superstore
GROUP BY Category
ORDER BY total_profit DESC;


/* =====================================================
   4. TOP & BOTTOM PRODUCTS BY PROFIT
   ===================================================== */

-- Top 10 profitable products
SELECT
    ProductName,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY ProductName
ORDER BY total_profit DESC
LIMIT 10;

-- Bottom 10 loss-making products
SELECT
    ProductName,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY ProductName
ORDER BY total_profit ASC
LIMIT 10;


/* =====================================================
   5. DISCOUNT IMPACT ANALYSIS
   ===================================================== */

SELECT
    ROUND(Discount, 2) AS discount_rate,
    COUNT(*)           AS orders_count,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;


/* =====================================================
   6. QUANTITY vs PROFIT CHECK
   ===================================================== */

SELECT
    Quantity,
    COUNT(*)              AS order_count,
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Quantity
ORDER BY Quantity;


/* =====================================================
   END OF ANALYSIS
   ===================================================== */
