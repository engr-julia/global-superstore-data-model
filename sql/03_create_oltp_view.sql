USE global_super_store;

CREATE OR REPLACE VIEW OrderSummary AS
SELECT o.OrderID, o.OrderDate, c.FullName AS CustomerName,
       p.ProductName, p.Category, p.Subcategory,
       a.City, a.State, a.Country,
       s.ShipMode, s.ShipCost,
       o.Quantity, o.Sales, o.Discount, o.Profit
FROM Orders o
JOIN Customers c ON c.CustomerID = o.CustomerID
JOIN Products p ON p.ProductID = o.ProductID
JOIN Shipping s ON s.ShipID = o.ShipID
JOIN DeliveryAddress a ON a.AddressID = s.AddressID;

-- Quick check:
-- SELECT * FROM OrderSummary LIMIT 10;
