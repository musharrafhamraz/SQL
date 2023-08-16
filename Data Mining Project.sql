SELECT * FROM database1.`online retail`;

-- Beginner Queries

-- What is the distribution of order values across all customers in the dataset?
SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalOrderValue
FROM database1.`online retail`
GROUP BY CustomerID
ORDER BY TotalOrderValue DESC;

-- How many unique products has each customer purchased?
SELECT CustomerID, COUNT(DISTINCT StockCode) AS UniqueProductCount
FROM database1.`online retail`
GROUP BY CustomerID;

-- Which customers have only made a single purchase from the company?
SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS PurchaseCount
FROM database1.`online retail`
GROUP BY CustomerID
HAVING PurchaseCount = 1;

-- Which products are most commonly purchased together by customers in the dataset?
SELECT A.StockCode AS ProductA, B.StockCode AS ProductB, COUNT(*) AS PurchaseCount
FROM database1.`online retail` A
JOIN database1.`online retail` B ON A.InvoiceNo = B.InvoiceNo AND A.StockCode < B.StockCode
GROUP BY ProductA, ProductB
ORDER BY PurchaseCount DESC
LIMIT 10;

-- Advance Queries
-- Group customers into segments based on their purchase frequency, such as high, medium, and low frequency customers.
-- This can help you identify your most loyal customers and those who need more attention.
SELECT CustomerID,
       CASE
           WHEN PurchaseFrequency >= 10 THEN 'High Frequency'
           WHEN PurchaseFrequency >= 5 THEN 'Medium Frequency'
           ELSE 'Low Frequency'
       END AS PurchaseSegment
FROM (
    SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS PurchaseFrequency
    FROM database1.`online retail`
    GROUP BY CustomerID
) AS CustomerPurchaseFrequency;

-- Calculate the average order value for each country to identify where your most valuable customers are located.
SELECT Country, AVG(Quantity * UnitPrice) AS AvgOrderValue
FROM database1.`online retail`
GROUP BY Country
ORDER BY AvgOrderValue DESC;

-- Identify customers who haven't made a purchase in a specific period (e.g., last 6 months) to assess churn. 
SELECT CustomerID
FROM database1.`online retail`
WHERE InvoiceDate <= NOW() - INTERVAL 6 MONTH
GROUP BY CustomerID;

-- Determine which products are often purchased together by calculating the correlation between product purchases.
SELECT A.StockCode AS pa, B.StockCode AS pb, 
       COUNT(*) AS PurchaseCount,
       CORR(A.Quantity, B.Quantity) AS Correlation
FROM database1.`online retail` A
JOIN database1.`online retail` B ON A.InvoiceNo = B.InvoiceNo AND A.StockCode < B.StockCode
GROUP BY pa, pb
HAVING PurchaseCount > 10
ORDER BY Correlation DESC
LIMIT 10;
 
-- Explore trends in customer behavior over time, such as monthly or quarterly sales patterns.
SELECT YEAR(InvoiceDate) AS Year, MONTH(InvoiceDate) AS Month, 
       COUNT(DISTINCT CustomerID) AS UniqueCustomers,
       SUM(Quantity * UnitPrice) AS TotalRevenue
FROM database1.`online retail`
GROUP BY Year, Month
ORDER BY Year, Month;






