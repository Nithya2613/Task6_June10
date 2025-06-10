SHOW DATABASES;
#CREATE DATABASE IF NOT EXISTS sales_data;
USE sales_data;
CREATE TABLE online_sales (
    OrderID VARCHAR(20),
    Amount DECIMAL(10,2),
    Profit DECIMAL(10,2),
    Quantity INT,
    Category VARCHAR(100),
    SubCategory VARCHAR(100),
    PaymentMode VARCHAR(50),
    OrderDate DATE,
    CustomerName VARCHAR(100),
    State VARCHAR(50),
    City VARCHAR(50)
);

#Verify Table structure
DESCRIBE online_sales;

#Verify the first few rows
SELECT * FROM online_sales LIMIT 10;
#USE EXTRACT(MONTH FROM OrderDate) for Month
SELECT EXTRACT(MONTH FROM 'Order Date') AS order_month
FROM online_sales;

#USE EXTRACT(YEAR FROM 'Order Date') for Year
SELECT EXTRACT(YEAR FROM 'Order Date') AS order_year
FROM online_sales;
#OR
SELECT 
EXTRACT(MONTH FROM 'Order Date') AS order_month,
EXTRACT(YEAR FROM 'Order Date') AS order_year
FROM online_sales
LIMIT 10;

#Combine year and month to group data monthly
SELECT 
  EXTRACT(YEAR FROM 'Order Date') AS order_year,
  EXTRACT(MONTH FROM 'OrderDate') AS order_month
FROM online_sales
GROUP BY order_year, order_month;

#SUM(Amount) adds total revenue for each month
SELECT 
  EXTRACT(YEAR FROM 'Order Date') AS order_year,
  EXTRACT(MONTH FROM 'Order Date') AS order_month,
  SUM(Amount) AS total_revenue
FROM online_sales
GROUP BY order_year, order_month;

#To count unique orders per month
SELECT 
  EXTRACT(YEAR FROM 'Order Date') AS order_year,
  EXTRACT(MONTH FROM 'Order Date') AS order_month,
  SUM(Amount) AS total_revenue,
  COUNT(DISTINCT 'Order ID') AS order_volume
FROM online_sales
GROUP BY order_year, order_month;

#Use ORDER BY for sorting results and limit by date
SELECT 
  EXTRACT(YEAR FROM 'Order Date') AS order_year,
  EXTRACT(MONTH FROM 'Order Date') AS order_month,
  SUM(Amount) AS total_revenue,
  COUNT(DISTINCT 'Order ID') AS order_volume
FROM online_sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


SELECT 
  EXTRACT(YEAR FROM 'Order Date') AS order_year,
  EXTRACT(MONTH FROM 'Order Date') AS order_month,
  SUM(Amount) AS total_revenue,
  COUNT(DISTINCT 'Order ID') AS order_volume
FROM online_sales
WHERE 'Order Date' BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY order_year, order_month
ORDER BY order_year, order_month;