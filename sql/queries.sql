-- ====================================================================================
-- SUPERSTORE SALES ANALYSIS PROJECT
-- Author: Stergios Tsantalis
-- Description: SQL analysis on Superstore data
-- ====================================================================================

/*

BUSINESS QUESTIONS:

1. What are total sales?
2. Which category perfoms the best?
3.Which region performs the best?
4. Who are the top customers?
5. How do sales evolve over time?
========================================================================================

*/

-- ====================================================================================
-- 1. TOTAL SALES
-- ====================================================================================

SELECT SUM(sales) as total_sales
FROM superstore;

-- ====================================================================================
-- 2. SALES PERFORMANCE BY CATEGORY
-- ====================================================================================
SELECT category, 
       SUM(sales) as total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

-- ============================================
-- 3. SALES PERFORMANCE BY STATE
-- ============================================

SELECT 
    state,
    city,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY state,city
ORDER BY total_sales DESC;

-- ====================================================================================
-- 4. TOP 10 CUSTOMERS BY REVENUE
-- ====================================================================================

SELECT 
    customer_name,
    SUM(sales) AS total_spent
FROM superstore
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;


-- =====================================================================================
-- 5.  SALES TREND OVER TIME (MONTHLY)
-- =====================================================================================

SELECT 
    year,
    month,
    SUM(sales) AS monthly_sales
FROM superstore
GROUP BY year, month
ORDER BY year, month;

-- ============================================
-- 6. TOP PRODUCTS BY SALES
-- ============================================

SELECT 
    product_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- =====================================================================================
-- END OF ANALYSIS
-- =====================================================================================
