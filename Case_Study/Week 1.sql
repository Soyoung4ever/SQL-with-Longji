-- Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    join_date DATE
);

-- Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- OrderDetails table
CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
-- Inserting data into Customers table
INSERT INTO Customers (customer_id, first_name, last_name, email, join_date)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', '2023-01-15'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2024-02-20'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '2024-03-30');

-- Inserting data into Orders table
INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES 
(101, 1, '2024-07-01', 150.00),
(102, 2, '2024-07-02', 200.00),
(103, 3, '2024-07-03', 300.00);

-- Inserting data into Products table
INSERT INTO Products (product_id, product_name, category, price)
VALUES 
(1001, 'Smartphone', 'Electronics', 700.00),
(1002, 'Laptop', 'Electronics', 1200.00),
(1003, 'Headphones', 'Electronics', 150.00),
(1004, 'Book', 'Books', 20.00);

-- Inserting data into OrderDetails table
INSERT INTO OrderDetails (order_id, product_id, quantity, unit_price)
VALUES 
(101, 1001, 1, 700.00),
(101, 1004, 3, 20.00),
(102, 1002, 1, 1200.00),
(103, 1003, 2, 150.00),
(103, 1004, 5, 20.00);

/*
1. **Basic Data Exploration**
    - Display the first names, last names, and emails of all customers.
    - Display the names and join dates of customers who joined in 2024.
2. **Sales Data Analysis**
    - Display the order ID, order date, and total amount for all orders.
    - Display orders with a total amount of $100 or more.
3. **Product Data Exploration**
    - Display the names and prices of all products.
    - Display products with a price of $50 or more.
4. **Filtering Data by Specific Conditions**
    - Display the names and prices of products in the "Electronics" category.
    - Display the order ID, order date, and total amount for orders placed after "2024-01-01".
*/

--Answer 1-1
select first_name, last_name, email
from Customers;

--Answer 1-2
SELECT first_name, last_name, join_date
FROM Customers
WHERE join_date like '%2024%';

--Answer 2-1
SELECT order_id, order_date, total_amount
from Orders;

--Answer 2-2
SELECT *
FROM Orders
WHERE total_amount >= 100;

--Answer 3-1
SELECT product_name, price
FROM Products;

--Answer 3-2
SELECT *
FROM Products
WHERE price >= 50;

--Answer 4-1
SELECT product_name, price
FROM Products
WHERE category = 'Electronics';

--Answer 4-2
SELECT order_id, order_date, total_amount
FROM Orders
WHERE order_date >= '2024-01-01';
