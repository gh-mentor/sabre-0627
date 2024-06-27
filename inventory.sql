/*
This file contains a script of Transact SQL (T-SQL) command to interact with a database named 'Inventory'.
*/

/*
Create a script that will perform the following tasks:
Requirements:
- SQL Server 2022 is installed and running
- database 'Inventory' already exists.
Details:
- If the database 'Inventory' does not exist, the script will print an error message and exit.
- Sets the default database to 'Inventory'.
- Creates a 'categories' table and related 'products' table if they do not already exist.
- Remove all rows from the 'products' and 'categories' tables.
- Populates the 'Categories' table with sample data.
- Populates the 'Products' table with sample data.
- Creates stored procedures to get all categories.
- Creates a stored procedure to get all products in a specific category.
- Creates a stored procudure to get all products in a specific price range sorted by price in ascending order.
*/

-- Check if the database 'Inventory' exists
IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'Inventory')
BEGIN
    PRINT 'Database Inventory does not exist. Exiting script.'
    RETURN
END

-- Set the default database to 'Inventory'
USE Inventory

-- Create a 'categories' table if it does not already exist.
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'categories')
BEGIN
    CREATE TABLE categories (
        category_id INT PRIMARY KEY,
        category_name NVARCHAR(50) NOT NULL,
        -- add an optional 'Description' column to store a description of the category
        description NVARCHAR(255)
    )
END

-- Create a 'products' table if it does not already exist.
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'products')
BEGIN
    CREATE TABLE products (
        product_id INT PRIMARY KEY,
        product_name NVARCHAR(50) NOT NULL,
        category_id INT,
        price DECIMAL(10, 2),
        stock_quantity INT,
        -- Add a created_at column to track the creation date of the product
        created_at DATETIME,
        -- Add an updated_at column to track the last update date of the product
        updated_at DATETIME,
        FOREIGN KEY (category_id) REFERENCES categories(category_id)
    )
END

-- Remove all rows from the 'products' and 'categories' tables.
TRUNCATE TABLE products
TRUNCATE TABLE categories

-- Populates the 'Categories' table with sample data.
INSERT INTO categories (category_id, category_name)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books')

-- Populates the 'Products' table with sample data.
INSERT INTO products (product_id, product_name, category_id, price, stock_quantity, created_at, updated_at)
VALUES
(1, 'Laptop', 1, 999.99, 10, GETDATE(), GETDATE()),
(2, 'T-shirt', 2, 19.99, 50, GETDATE(), GETDATE()),
(3, 'Book', 3, 9.99, 100, GETDATE(), GETDATE())

-- Create a stored procedure to get all categories.
IF OBJECT_ID('dbo.GetAllCategories') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.GetAllCategories
END

CREATE PROCEDURE dbo.GetAllCategories
AS
BEGIN
    SELECT * FROM categories
END

-- Create a stored procedure to get all products in a specific category.
IF OBJECT_ID('dbo.GetProductsByCategory') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.GetProductsByCategory
END

-- Create a stored procedure to get all products in a specific category.
CREATE PROCEDURE dbo.GetProductsByCategory
    @category_id INT
AS
BEGIN
    SELECT * FROM products WHERE category_id = @category_id
END

-- Create a stored procudure to get all products in a specific price range sorted by price in ascending order.
IF OBJECT_ID('dbo.GetProductsByPriceRange') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.GetProductsByPriceRange
END

-- Create a stored procedure to get all products in a specific price range sorted by price in ascending order.
CREATE PROCEDURE dbo.GetProductsByPriceRange
    @min_price DECIMAL(10, 2),
    @max_price DECIMAL(10, 2)
AS
BEGIN
    SELECT * FROM products WHERE price >= @min_price AND price <= @max_price ORDER BY price ASC
END

