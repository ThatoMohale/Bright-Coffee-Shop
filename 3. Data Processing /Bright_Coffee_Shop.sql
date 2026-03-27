-- I want to see my table in the coding to start exploring each column
SELECT * 
FROM workspace.default.bright_coffee_shop_data
LIMIT 100;

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
       Transaction_time,
       Store_id,
       Store_location, 
       Product_id
       Unit_price,
       Product_category,
       Product_type,
       Product_detail,

 -- Adding Columns for better insights
       Dayname(transaction_date) AS Day_name,
       Monthname(transaction_date) AS Month_name,

       CASE 
            WHEN Day_name IN ('Sun' , 'Sat') THEN 'Weekend'
            ELSE 'Weekday'
       END AS Day_classification, 

       
       Transaction_qty*unit_price AS Revenue
FROM workspace.default.bright_coffee_shop_data;

----------------------------------------
-- Aggregate No. Of Transactions Per Day
----------------------------------------

SELECT Transaction_date,
       Dayname(Transaction_date) AS Day_name,
       Monthname(Transaction_date) AS Month_name,
       Date_format(Transaction_time, 'HH:mm:ss') AS  purchase_time,

       CASE 
            WHEN date_format(Transaction_time, 'HH:mm:ss') BETWEEN '00:00:00' AND '11:59:59' THEN '01. Morning'
            WHEN date_format(Transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN '02. Afternoon'
            WHEN date_format(Transaction_time, 'HH:mm:ss') >= '17:00:00' THEN '03. Evening'
            END AS time_buckets,


-- Count ID's
       COUNT(DISTINCT Transaction_id) AS Number_of_sales,
       COUNT(DISTINCT Product_id) AS Number_of_products,
       COUNT(DISTINCT Store_id) AS Number_of_stores,

-- Calculating Revenue
       SUM(Transaction_qty*unit_price) AS Revenue_per_day,

--  Categorical Columns
      store_location,
      product_category,
      product_detail

FROM workspace.default.bright_coffee_shop_data
GROUP BY Transaction_date,
         Day_name,
         Month_name,
         Store_location,
         product_category,
         Product_detail,
         purchase_time,
         time_buckets,
         Month_name;




