--View to retrieve product details along with their category names:

CREATE VIEW ProductDetails AS
SELECT p.ProductID, p.Name, p.Description, p.Price, c.Name AS Category
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID;

SELECT *FROM ProductDetails

--View to calculate the total amount spent by each user:

CREATE VIEW TotalSpentByUser AS
SELECT o.UserID, u.Username, SUM(p.Amount) AS TotalSpent
FROM Orders o
JOIN Payments p ON o.OrderID = p.OrderID
JOIN Users u ON o.UserID = u.UserID
GROUP BY o.UserID, u.Username;

SELECT *FROM TotalSpentByUser;

--User Orders View:
CREATE VIEW UserOrders AS
SELECT o.OrderID, o.UserID, o.OrderDate, o.Status, SUM(p.Amount) AS TotalAmountSpent
FROM Orders o
JOIN Payments p ON o.OrderID = p.OrderID
GROUP BY o.OrderID, o.UserID, o.OrderDate, o.Status;

SELECT *FROM UserOrders;

--Product Reviews View:
CREATE VIEW ProductReviews AS
SELECT r.ProductID, p.Name AS ProductName, r.UserID, u.Username, r.Rating, r.Comment
FROM Reviews r
JOIN Products p ON r.ProductID = p.ProductID
JOIN Users u ON r.UserID = u.UserID;

SELECT *FROM ProductReviews;

--Product Inventory View:
CREATE VIEW ProductInventory AS
SELECT p.ProductID, p.Name AS ProductName, p.InventoryQuantity
FROM Products p;

SELECT *FROM ProductInventory;

--User Cart View:
CREATE VIEW UserCart AS
SELECT c.UserID, p.ProductID, p.Name AS ProductName, c.Quantity
FROM Cart c
JOIN Products p ON c.ProductID = p.ProductID;

SELECT *FROM UserCart;

--Trigger to update inventory quantity after an order is placed:
CREATE TRIGGER UpdateInventoryAfterOrder
ON OrderDetails
AFTER INSERT
AS
BEGIN
    UPDATE Products
    SET InventoryQuantity = InventoryQuantity - (SELECT Quantity FROM inserted WHERE ProductID = Products.ProductID)
    WHERE ProductID IN (SELECT ProductID FROM inserted);
END;

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES (1, 1, 2, 1199.98);
SELECT * FROM Products WHERE ProductID = 1;


--Trigger to enforce a maximum discount percentage for coupons:

CREATE TRIGGER MaxDiscountPercentage
ON Coupons
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @MaxDiscount DECIMAL(5, 2) = 50.00;

    INSERT INTO Coupons (Code, Discount, ExpiryDate)
    SELECT 
        i.Code,
        CASE WHEN i.Discount > @MaxDiscount THEN @MaxDiscount ELSE i.Discount END AS Discount,
        i.ExpiryDate
    FROM inserted i;
END;

INSERT INTO Coupons (Code, Discount, ExpiryDate)
VALUES ('BIGSALE', 60.00, '2024-12-31');
SELECT * FROM Coupons WHERE Code = 'BIGSALE';

--Trigger if the product is deleted
CREATE TRIGGER EnforceReferentialIntegrity
ON Products
AFTER DELETE
AS
BEGIN
    DELETE FROM OrderDetails WHERE ProductID IN (SELECT ProductID FROM deleted);
    DELETE FROM Reviews WHERE ProductID IN (SELECT ProductID FROM deleted);
END;

DELETE FROM Products WHERE ProductID = 2;

SELECT * FROM OrderDetails WHERE ProductID = 2;
SELECT * FROM Reviews WHERE ProductID = 2;



--Trigger to Audit Changes to Product Prices:
CREATE TABLE ProductPriceChangeLog (
    ChangeID INT PRIMARY KEY IDENTITY,
    ProductID INT,
    OldPrice DECIMAL(10, 2),
    NewPrice DECIMAL(10, 2),
    ChangeDateTime DATETIME
);

CREATE TRIGGER AuditProductPriceChanges
ON Products
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Price)
    BEGIN
        INSERT INTO ProductPriceChangeLog (ProductID, OldPrice, NewPrice, ChangeDateTime)
        SELECT d.ProductID, d.Price, i.Price, GETDATE()
        FROM deleted d
        JOIN inserted i ON d.ProductID = i.ProductID;
    END
END;

SELECT * FROM ProductPriceChangeLog;
UPDATE Products SET Price = 899.99 WHERE ProductID = 1;
SELECT * FROM ProductPriceChangeLog;















