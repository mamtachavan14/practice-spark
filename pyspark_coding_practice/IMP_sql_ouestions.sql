
CREATE TABLE imp.Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    signup_date DATE
);

INSERT INTO imp.Customers VALUES
(1, 'Anil', 'Mumbai', '2024-01-01'),
(2, 'Priya', 'Pune', '2024-01-05'),
(3, 'Rahul', 'Nashik', '2024-01-10'),
(4, 'Sneha', 'Mumbai', '2024-01-15'),
(5, 'Karan', 'Pune', '2024-01-20'),
(6, 'Pooja', 'Nagpur', '2024-01-25');


CREATE TABLE imp.Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO imp.Products VALUES
(101, 'Laptop', 'Electronics', 50000),
(102, 'Mobile', 'Electronics', 30000),
(103, 'Chair', 'Furniture', 5000),
(104, 'Table', 'Furniture', 8000),
(105, 'Headphones', 'Electronics', 2000);




CREATE TABLE imp.Customer_Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);


INSERT INTO imp.Customer_Orders VALUES
(1001, 1, '2024-02-01', 50000),
(1002, 2, '2024-02-02', 30000),
(1003, 1, '2024-02-03', 2000),
(1004, 3, '2024-02-04', 8000),
(1005, 4, '2024-02-05', 5000),
(1006, 1, '2024-02-06', 30000),
(1007, 5, '2024-02-07', 50000);


CREATE TABLE imp.Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO imp.Order_Details VALUES
(1, 1001, 101, 1),
(2, 1002, 102, 1),
(3, 1003, 105, 1),
(4, 1004, 104, 1),
(5, 1005, 103, 1),
(6, 1006, 102, 1),
(7, 1007, 101, 1);
