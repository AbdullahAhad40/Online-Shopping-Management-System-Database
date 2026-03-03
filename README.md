# 🛒 Online Shopping Managemnet System Database

A robust **MySQL-based relational database** designed to handle a full-scale e-commerce ecosystem. This project simulates a real-world marketplace, managing everything from vendor stock and customer relationships to complex order fulfillment and payment processing.



## 📌 Project Overview
The goal of this project was to design a normalized database schema that maintains data integrity across multiple business entities. It includes a comprehensive dataset of customers, products, and transactions, followed by a series of analytical queries to extract business insights.

## 🏗️ Database Architecture
The schema consists of **9 tables** with defined relationships (Primary and Foreign Keys):

* **Customers:** Stores user profiles and location data.
* **Sellers:** Managed list of vendors (e.g., Daraz, Pickaboo, Walton).
* **Products & Category:** Hierarchical product organization with pricing.
* **Orders & Contains:** Handles the many-to-many relationship between orders and products.
* **Inventory:** Tracks stock levels across different warehouse IDs.
* **Shipping & Payments:** Manages the logistics and financial status of every transaction.

---

## 🛠️ Tech Stack
* **Database:** MySQL
* **Language:** SQL (DDL, DML, DQL)
* **Concepts:** Relational Schema Design, Data Normalization, Join Logic, Complex Subqueries.

---

## 🔍 SQL Highlights

### 1. Analytical Queries
The project includes a suite of queries categorized by difficulty:

* **Easy:** Filtering by price ranges, geographic segmentation (Dhaka/Sylhet), and basic aggregate functions (`SUM`, `AVG`, `COUNT`).
* **Moderate:** Multi-table joins to calculate **Total Order Value** per customer and identifying **Top Sellers** by volume.
* **Hard:** Advanced logic using correlated subqueries and `HAVING` clauses to:
    * Find sellers whose prices are above the global average.
    * Identify loyal customers who buy from more than 2 different sellers.
    * Determine "Power Users" whose order frequency exceeds the database average.

### 2. Sample Business Logic
```sql
-- Identify the top 3 customers by total spending
SELECT 
    c.name AS customer_name,
    SUM(p.price) AS total_order_value
FROM Orders o
JOIN Cointains co ON o.order_id = co.order_id
JOIN Products p ON co.product_id = p.product_id
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_order_value DESC
LIMIT 3;
