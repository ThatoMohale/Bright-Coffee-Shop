-- I want to see my table in the coding to start exploring each column
SELECT * 
FROM workspace.default.bright_coffee_shop_data
LIMIT 10;

--------------------------------------------------------
-- 1. Checking The Date Range (2023-01-01 to 2023-06-30)
--------------------------------------------------------
SELECT MIN(transaction_date) AS min_date
FROM workspace.default.bright_coffee_shop_data;
--They started collecting data 2023-01-01

SELECT MAX(transaction_date) AS max_date
FROM workspace.default.bright_coffee_shop_data;
-- They stopped collecting data on 2023-06-30
-- Duration 6 Months

 -------------------------------------------------
-- 2. Check The Name Of Different Store Location
--------------------------------------------------
SELECT DISTINCT store_location
FROM workspace.default.bright_coffee_shop_data;
-- There are 3 stores

--
SELECT COUNT(DISTINCT store_id) AS number_of_stores
FROM workspace.default.bright_coffee_shop_data;

----------------------------
-- 3. Cheking products sold
----------------------------

SELECT DISTINCT product_category
FROM workspace.default.bright_coffee_shop_data;

SELECT DISTINCT product_detail
FROM workspace.default.bright_coffee_shop_data;
-- There are 80 different types of product detail.

SELECT DISTINCT product_type
FROM workspace.default.bright_coffee_shop_data;
-- There are 29 product types

SELECT DISTINCT product_category AS category,
                product_detail AS product_name
FROM workspace.default.bright_coffee_shop_data;

---------------------------------
-- 4. Checking The Product Prices
---------------------------------

SELECT MIN(unit_price) AS cheapest_price
FROM workspace.default.bright_coffee_shop_data;
-- Cheapest Price Is R0.8

SELECT MAX(unit_price) AS expensive_price
FROM workspace.default.bright_coffee_shop_data;
-- Expensive Price Is R45

SELECT COUNT (*) AS number_of_rows,
       COUNT (DISTINCT transaction_id) AS number_of_sales,
       COUNT (DISTINCT product_id) AS number_of_products,
       COUNT (DISTINCT store_id) AS number_of_stores
FROM workspace.default.bright_coffee_shop_data;

------------------------

------------------------

SELECT Transaction_id
       Transaction_date,
       Dayname(transaction_date) AS Day_name,
       Monthname(transaction_date) AS Month_name,
       Transaction_qty*unit_price AS Revenue
FROM workspace.default.bright_coffee_shop_data;

----------------------------------------
-- Aggregate No. Of Transactions Per Day
----------------------------------------

SELECT Transaction_date,
       Dayname(transaction_date) AS Day_name,
       Monthname(transaction_date) AS Month_name,
       COUNT(DISTINCT transaction_id) AS Number_of_sales,
       SUM(Transaction_qty*unit_price) AS Revenue
FROM workspace.default.bright_coffee_shop_data
GROUP BY Transaction_date,
         Day_name,
         Month_name;




