--# SQL Assignment Solutions - Items and Products Database

--## Basic Questions

--- 1. Create two Databases
---
CREATE DATABASE Brands;
CREATE DATABASE Products;


--- 2. Create two tables in SQL Server
---
-- Switch to Brands database
USE Brands;
CREATE TABLE ITEMS_TABLE (
    Item_Id INT PRIMARY KEY,
    item_description VARCHAR(255),
    bottle_size INT,
    bottle_price DECIMAL(10,2),
    vendor_name VARCHAR(100),
    vendor_nos INT
);

-- Switch to Products database
USE Products;
CREATE TABLE PRODUCT_TABLE (
    Product_Id INT PRIMARY KEY,
    Country VARCHAR(100),
    Product VARCHAR(100),
    Units_Sold DECIMAL(10,2),
    Manufacturing_Price DECIMAL(10,2),
    Sale_Price DECIMAL(10,2),
    Gross_Sales DECIMAL(10,2),
    Date DATE,
    Month_Name VARCHAR(20),
    Year INT,
    COGS DECIMAL(10,2),
    Profit DECIMAL(10,2)
);


--- 3. Add records to tables
---
-- Insert statements would go here based on the data sheets
-- Example format:
INSERT INTO ITEMS_TABLE (Item_Id, item_description, bottle_size, bottle_price, vendor_name, vendor_nos)
VALUES (1, 'Whisky Brand A', 750, 25.99, 'Vendor A', 305);

INSERT INTO PRODUCT_TABLE (Product_Id, Country, Product, Units_Sold, Manufacturing_Price, Sale_Price, Gross_Sales, Date, Month_Name, Year, COGS, Profit)
VALUES (1, 'USA', 'Product A', 1500, 10.00, 15.00, 22500.00, '2019-01-15', 'January', 2019, 12000.00, 10500.00);


--- 4. Delete products with specific Units Sold
---
DELETE FROM PRODUCT_TABLE 
WHERE Units_Sold IN (1618.5, 888, 2470);


--- 5. Select all records from ITEMS_TABLE
---
SELECT * FROM ITEMS_TABLE;


--- 6. Select item_description and bottle_price
---
SELECT item_description, bottle_price 
FROM ITEMS_TABLE;


--- 7. Find items where bottle_price > 20
---
SELECT item_description, bottle_price 
FROM ITEMS_TABLE 
WHERE bottle_price > 20;


--- 8. Select unique countries
---
SELECT DISTINCT Country 
FROM PRODUCT_TABLE;


--- 9. Count number of countries
---
SELECT COUNT(DISTINCT Country) AS Country_Count 
FROM PRODUCT_TABLE;


--- 10. Countries with sales price between 10 to 20
---
SELECT COUNT(DISTINCT Country) AS Country_Count 
FROM PRODUCT_TABLE 
WHERE Sale_Price BETWEEN 10 AND 20;


--## Intermediate Questions

--- 1. Find Total Sale Price and Gross Sales
---
SELECT SUM(Sale_Price) AS Total_Sale_Price, 
       SUM(Gross_Sales) AS Total_Gross_Sales 
FROM PRODUCT_TABLE;


--- 2. Year with highest sales
---
SELECT TOP 1 Year, SUM(Gross_Sales) AS Total_Sales 
FROM PRODUCT_TABLE 
GROUP BY Year 
ORDER BY Total_Sales DESC;


--- 3. Product with sales of $37,050.00
---
SELECT Product 
FROM PRODUCT_TABLE 
WHERE Gross_Sales = 37050.00;


--- 4. Countries with profit between $4,605 to $22,662.00
---
SELECT DISTINCT Country 
FROM PRODUCT_TABLE 
WHERE Profit BETWEEN 4605 AND 22662.00;


--- 5. Product Id with sales of $24,700.00
---
SELECT Product_Id 
FROM PRODUCT_TABLE 
WHERE Gross_Sales = 24700.00;


--- 6. Total Units Sold for each Country
---
SELECT Country, SUM(Units_Sold) AS Total_Units_Sold 
FROM PRODUCT_TABLE 
GROUP BY Country;


--- 7. Average sales for each country
---
SELECT Country, AVG(Gross_Sales) AS Average_Sales 
FROM PRODUCT_TABLE 
GROUP BY Country;


--- 8. All products sold in 2014
---
SELECT * FROM PRODUCT_TABLE 
WHERE Year = 2014;


--- 9. Maximum Profit
---
SELECT MAX(Profit) AS Maximum_Profit 
FROM PRODUCT_TABLE;


--- 10. Records where Profit > average Profit
---
SELECT * FROM PRODUCT_TABLE 
WHERE Profit > (SELECT AVG(Profit) FROM PRODUCT_TABLE);


--- 11. Item_description with bottle size 750
---
SELECT item_description 
FROM ITEMS_TABLE 
WHERE bottle_size = 750;


--- 12. Vendor names with specific vendor_nos
---
SELECT vendor_name 
FROM ITEMS_TABLE 
WHERE vendor_nos IN (305, 380, 391);


--- 13. Total Bottle_price
---
SELECT SUM(bottle_price) AS Total_Bottle_Price 
FROM ITEMS_TABLE;


--- 14. Make Primary Key to Item_id


ALTER TABLE ITEMS_TABLE 
ADD CONSTRAINT PK_Item_Id PRIMARY KEY (Item_Id);


--- 15. Item id with bottle_price of $5.06
---
SELECT Item_Id 
FROM ITEMS_TABLE 
WHERE bottle_price = 5.06;


--## Advanced Questions

--- 1. Apply JOIN types on both tables
---
-- INNER JOIN
SELECT i.item_description, p.Product, p.Gross_Sales
FROM ITEMS_TABLE i
INNER JOIN PRODUCT_TABLE p ON i.vendor_nos = p.Product_Id;

-- LEFT JOIN
SELECT i.item_description, p.Product, p.Gross_Sales
FROM ITEMS_TABLE i
LEFT JOIN PRODUCT_TABLE p ON i.vendor_nos = p.Product_Id;

-- FULL OUTER JOIN
SELECT i.item_description, p.Product, p.Gross_Sales
FROM ITEMS_TABLE i
FULL OUTER JOIN PRODUCT_TABLE p ON i.vendor_nos = p.Product_Id;


--- 2. Item_description and Product with gross sales of 13,320.00
---
SELECT i.item_description, p.Product
FROM ITEMS_TABLE i
INNER JOIN PRODUCT_TABLE p ON i.vendor_nos = p.Product_Id
WHERE p.Gross_Sales = 13320.00;


--- 3. Split Item_description column
---
SELECT 
    item_description,
    LEFT(item_description, CHARINDEX(' ', item_description + ' ') - 1) AS Item_desc1,
    SUBSTRING(item_description, CHARINDEX(' ', item_description + ' ') + 1, LEN(item_description)) AS Item_desc2
FROM ITEMS_TABLE;


--- 4. Top 3 most expensive items
---
SELECT TOP 3 item_description, bottle_price 
FROM ITEMS_TABLE 
ORDER BY bottle_price DESC;


--- 5. Total Gross Sales and Profit for each Product in each Country
---
SELECT Country, Product, 
       SUM(Gross_Sales) AS Total_Gross_Sales, 
       SUM(Profit) AS Total_Profit
FROM PRODUCT_TABLE 
GROUP BY Country, Product;


--- 6. Vendor_name and item_description with bottle_size 750 and price < 10
---
SELECT vendor_name, item_description 
FROM ITEMS_TABLE 
WHERE bottle_size = 750 AND bottle_price < 10;


--- 7. Product with highest Profit in 2019
---
SELECT TOP 1 Product, Profit 
FROM PRODUCT_TABLE 
WHERE Year = 2019 
ORDER BY Profit DESC;


--- 8. Product_Id and Country where Profit >= 2 * COGS
---
SELECT Product_Id, Country 
FROM PRODUCT_TABLE 
WHERE Profit >= (2 * COGS);


--- 9. Country with highest total Gross Sales in 2018
---
SELECT TOP 1 Country, SUM(Gross_Sales) AS Total_Sales 
FROM PRODUCT_TABLE 
WHERE Year = 2018 
GROUP BY Country 
ORDER BY Total_Sales DESC;


--- 10. Total Sales for each Month across all years
---
SELECT Month_Name, SUM(Gross_Sales) AS Total_Monthly_Sales 
FROM PRODUCT_TABLE 
GROUP BY Month_Name 
ORDER BY Total_Monthly_Sales DESC;


--- 11. Items with vendor_nos existing more than once
---
SELECT item_description, vendor_name 
FROM ITEMS_TABLE 
WHERE vendor_nos IN (
    SELECT vendor_nos 
    FROM ITEMS_TABLE 
    GROUP BY vendor_nos 
    HAVING COUNT(*) > 1
);


--- 12. Average Manufacturing Price > 3 for each Country-Product combination
---
SELECT Country, Product, AVG(Manufacturing_Price) AS Avg_Manufacturing_Price 
FROM PRODUCT_TABLE 
GROUP BY Country, Product 
HAVING AVG(Manufacturing_Price) > 3;


--## Super-Advanced Questions

--- 1. Items with same vendor_name as Item_Id 1
---
SELECT item_description, bottle_price 
FROM ITEMS_TABLE 
WHERE vendor_name = (
    SELECT vendor_name 
    FROM ITEMS_TABLE 
    WHERE Item_Id = 1
);


--- 2. Stored procedure for bottle_price greater than given value
---
CREATE PROCEDURE GetItemsByPrice
    @MinPrice DECIMAL(10,2)
AS
BEGIN
    SELECT * FROM ITEMS_TABLE 
    WHERE bottle_price > @MinPrice;
END;


--- 3. Stored procedure to insert new record
---
CREATE PROCEDURE InsertProductSales
    @Product_Id INT,
    @Country VARCHAR(100),
    @Product VARCHAR(100),
    @Units_Sold DECIMAL(10,2),
    @Manufacturing_Price DECIMAL(10,2),
    @Sale_Price DECIMAL(10,2),
    @Date DATE,
    @Month_Name VARCHAR(20),
    @Year INT,
    @COGS DECIMAL(10,2)
AS
BEGIN
    INSERT INTO PRODUCT_TABLE (Product_Id, Country, Product, Units_Sold, Manufacturing_Price, Sale_Price, Gross_Sales, Date, Month_Name, Year, COGS, Profit)
    VALUES (@Product_Id, @Country, @Product, @Units_Sold, @Manufacturing_Price, @Sale_Price, 
            (@Units_Sold * @Sale_Price), @Date, @Month_Name, @Year, @COGS, 
            ((@Units_Sold * @Sale_Price) - @COGS));
END;


--- 4. Trigger to update Gross_Sales automatically
---
CREATE TRIGGER UpdateGrossSales
ON PRODUCT_TABLE
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Units_Sold) OR UPDATE(Sale_Price)
    BEGIN
        UPDATE PRODUCT_TABLE 
        SET Gross_Sales = Units_Sold * Sale_Price,
            Profit = (Units_Sold * Sale_Price) - COGS
        WHERE Product_Id IN (SELECT Product_Id FROM inserted);
    END
END;


--- 5. Find items containing "Whisky" (case insensitive)
---
SELECT item_description 
FROM ITEMS_TABLE 
WHERE LOWER(item_description) LIKE '%whisky%';


--- 6. Country and Product where Profit > average Profit
---
SELECT Country, Product, Profit 
FROM PRODUCT_TABLE 
WHERE Profit > (SELECT AVG(Profit) FROM PRODUCT_TABLE);


--- 7. Join tables on common field
---
SELECT i.item_description, i.vendor_name, p.Country, p.Product, p.Gross_Sales 
FROM ITEMS_TABLE i 
INNER JOIN PRODUCT_TABLE p ON i.vendor_nos = p.Product_Id;


--- 8. Combine item_description and vendor_name
---
SELECT CONCAT(item_description, ' - ', vendor_name) AS Combined_Description 
FROM ITEMS_TABLE;


--- 9. Display bottle_price rounded to one decimal place
---
SELECT item_description, ROUND(bottle_price, 1) AS Rounded_Price 
FROM ITEMS_TABLE;


--- 10. Calculate days between current date and Date field
---
SELECT Product_Id, Country, Date, 
       DATEDIFF(DAY, Date, GETDATE()) AS Days_Since_Sale 
FROM PRODUCT_TABLE;

