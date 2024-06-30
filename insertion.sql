--data insertion---
INSERT INTO Users (Username, Email, Password, UserType)
VALUES 
    ('AliKhan123', 'alikhan@example.com', 'password123', 'customer'),
    ('FatimaAhmed', 'fatimaahmed@example.com', 'password456', 'customer'),
    ('UsmanAli', 'usmanali@example.com', 'password789', 'administrator'),
    ('SaraHussain', 'sarahu@example.com', 'sara123', 'customer'),
    ('AhmedRaza', 'ahmedraza@example.com', 'ahmed456', 'customer'),
    ('AishaMalik', 'aishamalik@example.com', 'aisha789', 'customer'),
    ('ZainabAslam', 'zainabaslam@example.com', 'zainab123', 'administrator'),
    ('ImranKhan', 'imrankhan@example.com', 'imran456', 'customer'),
    ('HinaAkhtar', 'hinaakhtar@example.com', 'hina789', 'customer'),
    ('KamranIqbal', 'kamraniqbal@example.com', 'kamran123', 'administrator');

INSERT INTO Categories (Name)
VALUES 
    ('Electronics'),
    ('Computers'),
    ('Clothing'),
    ('Books'),
    ('Home Appliances'),
    ('Sports'),
    ('Beauty'),
    ('Toys'),
    ('Furniture'),
    ('Jewelry');

INSERT INTO Products (Name, Description, Price, CategoryID, InventoryQuantity)
VALUES 
    ('Smartphone X', 'A high-performance smartphone with advanced features.', 799.99, 1, 50),
    ('Laptop Pro', 'A powerful laptop for professional use.', 1499.99, 2, 30),
    ('Tablet Plus', 'A portable tablet with a large screen for entertainment.', 399.99, 1, 20),
    ('Camera Deluxe', 'A professional-grade camera with high-resolution imaging.', 1299.99, 4, 15),
    ('Headphones HD', 'High-definition headphones for immersive audio experience.', 199.99, 3, 100),
    ('Smartwatch Elite', 'A premium smartwatch with health and fitness tracking.', 299.99, 1, 40),
    ('Speaker Set', 'A set of high-quality wireless speakers for home entertainment.', 499.99, 3, 25),
    ('Gaming Console', 'A next-generation gaming console for immersive gameplay.', 599.99, 1, 10),
    ('Printer Pro', 'A professional-grade printer for high-quality printing.', 399.99, 2, 15),
    ('Wireless Router', 'A high-speed wireless router for seamless internet connectivity.', 79.99, 1, 50);

SELECT *FROM Products 
INSERT INTO Addresses (UserID, AddressLine1, AddressLine2, City, State, ZipCode, Country)
VALUES
    (1, 'House No. 123, Street 456', 'Apartment 101', 'Karachi', 'Sindh', '74000', 'Pakistan'),
    (2, 'Apartment 789, Block C', NULL, 'Lahore', 'Punjab', '54000', 'Pakistan'),
    (3, 'Villa 101, Phase 2', 'Street 7', 'Islamabad', 'Islamabad Capital Territory', '44000', 'Pakistan'),
    (4, 'Flat No. 5, Plaza Towers', NULL, 'Karachi', 'Sindh', '74000', 'Pakistan'),
    (5, 'House No. 21, Street 14', 'Block B', 'Lahore', 'Punjab', '54000', 'Pakistan'),
    (6, 'Apartment 403, Sky Heights', NULL, 'Islamabad', 'Islamabad Capital Territory', '44000', 'Pakistan'),
    (7, 'Villa 7, Phase 3', 'Street 5', 'Karachi', 'Sindh', '74000', 'Pakistan'),
    (8, 'Flat No. 8, Pearl Towers', NULL, 'Lahore', 'Punjab', '54000', 'Pakistan'),
    (9, 'House No. 15, Street 9', 'Block C', 'Islamabad', 'Islamabad Capital Territory', '44000', 'Pakistan'),
    (10, 'Apartment 602, Sea View', NULL, 'Karachi', 'Sindh', '74000', 'Pakistan');

INSERT INTO Orders (UserID, Status, AddressID)
VALUES
    (1, 'pending', 1),
    (2, 'shipped', 2),
    (3, 'delivered', 3),
    (4, 'pending', 4),
    (5, 'shipped', 5),
    (6, 'delivered', 6),
    (7, 'pending', 7),
    (8, 'shipped', 8),
    (9, 'delivered', 9),
    (10, 'pending', 10);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES
    (1, 1, 2, 1199.98),
    (2, 2, 1, 999.99),
    (3, 3, 3, 2399.97),
    (4, 4, 1, 799.99),
    (5, 5, 2, 399.98),
    (6, 6, 1, 199.99),
    (7, 7, 4, 319.96),
    (8, 8, 1, 399.99),
    (9, 9, 2, 99.98),
    (10, 10, 3, 89.97);

INSERT INTO Payments (OrderID, Amount)
VALUES
    (1, 1199.98),
    (2, 999.99),
    (3, 2399.97),
    (4, 799.99),
    (5, 399.98),
    (6, 199.99),
    (7, 319.96),
    (8, 399.99),
    (9, 99.98),
    (10, 89.97);

INSERT INTO Reviews (ProductID, UserID, Rating, Comment)
VALUES
    (1, 1, 5, 'Great smartphone, excellent camera quality.'),
    (2, 2, 4, 'Good laptop, fast performance but battery life could be better.'),
    (3, 3, 4, 'The tablet is very user-friendly and has a sleek design.'),
    (4, 4, 5, 'Amazing camera! Captures stunning images with great clarity.'),
    (5, 5, 3, 'Decent headphones, comfortable to wear but sound quality could be improved.'),
    (6, 6, 4, 'Love my new smartwatch! It tracks my workouts accurately.'),
    (7, 7, 5, 'These speakers have excellent sound quality!'),
    (8, 8, 3, 'Good monitor for everyday use, but the colors could be more vibrant.'),
    (9, 9, 4, 'The keyboard feels nice to type on, keys are responsive.'),
    (10, 10, 5, 'The mouse is ergonomic and fits comfortably in hand.');

INSERT INTO Cart (UserID, ProductID, Quantity)
VALUES
    (1, 1, 2),
    (2, 2, 1),
    (3, 3, 3),
    (4, 4, 1),
    (5, 5, 2),
    (6, 6, 1),
    (7, 7, 4),
    (8, 8, 1),
    (9, 9, 2),
    (10, 10, 3);

INSERT INTO Coupons (Code, Discount, ExpiryDate)
VALUES
    ('SAVE10', 10.00, '2024-06-30'),
    ('FREESHIP', 5.00, '2024-05-31'),
    ('GET15OFF', 15.00, '2024-07-15'),
    ('WELCOME20', 20.00, '2024-06-15'),
    ('HOLIDAY25', 25.00, '2024-12-31'),
    ('FLASHSALE10', 10.00, '2024-05-15'),
    ('SUMMER30', 30.00, '2024-08-31'),
    ('BACKTOSCHOOL15', 15.00, '2024-09-30'),
    ('AUTUMN20', 20.00, '2024-10-31'),
    ('WINTER50', 50.00, '2024-12-21');

INSERT INTO Inventory (ProductID, StockQuantity)
VALUES
    (1, 100),
    (2, 50),
    (3, 75),
    (4, 30),
    (5, 120),
    (6, 50),
    (7, 80),
    (8, 40),
    (9, 100),
    (10, 150);






