-- Create Category Table
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(50) NOT NULL
);

-- Create Product Table
CREATE TABLE Product (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100) NOT NULL,
    CategoryID INT FOREIGN KEY REFERENCES Category(CategoryID),
    Price DECIMAL(10, 2) NOT NULL,
    Description NVARCHAR(MAX),
    StockQuantity INT NOT NULL
);

-- Create Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Password NVARCHAR(50) NOT NULL,
    Address NVARCHAR(MAX) NOT NULL
);
-- Create Order Table
CREATE TABLE OrderNo (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
    TotalAmount DECIMAL(10, 2) NOT NULL
);

-- Create OrderDetail Table
CREATE TABLE OrderDetail (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES OrderNo(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Product(ProductID),
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL
);

-- Indexing Product Table
CREATE INDEX idx_Product_CategoryID ON Product(CategoryID);
CREATE INDEX idx_Order_CustomerID ON [OrderNo](CustomerID);
CREATE INDEX idx_OrderDetail_ProductID ON OrderDetail(ProductID);
CREATE INDEX idx_OrderDetail_OrderID ON OrderDetail(OrderID);

use master;

-- Create Category Table
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(50) NOT NULL
);

-- Create Product Table
CREATE TABLE Product (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100) NOT NULL,
    CategoryID INT FOREIGN KEY REFERENCES Category(CategoryID),
    Price DECIMAL(10, 2) NOT NULL,
    Description NVARCHAR(MAX),
    StockQuantity INT NOT NULL
);

-- Create Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Password NVARCHAR(50) NOT NULL,
    Address NVARCHAR(MAX) NOT NULL
);

-- Create Order Table
CREATE TABLE Order (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
    TotalAmount DECIMAL(10, 2) NOT NULL
);

-- Create OrderDetail Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES OrderNo(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Product(ProductID),
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL
);

-- Insert Categories
INSERT INTO Category (CategoryName) VALUES ('Electronics');
INSERT INTO Category (CategoryName) VALUES ('Clothing');
INSERT INTO Category (CategoryName) VALUES ('Books');

-- Insert Products
INSERT INTO Product (ProductName, CategoryID, Price, Description, StockQuantity) VALUES ('Laptop', 1, 999.99, 'High-performance laptop', 50);
INSERT INTO Product (ProductName, CategoryID, Price, Description, StockQuantity) VALUES ('T-shirt', 2, 19.99, '100% cotton T-shirt', 100);
INSERT INTO Product (ProductName, CategoryID, Price, Description, StockQuantity) VALUES ('Database Design Book', 3, 29.99, 'Comprehensive guide to database design', 30);

-- Insert Customer
INSERT INTO Customer (FirstName, LastName, Email, Password, Address) VALUES ('John', 'Doe', 'john@example.com', 'password123', '123 Main St, City, Country');

-- Insert Order
INSERT INTO [OrderNo] (OrderDate, CustomerID, TotalAmount) VALUES (GETDATE(), 1, 999.99);

-- Insert Order Details
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, UnitPrice) VALUES (1, 1, 1, 999.99);

-- Retrieve all products
SELECT * FROM Product;

-- Retrieve products in a specific category
SELECT * FROM Product WHERE CategoryID = 1;

-- Retrieve product details with category name
SELECT p.ProductID, p.ProductName, p.Price, p.Description, p.StockQuantity, c.CategoryName
FROM Product p
INNER JOIN Category c ON p.CategoryID = c.CategoryID;

-- Insert new product
INSERT INTO Product (ProductName, CategoryID, Price, Description, StockQuantity) 
VALUES ('Smartphone', 1, 699.99, 'Latest smartphone model', 100);

-- Update product price
UPDATE Product
SET Price = 799.99
WHERE ProductID = 1;

-- Delete product
DELETE FROM Product WHERE ProductID = 1;

use master;
-- User Authentication
CREATE PROCEDURE AuthenticateUser
    @Email NVARCHAR(100),
    @Password NVARCHAR(50)
AS
BEGIN
    SELECT * FROM Customer WHERE Email = @Email AND Password = @Password;
END;

-- Test Authentication
EXEC AuthenticateUser @Email = 'john@example.com', @Password = 'password123';

-- Retrieve customer orders
SELECT * FROM [OrderNo] WHERE CustomerID = 1;

select * from Product;

-- Insert Categories
INSERT INTO Category (CategoryName) VALUES ('Furniture');
INSERT INTO Category (CategoryName) VALUES ('Instrument');
INSERT INTO Category (CategoryName) VALUES ('Top');

-- Insert Products
INSERT INTO Product (ProductName, CategoryID, Price, Description, StockQuantity) VALUES ('Guitar', 4,2500, 'Nice instrument', 41);

-- Insert Customer

INSERT INTO Customer (FirstName, LastName, Email, Password, Address) VALUES ('Charan', 'Lokesh', 'charan@gmail.com', 'Loki105', 'Kaveri');

-- Insert Order
INSERT INTO [OrderNo] (OrderDate, CustomerID, TotalAmount) VALUES (2024-10-2212:45.7816878+05:30, 3, 789.99);

-- Insert Order Details
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, UnitPrice) VALUES (2, 3, 2,909.99);


select * from Product;
select * from Customer;
select * from OrderDetail;
select * from  OrderNo;
 



