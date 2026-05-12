-- Remove existing table
DROP TABLE IF EXISTS retail_sales;

-- Create retail sales table
CREATE TABLE retail_sales (
    row_id INTEGER,
    order_id TEXT,
    order_date TEXT,
    ship_date TEXT,
    ship_mode TEXT,
    customer_id TEXT,
    customer_name TEXT,
    segment TEXT,
    country TEXT,
    city TEXT,
    state TEXT,
    postal_code TEXT,
    region TEXT,
    product_id TEXT,
    category TEXT,
    sub_category TEXT,
    product_name TEXT,
    sales NUMERIC,
    quantity INTEGER,
    discount NUMERIC,
    profit NUMERIC
);

-- View first 10 rows
SELECT *
FROM retail_sales
LIMIT 10;

-- Total sales and profit
SELECT 
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM retail_sales;

-- Sales by category
SELECT 
    category,
    ROUND(SUM(sales), 2) AS total_sales
FROM retail_sales
GROUP BY category
ORDER BY total_sales DESC;

-- Profit by category
SELECT 
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM retail_sales
GROUP BY category
ORDER BY total_profit DESC;

-- Top 10 profitable states
SELECT 
    state,
    ROUND(SUM(profit), 2) AS total_profit
FROM retail_sales
GROUP BY state
ORDER BY total_profit DESC
LIMIT 10;

-- States with negative profit
SELECT 
    state,
    ROUND(SUM(profit), 2) AS total_profit
FROM retail_sales
GROUP BY state
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;

-- Top-selling sub-categories
SELECT 
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales
FROM retail_sales
GROUP BY sub_category
ORDER BY total_sales DESC
LIMIT 10;