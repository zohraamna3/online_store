CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Password VARCHAR(100) NOT NULL,
    UserType VARCHAR(20) NOT NULL CHECK (UserType IN ('customer', 'administrator'))
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(50) NOT NULL
);
SELECT *FROM Categories

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    CategoryID INT,
    InventoryQuantity INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
CREATE TABLE Addresses (
    AddressID INT PRIMARY KEY IDENTITY,
    UserID INT,
    AddressLine1 VARCHAR(100),
    AddressLine2 VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(20),
    Country VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY,
    UserID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('pending', 'shipped', 'delivered')),
    AddressID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (AddressID) REFERENCES Addresses(AddressID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY,
    OrderID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY IDENTITY,
    ProductID INT,
    UserID INT,
    Rating INT,
    Comment TEXT,
    ReviewDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Cart (
    CartID INT PRIMARY KEY IDENTITY,
    UserID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
CREATE TABLE Coupons (
    CouponID INT PRIMARY KEY IDENTITY,
    Code VARCHAR(20) UNIQUE,
    Discount DECIMAL(5, 2) NOT NULL,
    ExpiryDate DATE
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY,
    ProductID INT UNIQUE,
    StockQuantity INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);



