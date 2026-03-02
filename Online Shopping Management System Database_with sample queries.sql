CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    district VARCHAR(50),
    address VARCHAR(255),
    phone VARCHAR(20)
);
CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255)
);
CREATE TABLE Sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(255)
);
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10, 2),
    category_id INT,
    seller_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (seller_id) REFERENCES Sellers(seller_id)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    order_status VARCHAR(255),
    product_id INT,
    seller_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (seller_id) REFERENCES Sellers(seller_id)
);

CREATE TABLE Cointains (
    order_id INT,
    product_id INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    product_id INT,
    stock_remaining INT,
    warehouse_id INT,
    restock_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Shipping (
    shipping_id INT PRIMARY KEY,
    order_id INT,
    delivery_status VARCHAR(255),
    shipping_date DATE,
    return_date DATE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    payment_date DATE,
    payment_mode VARCHAR(255),
    payment_status VARCHAR(255),
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);


INSERT INTO Customers (customer_id, name, district, address, phone) VALUES
(100, 'Sabbir Ahmed', 'Dhaka', 'Kamrangirchar, Dhaka', '01710000001'),
(101, 'Md Abdullah', 'Dhaka', 'Bakshibazar, Dhaka', '01710000002'),
(102, 'Shovon Debnath', 'Dhaka', 'Mirpur-10, Dhaka', '01810000003'),
(103, 'Rahim Uddin', 'Dhaka', 'Mirpur-10, Dhaka', '01910000004'),
(104, 'Karim Ahmed', 'Chattogram', 'Agrabad, Chattogram', '01810000005'),
(105, 'Rafiul Islam', 'Rajshahi', 'Shaheb Bazar, Rajshahi', '01910000006'),
(106, 'Nusrat Jahan', 'Sylhet', 'Zindabazar, Sylhet', '01610000007'),
(107, 'Mehedi Hasan', 'Khulna', 'Sonadanga, Khulna', '01510000008'),
(108, 'Sadia Akter', 'Barishal', 'Rupatali, Barishal', '01710000009'),
(109, 'Tanvir Hossain', 'Rangpur', 'Paira Chattar, Rangpur', '01810000010'),
(110, 'Sabbir Rahman', 'Dhaka', 'Dhanmondi, Dhaka', '01910000011'),
(111, 'Mim Chowdhury', 'Comilla', 'Kandirpar, Comilla', '01610000012'),
(112, 'Arif Khan', 'Gazipur', 'Tongi, Gazipur', '01710000013'),
(113, 'Tania Rahman', 'Mymensingh', 'Town Hall Road, Mymensingh', '01510000014'),
(114, 'Hasibul Hasan', 'Jessore', 'Rail Station Road, Jessore', '01910000015'),
(115, 'Rafsan Chowdhury', 'Dhaka', 'Banasree, Dhaka', '01710000016'),
(116, 'Nabila Islam', 'Chattogram', 'Nasirabad, Chattogram', '01810000017'),
(117, 'Ahsan Habib', 'Khulna', 'Khalishpur, Khulna', '01510000018'),
(118, 'Farzana Karim', 'Sylhet', 'Amberkhana, Sylhet', '01610000019'),
(119, 'Samiul Hossain', 'Rajshahi', 'Motihar, Rajshahi', '01910000020');

INSERT INTO Category (category_id, category_name) VALUES
(100, 'Electronics'),
(101, 'Clothing'),
(102, 'Books'),
(103, 'Home & Kitchen'),
(104, 'Beauty & Personal Care'),
(105, 'Sports & Outdoors'),
(106, 'Toys & Games'),
(107, 'Grocery'),
(108, 'Automotive'),
(109, 'Furniture'),
(110, 'Health'),
(111, 'Baby'),
(112, 'Office Supplies'),
(113, 'Pet Supplies'),
(114, 'Tools'),
(115, 'Garden'),
(116, 'Music'),
(117, 'Movies'),
(118, 'Software'),
(119, 'Video Games');

INSERT INTO Sellers (seller_id, seller_name) VALUES
(100, 'Daraz'),
(101, 'Le Reve'),
(102, 'Bata'),
(103, 'RFL'),
(104, 'Pickaboo'),
(105, 'Daraz'),
(106, 'Bata'),
(107, 'Chaldal'),
(108, 'Ryans Computers'),
(109, 'Pickaboo'),
(110, 'Pran'),
(111, 'Singer'),
(112, 'Apex'),
(113, 'Singer'),
(114, 'Walton'),
(115, 'Pran'),
(116, 'Pran'),
(117, 'Chaldal'),
(118, 'Aarong'),
(119, 'Daraz');

INSERT INTO Products (product_id, product_name, price, category_id, seller_id) VALUES
(100, 'Rice', 247.71, 103, 114),
(101, 'Doll', 961.70, 109, 112),
(102, 'Sofa', 219.97, 109, 111),
(103, 'Watch', 510.09, 119, 104),
(104, 'Camera', 887.56, 100, 104),
(105, 'Laptop', 841.81, 108, 114),
(106, 'Sunglasses', 79.02, 111, 112),
(107, 'Backpack', 728.78, 109, 100),
(108, 'Car Tire', 535.56, 103, 107),
(109, 'Flour', 361.44, 102, 101),
(110, 'Headphones', 614.37, 115, 114),
(111, 'Sofa', 383.61, 113, 110),
(112, 'Pants', 781.39, 102, 111),
(113, 'T-Shirt', 607.77, 118, 111),
(114, 'Book', 264.26, 114, 118),
(115, 'Toy Car', 838.05, 107, 109),
(116, 'T-Shirt', 321.85, 102, 115),
(117, 'Pants', 179.13, 108, 109),
(118, 'Book', 378.27, 104, 117),
(119, 'Laptop', 362.36, 118, 114);

INSERT INTO Inventory (inventory_id, product_id, stock_remaining, warehouse_id, restock_date) VALUES
(100, 111, 40, 5, '2022-02-13'),
(101, 111, 108, 5, '2022-02-28'),
(102, 104, 68, 5, '2020-01-03'),
(103, 108, 26, 9, '2021-09-22'),
(104, 110, 136, 5, '2025-08-04'),
(105, 100, 117, 9, '2022-07-18'),
(106, 107, 142, 1, '2025-10-09'),
(107, 119, 27, 10, '2024-12-21'),
(108, 113, 136, 1, '2025-11-21'),
(109, 105, 64, 5, '2020-08-17'),
(110, 102, 12, 1, '2020-02-12'),
(111, 117, 72, 8, '2024-12-13'),
(112, 117, 30, 10, '2023-03-11'),
(113, 113, 49, 6, '2024-01-01'),
(114, 113, 31, 8, '2025-10-07'),
(115, 108, 43, 6, '2023-04-15'),
(116, 118, 127, 2, '2025-05-23'),
(117, 107, 189, 1, '2024-01-10'),
(118, 104, 18, 8, '2024-09-27'),
(119, 113, 93, 5, '2020-04-15');

INSERT INTO Orders (order_id, order_date, customer_id, order_status, product_id, seller_id) VALUES
(100, '2024-09-20', 101, 'Pending', 105, 116),
(101, '2020-10-02', 104, 'Processing', 116, 104),
(102, '2024-01-26', 108, 'Shipped', 103, 109),
(103, '2020-06-27', 103, 'Delivered', 107, 101),
(104, '2024-01-12', 106, 'Delivered', 116, 100),
(105, '2020-01-09', 101, 'Processing', 115, 116),
(106, '2020-06-10', 101, 'Pending', 118, 115),
(107, '2023-10-05', 119, 'Processing', 102, 102),
(108, '2025-07-05', 105, 'Pending', 113, 116),
(109, '2022-10-05', 110, 'Cancelled', 101, 118),
(110, '2023-07-06', 106, 'Processing', 105, 109),
(111, '2023-01-15', 118, 'Processing', 115, 106),
(112, '2021-01-25', 118, 'Pending', 110, 115),
(113, '2022-10-14', 101, 'Cancelled', 115, 109),
(114, '2022-06-21', 109, 'Processing', 118, 104),
(115, '2021-05-21', 111, 'Cancelled', 100, 117),
(116, '2025-08-11', 109, 'Delivered', 112, 109),
(117, '2025-05-11', 114, 'Processing', 115, 107),
(118, '2023-06-15', 105, 'Delivered', 116, 119),
(119, '2021-07-16', 119, 'Cancelled', 105, 103);

INSERT INTO Cointains (order_id, product_id) VALUES
(117, 107),
(103, 100),
(115, 103),
(104, 113),
(111, 106),
(104, 112),
(109, 104),
(117, 113),
(107, 107),
(112, 112),
(113, 110),
(108, 106),
(108, 119),
(106, 117),
(107, 105),
(107, 119),
(104, 117),
(119, 105),
(104, 118),
(115, 119);

INSERT INTO Shipping (shipping_id, order_id, delivery_status, shipping_date, return_date) VALUES
(100, 117, 'Delivered', '2020-06-22', NULL),
(101, 100, 'Delivered', '2023-11-05', '2024-02-25'),
(102, 112, 'Returned', '2021-11-08', '2022-01-26'),
(103, 114, 'In Transit', '2025-04-27', NULL),
(104, 110, 'Delivered', '2021-04-07', NULL),
(105, 103, 'Returned', '2024-05-13', '2024-07-07'),
(106, 100, 'Delivered', '2024-09-22', NULL),
(107, 118, 'In Transit', '2020-10-12', NULL),
(108, 101, 'Returned', '2023-03-23', NULL),
(109, 106, 'Delivered', '2022-07-25', NULL),
(110, 110, 'Delivered', '2024-03-27', NULL),
(111, 102, 'In Transit', '2025-04-22', NULL),
(112, 108, 'Delivered', '2024-11-20', NULL),
(113, 112, 'Returned', '2022-05-25', NULL),
(114, 110, 'Returned', '2023-04-26', '2022-04-23'),
(115, 105, 'Returned', '2025-06-28', NULL),
(116, 105, 'In Transit', '2021-04-23', NULL),
(117, 104, 'In Transit', '2025-03-11', NULL),
(118, 103, 'Returned', '2025-02-03', NULL),
(119, 116, 'Returned', '2021-04-02', NULL);

INSERT INTO Payments (payment_id, payment_date, payment_mode, payment_status, order_id) VALUES
(100, '2022-05-18', 'Mobile Payment', 'Refunded', 103),
(101, '2024-04-11', 'Credit Card', 'Pending', 106),
(102, '2024-09-24', 'Cash on Delivery', 'Pending', 115),
(103, '2024-09-09', 'Credit Card', 'Paid', 105),
(104, '2023-01-03', 'Bank Transfer', 'Pending', 106),
(105, '2020-01-18', 'Bank Transfer', 'Pending', 100),
(106, '2024-09-27', 'Cash on Delivery', 'Pending', 117),
(107, '2025-11-22', 'Credit Card', 'Pending', 117),
(108, '2020-09-22', 'Mobile Payment', 'Paid', 110),
(109, '2024-12-21', 'Mobile Payment', 'Paid', 103),
(110, '2024-10-18', 'Bank Transfer', 'Paid', 102),
(111, '2021-02-13', 'Bank Transfer', 'Paid', 106),
(112, '2022-12-01', 'Credit Card', 'Paid', 111),
(113, '2024-12-12', 'Cash on Delivery', 'Pending', 118),
(114, '2020-10-01', 'Bank Transfer', 'Paid', 100),
(115, '2025-06-19', 'Bank Transfer', 'Paid', 105),
(116, '2025-08-26', 'Cash on Delivery', 'Paid', 112),
(117, '2022-08-19', 'Mobile Payment', 'Refunded', 112),
(118, '2024-03-09', 'Credit Card', 'Pending', 111);


-- SELECT * FROM category;
-- SELECT * FROM customers;
-- SELECT * FROM inventory;
-- SELECT * FROM Cointains;
-- SELECT * FROM orders;
-- SELECT * FROM payments;
-- SELECT * FROM products;
-- SELECT * FROM sellers;
-- SELECT * FROM shipping;



-- -----------------------------------------------------------------------------------------------------------
-- 						EASY
-- -----------------------------------------------------------------------------------------------------------

-- 1 -----------------------------------------------------------------------------------------------
-- Finding products priced between 300 and 800
-- -----------------------------------------------------------------------------------------------
SELECT product_name, price
FROM Products
WHERE price BETWEEN 300 AND 800
LIMIT 5;

-- 2 -----------------------------------------------------------------------------------------------
-- Finding customers from Dhaka or Sylhet
-- -----------------------------------------------------------------------------------------------
SELECT name, district
FROM Customers
WHERE district = 'Dhaka' OR district = 'Sylhet'
LIMIT 5;

-- 3 -----------------------------------------------------------------------------------------------
-- Updating stocks in inventory table
-- -----------------------------------------------------------------------------------------------
UPDATE Inventory
SET stock_remaining = stock_remaining + 20
WHERE product_id = 105;
Select * FROM Inventory
LIMIT 5;

-- 4 -----------------------------------------------------------------------------------------------
-- Finding all orders that are not delivered
-- -----------------------------------------------------------------------------------------------
SELECT order_id, order_status
FROM Orders
WHERE NOT order_status = 'Delivered'
LIMIT 5;

-- 5 -----------------------------------------------------------------------------------------------
-- All products ordered by price descending
-- -----------------------------------------------------------------------------------------------
SELECT product_name, price
FROM Products
ORDER BY price DESC
LIMIT 5;

-- 6 -----------------------------------------------------------------------------------------------
-- Query using SUM, AVG, COUNT from product
-- -----------------------------------------------------------------------------------------------
SELECT     
	SUM(price) AS Total_Product_Price,    
	AVG(price) AS Average_Product_Price,
	COUNT(product_id) AS Total_Products
FROM Products;


-- -----------------------------------------------------------------------------------------------------------
-- 						MODERATE
-- -----------------------------------------------------------------------------------------------------------


-- 7 ---------------------------------------------------------------------------------------------
-- Top 3 customers by total order value (sum of Order_items.total_price)
-- -----------------------------------------------------------------------------------------------
SELECT 
    c.customer_id,
    c.name AS customer_name,
    SUM(p.price) AS total_order_value
FROM Orders o
JOIN Cointains co ON o.order_id = co.order_id
JOIN Products p ON co.product_id = p.product_id
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_order_value DESC
LIMIT 3;

-- 8 ---------------------------------------------------------------------------------------------
-- MIN and MAX product price per category (only categories that have products) 
-- ------------------------------------------------------------------------------------------------
SELECT cat.category_name, MIN(p.price) AS min_price, MAX(p.price) AS max_price 
FROM Products p 
JOIN Category cat ON p.category_id = cat.category_id 
GROUP BY cat.category_name
LIMIT 5; 


-- 9 ---------------------------------------------------------------------------------------------
-- Count how many orders each customer has placed
-- -----------------------------------------------------------------------------------------------
SELECT c.name AS customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_orders DESC;

-- 10 ---------------------------------------------------------------------------------------------
-- Count total products sold by each seller
-- ----------------------------------------------------------------------------------------------
SELECT 
    s.seller_id,
    s.seller_name,
    COUNT(co.product_id) AS total_products_sold
FROM Sellers s
JOIN Products p ON s.seller_id = p.seller_id
JOIN Cointains co ON p.product_id = co.product_id
JOIN Orders o ON co.order_id = o.order_id
GROUP BY s.seller_id, s.seller_name
ORDER BY total_products_sold DESC;

-- 11 ---------------------------------------------------------------------------------------------
-- Sellers where MIN(product price) < 200 and MAX(product price) > 600 (GROUP BY + HAVING) 
-- ------------------------------------------------------------------------------------------------
SELECT s.seller_id, s.seller_name, MIN(p.price) AS min_price, MAX(p.price) AS max_price 
FROM Sellers s 
JOIN Products p ON s.seller_id = p.seller_id 
GROUP BY s.seller_id, s.seller_name 
HAVING MIN(p.price) < 200 AND MAX(p.price) > 600 
ORDER BY s.seller_id;


-- -----------------------------------------------------------------------------------------------------------
-- 						HARD
-- -----------------------------------------------------------------------------------------------------------


-- 12 --------------------------------------------------------------------------------------------------
-- Most recent order date per customer 
-- --------------------------------------------------------------------------------------------------
SELECT c.customer_id, c.name, 
  (SELECT MAX(o.order_date) FROM Orders o WHERE o.customer_id = c.customer_id) AS last_order 
FROM Customers c
LIMIT 5;



-- 13 ---------------------------------------------------------------------------------------------------
-- Top 3 products by total sales considering only orders with order_status IN ('Delivered','Processing') (subquery in WHERE)
-- ------------------------------------------------------------------------------------------------------
SELECT 
    p.product_id,
    p.product_name,
    SUM(p.price) AS total_sales
FROM Products p
JOIN Cointains co ON p.product_id = co.product_id
WHERE co.order_id IN (
    SELECT order_id 
    FROM Orders 
    WHERE order_status IN ('Delivered', 'Processing')
)
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC
LIMIT 3;


-- 14 ---------------------------------------------------------------------------------------------------
-- Sellers whose average product price is greater than the overall average product price
-- --------------------------------------------------------------------------------------------------
SELECT s.seller_id, s.seller_name, AVG(p.price) AS seller_avg_price
FROM Sellers s
JOIN Products p ON s.seller_id = p.seller_id
GROUP BY s.seller_id
HAVING AVG(p.price) > (SELECT AVG(price) FROM Products);

-- 15 --------------------------------------------------------------------------------------------------
-- Customers who ordered products from > 2 different sellers
-- --------------------------------------------------------------------------------------------------
SELECT c.customer_id, c.name
FROM Customers c
WHERE (SELECT COUNT(DISTINCT o.seller_id) FROM Orders o WHERE o.customer_id = c.customer_id) > 2;

-- 16 --------------------------------------------------------------------------------------------------
-- Customers who placed more orders than the average number of orders per customer
-- --------------------------------------------------------------------------------------------------
SELECT c.customer_id, c.name
FROM Customers c
WHERE (SELECT COUNT(*) 
       FROM Orders o 
       WHERE o.customer_id = c.customer_id)
      >
      (SELECT AVG(order_count)
       FROM (
            SELECT COUNT(*) AS order_count
            FROM Orders
            GROUP BY customer_id
       ) AS temp);
