#superstore#
-- Superstore Sales Analysis Project
-- Objective: Find loss-making categories and regions using SQL
-- Skills: CREATE TABLE, INSERT, GROUP BY, ROUND, ORDER BY, LIMIT
-- Author: Manisha

CREATE TABLE superstore (
  Order_ID VARCHAR(20),
  Category VARCHAR(50),
  Sub_Category VARCHAR(50),
  Sales DECIMAL(10,4),
  Profit DECIMAL(10,4),
  Region VARCHAR(20),
  Product_Name VARCHAR(100)
);

INSERT INTO superstore (Order_ID, Category, Sub_Category, Sales, Profit, Region, Product_Name) VALUES
('ORD-001','Furniture','Bookcases',261.9600,41.9136,'South','Atlantic Metals Mobile 2-Shelf'),
('ORD-002','Furniture','Chairs',731.9400, 219.5820, 'South', 'Hon Deluxe Fabric Upholstered Chair'),
('ORD-003','Office Supplies','Labels', 14.6200,  6.8714, 'West', 'Avery 490 Labels'),
('ORD-004','Furniture','Tables',  957.5775, -383.0310,  'South','Bretford CR4500 Series Slim Folding Table'),
('ORD-005','Office Supplies','Storage', 22.3680, 2.5164,  'South','Fellowes Storage Zip Binder'),
('ORD-006','Furniture','Furnishings', 48.8600,   14.1694, 'West', 'Eldon Fold N Roll Cart System'),
('ORD-007','Office Supplies','Art',  7.2800,  1.9656,  'West',  'Sanford Liquid Accent Tank-Style Highlighters'),
('ORD-008','Technology','Phones',  907.1520,   90.7152,  'West','Cisco SPA 501G IP Phone'),
('ORD-009','Office Supplies','Binders',  18.5040,    5.7825,  'West',  'Cardinal Slant-D Ring Binder'),
('ORD-010','Office Supplies','Appliances', 114.9000,   34.4700,  'West', 'Holmes Replacement Filter for HEPA Air Purifier'),
('ORD-011','Furniture','Tables', 1706.1840,   85.3092, 'West',    'Bevis Steel Folding Table'),
('ORD-012','Technology',      'Phones',   911.4240, 68.3568,  'West', 'GE 30524EE4 Phone'),
('ORD-013','Office Supplies', 'Paper',   15.5520,  5.4432,  'South', 'Xerox 1967'),
('ORD-014','Office Supplies', 'Binders', 407.9760,  132.5922,  'West', 'GBC Binding Covers'),
('ORD-015','Office Supplies', 'Appliances',  68.8100, -123.8580,  'Central', 'Hoover Replacement Belt for Commercial Guardsman'),
('ORD-016','Office Supplies', 'Binders',   2.5440,   -3.8160,  'Central', 'Avery Durable Slant Ring Binder'),
('ORD-017','Office Supplies', 'Storage', 665.8800,   13.3176,  'Central', 'Stur-D-Stor Shelving Unit'),
('ORD-018','Office Supplies', 'Storage',   55.5000,    9.9900,  'West',    'Fellowes Super Stor Zip Binder'),
('ORD-019','Office Supplies', 'Art',  8.5600,    2.4824,  'West','Fiskars Shape Cutter and Templates');

-- in which category finding/checking loss
SELECT 
  Category, 
  ROUND(SUM(Profit), 2) as total_profit
FROM superstore 
GROUP BY Category 
ORDER BY total_profit ASC;


-- Bottom 3 Loss Making Categories
SELECT 
  Category,
  ROUND(SUM(Profit), 2) as total_loss
FROM superstore 
GROUP BY Category 
ORDER BY total_loss ASC 
LIMIT 3;


-- Bottom 3 Loss Making Categories
SELECT 
  Category,
  ROUND(SUM(Profit), 2) as total_loss
FROM superstore 
GROUP BY Category 
ORDER BY total_loss ASC 
LIMIT 3;

-- low  Region
SELECT 
  Region,
  ROUND(SUM(Profit), 2) as region_profit
FROM superstore 
GROUP BY Region 
ORDER BY region_profit ASC 
LIMIT 1;

-- Top 5 Valuable Customers
SELECT 
    'Customer_Name',
    COUNT('Order_ID') AS total_orders,
    ROUND(SUM(Sales), 2) AS total_spent
FROM superstore
GROUP BY 'Customer_Name'
ORDER BY total_spent DESC
LIMIT 5;