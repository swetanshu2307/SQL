-- =====================================================
-- AtliQ Technology Supply Chain Analytics Project
-- Complete SQL Solution for All Tasks
-- =====================================================

-- TASK 1: Database and Table Creation
-- ===================================

-- Q1: Create Database
CREATE DATABASE SupplyChainFinanceManagement;

USE SupplyChainFinanceManagement;

-- Q2: Create Nine Tables

-- 1. dim_customer table
CREATE TABLE dim_customer (
    customer_code VARCHAR(10) PRIMARY KEY,
    customer VARCHAR(100) NOT NULL,
    market VARCHAR(50),
    region VARCHAR(50),
    sub_zone VARCHAR(50),
    channel VARCHAR(50)
);

-- 2. dim_product table
CREATE TABLE dim_product (
    product_code VARCHAR(10) PRIMARY KEY,
    division VARCHAR(50),
    segment VARCHAR(50),
    category VARCHAR(50),
    product VARCHAR(100),
    variant VARCHAR(50)
);

-- 3. fact_forecast_monthly table
CREATE TABLE fact_forecast_monthly (
    date DATE,
    product_code VARCHAR(10),
    customer_code VARCHAR(10),
    forecast_quantity INT,
    PRIMARY KEY (date, product_code, customer_code),
    FOREIGN KEY (product_code) REFERENCES dim_product(product_code),
    FOREIGN KEY (customer_code) REFERENCES dim_customer(customer_code)
);

-- 4. fact_freight_cost table
CREATE TABLE fact_freight_cost (
    market VARCHAR(50),
    fiscal_year INT,
    freight_pct DECIMAL(5,2),
    other_cost_pct DECIMAL(5,2),
    PRIMARY KEY (market, fiscal_year)
);

-- 5. fact_gross_price table
CREATE TABLE fact_gross_price (
    product_code VARCHAR(10),
    fiscal_year INT,
    gross_price DECIMAL(10,2),
    PRIMARY KEY (product_code, fiscal_year),
    FOREIGN KEY (product_code) REFERENCES dim_product(product_code)
);

-- 6. fact_manufacturing_cost table
CREATE TABLE fact_manufacturing_cost (
    product_code VARCHAR(10),
    cost_year INT,
    manufacturing_cost DECIMAL(10,2),
    PRIMARY KEY (product_code, cost_year),
    FOREIGN KEY (product_code) REFERENCES dim_product(product_code)
);

-- 7. fact_post_invoice_deductions table
CREATE TABLE fact_post_invoice_deductions (
    date DATE,
    product_code VARCHAR(10),
    customer_code VARCHAR(10),
    discounts_pct DECIMAL(5,2),
    other_deductions_pct DECIMAL(5,2),
    PRIMARY KEY (date, product_code, customer_code),
    FOREIGN KEY (product_code) REFERENCES dim_product(product_code),
    FOREIGN KEY (customer_code) REFERENCES dim_customer(customer_code)
);

-- 8. fact_pre_invoice_deductions table
CREATE TABLE fact_pre_invoice_deductions (
    customer_code VARCHAR(10),
    fiscal_year INT,
    pre_invoice_discount_pct DECIMAL(5,2),
    PRIMARY KEY (customer_code, fiscal_year),
    FOREIGN KEY (customer_code) REFERENCES dim_customer(customer_code)
);

-- 9. fact_sales_monthly table
CREATE TABLE fact_sales_monthly (
    date DATE,
    product_code VARCHAR(10),
    customer_code VARCHAR(10),
    sold_quantity INT,
    PRIMARY KEY (date, product_code, customer_code),
    FOREIGN KEY (product_code) REFERENCES dim_product(product_code),
    FOREIGN KEY (customer_code) REFERENCES dim_customer(customer_code)
);

-- =====================================================
-- TASK 2: Sample Data Insertion
-- =====================================================

-- Insert sample data for dim_customer
INSERT INTO dim_customer VALUES
('C001', 'Croma', 'India', 'APAC', 'India', 'Brick & Mortar'),
('C002', 'Amazon', 'USA', 'NA', 'USA', 'E-Commerce'),
('C003', 'Flipkart', 'India', 'APAC', 'India', 'E-Commerce'),
('C004', 'Best Buy', 'USA', 'NA', 'USA', 'Brick & Mortar'),
('C005', 'MediaMarkt', 'Germany', 'EU', 'Germany', 'Brick & Mortar');

-- Insert sample data for dim_product
INSERT INTO dim_product VALUES
('P001', 'Peripherals', 'Accessories', 'Mouse', 'AtliQ Mouse Pro', 'Standard'),
('P002', 'Peripherals', 'Accessories', 'Keyboard', 'AtliQ Keyboard Elite', 'Wireless'),
('P003', 'PC', 'Desktop', 'Desktop', 'AtliQ Desktop Pro', 'High-End'),
('P004', 'PC', 'Laptop', 'Laptop', 'AtliQ Laptop Ultra', 'Gaming'),
('P005', 'Peripherals', 'Accessories', 'Printer', 'AtliQ Printer Max', 'Laser');

-- Insert sample data for fact_gross_price
INSERT INTO fact_gross_price VALUES
('P001', 2023, 30.00),
('P002', 2023, 80.00),
('P003', 2023, 800.00),
('P004', 2023, 1200.00),
('P005', 2023, 300.00);

-- Insert sample data for fact_manufacturing_cost
INSERT INTO fact_manufacturing_cost VALUES
('P001', 2023, 20.00),
('P002', 2023, 50.00),
('P003', 2023, 600.00),
('P004', 2023, 900.00),
('P005', 2023, 200.00);

-- Insert sample data for fact_pre_invoice_deductions
INSERT INTO fact_pre_invoice_deductions VALUES
('C001', 2023, 6.67),
('C002', 2023, 5.00),
('C003', 2023, 7.50),
('C004', 2023, 4.00),
('C005', 2023, 6.00);

-- Insert sample data for fact_sales_monthly
INSERT INTO fact_sales_monthly VALUES
('2023-01-15', 'P001', 'C001', 100),
('2023-01-15', 'P002', 'C002', 50),
('2023-02-15', 'P001', 'C001', 120),
('2023-02-15', 'P003', 'C003', 10),
('2023-03-15', 'P004', 'C004', 25);

-- Insert sample data for fact_forecast_monthly
INSERT INTO fact_forecast_monthly VALUES
('2023-01-15', 'P001', 'C001', 110),
('2023-01-15', 'P002', 'C002', 60),
('2023-02-15', 'P001', 'C001', 130),
('2023-02-15', 'P003', 'C003', 12),
('2023-03-15', 'P004', 'C004', 30);

-- Insert sample data for fact_freight_cost
INSERT INTO fact_freight_cost VALUES
('India', 2023, 5.00, 2.50),
('USA', 2023, 7.50, 3.00),
('Germany', 2023, 6.00, 2.00);

-- Insert sample data for fact_post_invoice_deductions
INSERT INTO fact_post_invoice_deductions VALUES
('2023-01-15', 'P001', 'C001', 10.00, 2.00),
('2023-01-15', 'P002', 'C002', 8.00, 1.50),
('2023-02-15', 'P001', 'C001', 12.00, 2.50),
('2023-02-15', 'P003', 'C003', 15.00, 3.00),
('2023-03-15', 'P004', 'C004', 9.00, 1.00);

-- =====================================================
-- TASK 3: Fiscal Year Function and Gross Sales Report
-- =====================================================

-- Q1: Fiscal Year Function
-- AtliQ's fiscal year runs from September to August
-- Function to get fiscal year from calendar date
CREATE FUNCTION get_fiscal_year(@calendar_date DATE)
RETURNS INT
AS
BEGIN
    DECLARE @fiscal_year INT;
    
    IF MONTH(@calendar_date) >= 9
        SET @fiscal_year = YEAR(@calendar_date) + 1;
    ELSE
        SET @fiscal_year = YEAR(@calendar_date);
    
    RETURN @fiscal_year;
END;

-- Test the function with '2023-07-15'
-- SELECT dbo.get_fiscal_year('2023-07-15') AS fiscal_year;
-- This will return 2023 because July is before September

-- Q2: Monthly Product Transactions Report
SELECT 
    fsm.date,
    fsm.product_code,
    dp.product AS product_name,
    dp.variant,
    fsm.sold_quantity,
    fgp.gross_price,
    (fsm.sold_quantity * fgp.gross_price) AS gross_price_total
FROM fact_sales_monthly fsm
JOIN dim_product dp ON fsm.product_code = dp.product_code
JOIN fact_gross_price fgp ON fsm.product_code = fgp.product_code
WHERE fsm.customer_code = 'C001'  -- Filter by customer code
  AND dbo.get_fiscal_year(fsm.date) = 2023  -- Filter by fiscal year
ORDER BY fsm.date, fsm.product_code;

-- =====================================================
-- TASK 4: Comprehensive Analysis Queries
-- =====================================================

-- 1. Sales Trend Analysis - Monthly sales trend for each product
SELECT 
    dp.product,
    YEAR(fsm.date) AS year,
    MONTH(fsm.date) AS month,
    SUM(fsm.sold_quantity) AS total_quantity
FROM fact_sales_monthly fsm
JOIN dim_product dp ON fsm.product_code = dp.product_code
GROUP BY dp.product, YEAR(fsm.date), MONTH(fsm.date)
ORDER BY dp.product, year, month;

-- 2. Customer Segmentation - Customer contribution to sales revenue
SELECT 
    dc.customer,
    dc.channel,
    SUM(fsm.sold_quantity * fgp.gross_price) AS total_revenue,
    COUNT(DISTINCT fsm.date) AS purchase_frequency
FROM fact_sales_monthly fsm
JOIN dim_customer dc ON fsm.customer_code = dc.customer_code
JOIN fact_gross_price fgp ON fsm.product_code = fgp.product_code
GROUP BY dc.customer, dc.channel
ORDER BY total_revenue DESC;

-- 3. Product Performance Comparison
SELECT 
    dp.product,
    dp.category,
    SUM(fsm.sold_quantity) AS total_quantity_sold,
    SUM(fsm.sold_quantity * fgp.gross_price) AS total_revenue,
    AVG(fgp.gross_price) AS avg_gross_price
FROM fact_sales_monthly fsm
JOIN dim_product dp ON fsm.product_code = dp.product_code
JOIN fact_gross_price fgp ON fsm.product_code = fgp.product_code
GROUP BY dp.product, dp.category
ORDER BY total_revenue DESC;

-- 4. Market Expansion Opportunities - Forecast demand growth
SELECT 
    dc.market,
    dc.region,
    SUM(ffm.forecast_quantity) AS total_forecast_demand,
    COUNT(DISTINCT ffm.product_code) AS product_diversity
FROM fact_forecast_monthly ffm
JOIN dim_customer dc ON ffm.customer_code = dc.customer_code
GROUP BY dc.market, dc.region
ORDER BY total_forecast_demand DESC;

-- 5. Cost Analysis - Profitability by product
SELECT 
    dp.product,
    fgp.gross_price,
    fmc.manufacturing_cost,
    (fgp.gross_price - fmc.manufacturing_cost) AS profit_margin,
    ((fgp.gross_price - fmc.manufacturing_cost) / fgp.gross_price * 100) AS profit_margin_pct
FROM dim_product dp
JOIN fact_gross_price fgp ON dp.product_code = fgp.product_code
JOIN fact_manufacturing_cost fmc ON dp.product_code = fmc.product_code
WHERE fgp.fiscal_year = fmc.cost_year
ORDER BY profit_margin_pct DESC;

-- 6. Discount Impact Analysis
SELECT 
    dc.customer,
    fpid.pre_invoice_discount_pct,
    SUM(fsm.sold_quantity * fgp.gross_price) AS gross_revenue,
    SUM(fsm.sold_quantity * fgp.gross_price * fpid.pre_invoice_discount_pct / 100) AS discount_amount
FROM fact_sales_monthly fsm
JOIN dim_customer dc ON fsm.customer_code = dc.customer_code
JOIN fact_gross_price fgp ON fsm.product_code = fgp.product_code
JOIN fact_pre_invoice_deductions fpid ON fsm.customer_code = fpid.customer_code
GROUP BY dc.customer, fpid.pre_invoice_discount_pct
ORDER BY discount_amount DESC;

-- 7. Market-specific Freight Costs
SELECT 
    market,
    fiscal_year,
    freight_pct,
    other_cost_pct,
    (freight_pct + other_cost_pct) AS total_logistics_cost_pct
FROM fact_freight_cost
ORDER BY market, fiscal_year;

-- 8. Seasonal Sales Patterns
SELECT 
    MONTH(fsm.date) AS month,
    DATENAME(MONTH, fsm.date) AS month_name,
    SUM(fsm.sold_quantity) AS total_quantity,
    SUM(fsm.sold_quantity * fgp.gross_price) AS total_revenue
FROM fact_sales_monthly fsm
JOIN fact_gross_price fgp ON fsm.product_code = fgp.product_code
GROUP BY MONTH(fsm.date), DATENAME(MONTH, fsm.date)
ORDER BY month;

-- =====================================================
-- TASK 5: Advanced SQL Features
-- =====================================================

-- 1. User-defined function for total forecasted quantity
CREATE FUNCTION get_total_forecast(@product_code VARCHAR(10), @fiscal_year INT)
RETURNS INT
AS
BEGIN
    DECLARE @total_forecast INT;
    
    SELECT @total_forecast = SUM(forecast_quantity)
    FROM fact_forecast_monthly
    WHERE product_code = @product_code
      AND dbo.get_fiscal_year(date) = @fiscal_year;
    
    RETURN ISNULL(@total_forecast, 0);
END;

-- 2. Customers exceeding average monthly sales
WITH avg_sales AS (
    SELECT AVG(sold_quantity) AS avg_quantity
    FROM fact_sales_monthly
)
SELECT DISTINCT dc.customer, dc.customer_code
FROM fact_sales_monthly fsm
JOIN dim_customer dc ON fsm.customer_code = dc.customer_code
CROSS JOIN avg_sales
WHERE fsm.sold_quantity > avg_sales.avg_quantity;

-- 3. Stored procedure to update gross price
CREATE PROCEDURE update_gross_price
    @product_code VARCHAR(10),
    @fiscal_year INT,
    @new_gross_price DECIMAL(10,2)
AS
BEGIN
    UPDATE fact_gross_price
    SET gross_price = @new_gross_price
    WHERE product_code = @product_code
      AND fiscal_year = @fiscal_year;
END;

-- 4. Audit log table and trigger
CREATE TABLE audit_log (
    audit_id INT IDENTITY(1,1) PRIMARY KEY,
    table_name VARCHAR(50),
    action_type VARCHAR(10),
    record_id VARCHAR(50),
    timestamp DATETIME DEFAULT GETDATE(),
    user_name VARCHAR(50) DEFAULT USER_NAME()
);

CREATE TRIGGER trg_sales_audit
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN
    INSERT INTO audit_log (table_name, action_type, record_id)
    SELECT 'fact_sales_monthly', 'INSERT', 
           CONCAT(CONVERT(VARCHAR, date), '-', product_code, '-', customer_code)
    FROM inserted;
END;

-- 5. Window function to rank products by monthly sales
SELECT 
    dp.product,
    fsm.date,
    fsm.sold_quantity,
    dbo.get_fiscal_year(fsm.date) AS fiscal_year,
    RANK() OVER (PARTITION BY dbo.get_fiscal_year(fsm.date) ORDER BY fsm.sold_quantity DESC) AS sales_rank
FROM fact_sales_monthly fsm
JOIN dim_product dp ON fsm.product_code = dp.product_code
ORDER BY fiscal_year, sales_rank;

-- 6. STRING_AGG for customer concatenation
SELECT 
    dp.product,
    STRING_AGG(dc.customer, ', ') AS customers
FROM fact_sales_monthly fsm
JOIN dim_product dp ON fsm.product_code = dp.product_code
JOIN dim_customer dc ON fsm.customer_code = dc.customer_code
WHERE fsm.date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY dp.product;

-- 7. Function for total manufacturing cost over years
CREATE FUNCTION get_manufacturing_cost_range(@product_code VARCHAR(10), @start_year INT, @end_year INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @total_cost DECIMAL(10,2);
    
    SELECT @total_cost = SUM(manufacturing_cost)
    FROM fact_manufacturing_cost
    WHERE product_code = @product_code
      AND cost_year BETWEEN @start_year AND @end_year;
    
    RETURN ISNULL(@total_cost, 0);
END;

-- 8. Inventory constraint trigger (conceptual - requires inventory table)
-- This would require an inventory table to be fully implemented

CREATE TABLE inventory (
    product_code VARCHAR(10) PRIMARY KEY,
    available_quantity INT
);

CREATE TRIGGER tr_inventory_check
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM inserted i
        JOIN inventory inv ON i.product_code = inv.product_code
        WHERE i.sold_quantity > inv.available_quantity
    )
    BEGIN
        RAISERROR('Insufficient inventory for the sale', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- 9. LEAD/LAG for month-over-month comparison
SELECT 
    product_code,
    date,
    sold_quantity,
    LAG(sold_quantity) OVER (PARTITION BY product_code ORDER BY date) as previous_month_sales,
    (sold_quantity - LAG(sold_quantity) OVER (PARTITION BY product_code ORDER BY date)) as sales_change
FROM fact_sales_monthly
ORDER BY product_code, date;
-- 10. Top-selling products by market
SELECT 
    market,
    product,
    total_quantity,
    market_rank
FROM (
    SELECT 
        dc.market,
        dp.product,
        SUM(fsm.sold_quantity) AS total_quantity,
        ROW_NUMBER() OVER (PARTITION BY dc.market ORDER BY SUM(fsm.sold_quantity) DESC) AS market_rank
    FROM fact_sales_monthly fsm
    JOIN dim_customer dc ON fsm.customer_code = dc.customer_code
    JOIN dim_product dp ON fsm.product_code = dp.product_code
    GROUP BY dc.market, dp.product
) ranked
WHERE market_rank <= 3;

-- =====================================================
-- TASK 6: Forecast Accuracy Analysis with Pivot
-- =====================================================

-- Forecast Accuracy Analysis
WITH forecast_vs_actual AS (
    SELECT 
        f.product_code,
        dbo.get_fiscal_year(f.date) as fiscal_year,
        DATENAME(MONTH, f.date) as month_name,
        MONTH(f.date) as month_num,
        SUM(f.forecast_quantity) as forecast_qty,
        ISNULL(SUM(s.sold_quantity), 0) as actual_qty
    FROM fact_forecast_monthly f
    LEFT JOIN fact_sales_monthly s ON f.product_code = s.product_code 
                                   AND f.customer_code = s.customer_code
                                   AND f.date = s.date
    GROUP BY f.product_code, dbo.get_fiscal_year(f.date), DATENAME(MONTH, f.date), MONTH(f.date)
),
accuracy_calc AS (
    SELECT 
        product_code,
        fiscal_year,
        month_name,
        month_num,
        forecast_qty,
        actual_qty,
        CASE 
            WHEN forecast_qty > 0 
            THEN ROUND((CAST(actual_qty AS FLOAT) / forecast_qty) * 100, 2)
            ELSE 0 
        END as accuracy_percentage,
        CASE 
            WHEN forecast_qty > 0 
            THEN ROUND((CAST(actual_qty AS FLOAT) / forecast_qty) * 100, 2)
            ELSE 0 
        END - 100 as variance_percentage
    FROM forecast_vs_actual
)
SELECT 
    product_code,
    fiscal_year,
    [January], [February], [March], [April], [May], [June],
    [July], [August], [September], [October], [November], [December]
FROM (
    SELECT 
        product_code,
        fiscal_year,
        month_name,
        CONCAT(forecast_qty, ' (', actual_qty, ') - ', accuracy_percentage, '%') as forecast_actual_accuracy
    FROM accuracy_calc
) as source_data
PIVOT (
    MAX(forecast_actual_accuracy)
    FOR month_name IN ([January], [February], [March], [April], [May], [June],
                       [July], [August], [September], [October], [November], [December])
) as pivot_table
ORDER BY product_code, fiscal_year;

-- Forecast Accuracy Summary
SELECT 
    product,
    fiscal_year,
    AVG(forecast_accuracy_pct) AS avg_forecast_accuracy,
    MIN(forecast_accuracy_pct) AS min_accuracy,
    MAX(forecast_accuracy_pct) AS max_accuracy,
    COUNT(*) AS months_with_data
FROM (
    SELECT 
        dp.product,
        dbo.get_fiscal_year(ffm.date) AS fiscal_year,
        CASE 
            WHEN SUM(ffm.forecast_quantity) = 0 THEN 0
            ELSE (SUM(ISNULL(fsm.sold_quantity, 0)) * 100.0 / SUM(ffm.forecast_quantity))
        END AS forecast_accuracy_pct
    FROM fact_forecast_monthly ffm
    JOIN dim_product dp ON ffm.product_code = dp.product_code
    LEFT JOIN fact_sales_monthly fsm ON ffm.product_code = fsm.product_code 
        AND ffm.customer_code = fsm.customer_code 
        AND ffm.date = fsm.date
    GROUP BY dp.product, dbo.get_fiscal_year(ffm.date), MONTH(ffm.date)
) accuracy_data
GROUP BY product, fiscal_year
ORDER BY product, fiscal_year;



-- =====================================================
-- Additional Utility Views for Dashboard
-- =====================================================

-- Sales Performance Dashboard View

SELECT 
    dp.product,
    dp.category,
    dc.customer,
    dc.market,
    dc.channel,
    fsm.date,
    fsm.sold_quantity,
    fgp.gross_price,
    (fsm.sold_quantity * fgp.gross_price) AS gross_revenue,
    fmc.manufacturing_cost,
    (fsm.sold_quantity * (fgp.gross_price - fmc.manufacturing_cost)) AS gross_profit
FROM fact_sales_monthly fsm
JOIN dim_product dp ON fsm.product_code = dp.product_code
JOIN dim_customer dc ON fsm.customer_code = dc.customer_code
JOIN fact_gross_price fgp ON fsm.product_code = fgp.product_code
JOIN fact_manufacturing_cost fmc ON fsm.product_code = fmc.product_code
WHERE fgp.fiscal_year = fmc.cost_year;

