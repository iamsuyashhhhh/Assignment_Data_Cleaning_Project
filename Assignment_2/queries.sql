-- DATA EXPLORATION --

--View first 10 records
SELECT *
FROM superstore_sales
LIMIT 10;

-- Total number of records
SELECT COUNT(*) AS total_records
FROM superstore_sales;

-- View table structure
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'superstore_sales';


-- WHERE FILTERS --

--Orders from West Region
SELECT *
FROM superstore_sales
WHERE "Region" = 'West';

--Technology Products
SELECT *
FROM superstore_sales
WHERE "Category" = 'Technology';

--Orders with Sales above 1000
SELECT *
FROM superstore_sales
WHERE "Sales" > 1000;

--Orders with Profit above 100
SELECT *
FROM superstore_sales
WHERE "Profit" > 100;

--Orders with Discount greater than 30%
SELECT *
FROM superstore_sales
WHERE "Discount" > 0.30;


-- GROUP BY AGGREGATIONS --

--Total Sales by Category
SELECT
"Category",
SUM("Sales") AS total_sales
FROM superstore_sales
GROUP BY "Category";

--Total Quantity by Region
SELECT
"Region",
SUM("Quantity") AS total_quantity
FROM superstore_sales
GROUP BY "Region";

--Average Profit by Segment
SELECT
"Segment",
AVG("Profit") AS avg_profit
FROM superstore_sales
GROUP BY "Segment";

--Average Discount by Category
SELECT
"Category",
AVG("Discount") AS avg_discount
FROM superstore_sales
GROUP BY "Category";

--Total Sales by Ship Mode
SELECT
"Ship Mode",
SUM("Sales") AS total_sales
FROM superstore_sales
GROUP BY "Ship Mode";


-- SORTING & LIMIT --

--Top 10 Products by Quantity Sold
SELECT
"Product Name",
SUM("Quantity") AS total_quantity
FROM superstore_sales
GROUP BY "Product Name"
ORDER BY total_quantity DESC
LIMIT 10;

--Top 10 States by Sales
SELECT
"State",
SUM("Sales") AS total_sales
FROM superstore_sales
GROUP BY "State"
ORDER BY total_sales DESC
LIMIT 10;

--Top 5 Customers by Quantity Purchased
SELECT
"Customer Name",
SUM("Quantity") AS total_quantity
FROM superstore_sales
GROUP BY "Customer Name"
ORDER BY total_quantity DESC
LIMIT 5;

--Top 10 Sub-Categories by Profit
SELECT
"Sub-Category",
SUM("Profit") AS total_profit
FROM superstore_sales
GROUP BY "Sub-Category"
ORDER BY total_profit DESC
LIMIT 10;


-- BUSINESS USE CASES --

--Sales by Year
SELECT
EXTRACT(YEAR FROM TO_DATE("Order Date",'MM/DD/YYYY')) AS year,
SUM("Sales") AS total_sales
FROM superstore_sales
GROUP BY year
ORDER BY year;

--Most Sold Products
SELECT
"Product Name",
SUM("Quantity") AS total_quantity
FROM superstore_sales
GROUP BY "Product Name"
ORDER BY total_quantity DESC
LIMIT 10;

--Products with Highest Discounts
SELECT
"Product Name",
MAX("Discount") AS max_discount
FROM superstore_sales
GROUP BY "Product Name"
ORDER BY max_discount DESC
LIMIT 10;

--Segment-wise Sales
SELECT
"Segment",
SUM("Sales") AS total_sales
FROM superstore_sales
GROUP BY "Segment";

--Region-wise Quantity Sold
SELECT
"Region",
SUM("Quantity") AS total_quantity
FROM superstore_sales
GROUP BY "Region";


-- DATA VALIDATION --

--Check Duplicate Order IDs
SELECT
"Order ID",
COUNT(*)
FROM superstore_sales
GROUP BY "Order ID"
HAVING COUNT(*) > 1;

--Check Null Values
SELECT COUNT(*) AS null_records
FROM superstore_sales
WHERE "Sales" IS NULL
OR "Profit" IS NULL
OR "Customer Name" IS NULL;

--Count Distinct Customers and Products
SELECT
COUNT(DISTINCT "Customer ID") AS total_customers,
COUNT(DISTINCT "Product ID") AS total_products
FROM superstore_sales;
