# 📊 Ecommerce SQL Business Analysis Project

---

## 🎯 Objective

- Analyze customer behavior and purchasing patterns  
- Evaluate product performance and pricing strategies  
- Measure key business metrics like revenue and order trends  
- Solve real-world business problems using SQL  

---

## 🗂️ Database Schema

The database consists of:

- **Customers** – customer details  
- **Products** – product catalog and pricing  
- **Orders** – transaction records  
- **Order Items** – items within each order  
- **Payments** – payment transactions  
- **Product Reviews** – ratings and feedback  

### 🔗 Relationships

- Customers → Orders (1:M)  
- Orders → Order Items (1:M)  
- Products → Order Items (1:M)  
- Orders → Payments (1:M)  
- Customers → Product Reviews (1:M)  

---

## 🧠 SQL Concepts Used

### 🔹 Basics
- SELECT, WHERE, DISTINCT, ORDER BY  
- Filtering using BETWEEN, IN, LIKE  

### 🔹 Intermediate
- Aliases (AS)  
- NULL handling  
- String concatenation  
- Date formatting  

### 🔹 Aggregations
- COUNT, SUM, AVG  
- GROUP BY  

### 🔹 Joins
- INNER JOIN  
- LEFT JOIN  
- RIGHT JOIN  
- Multi-table joins  

### 🔹 Advanced
- Subqueries  
- Correlated queries  
- UNION operations  

---

## 📌 Business Problems Solved

- Retrieve customer data for marketing campaigns  
- Identify high-value and active customers  
- Calculate total revenue and average order value  
- Analyze product category performance  
- Identify out-of-stock and unsold products  
- Evaluate payment method usage  
- Find highest order value per customer  

---

## 📈 Key Insights

- Revenue and order trends highlight business performance  
- Customer segmentation identifies repeat vs inactive users  
- Product analysis shows top-performing categories  
- Payment data reveals preferred transaction methods  
- Subqueries help identify high-value transactions  

---

## 📁 Files Included

- `Project - Schema.sql` → Database structure (DDL)  
- `Project - DataInsertionQueries.sql` → Data insertion (DML)  
- `E-commerce Project SQL.sql` → Business queries and analysis  

---

## 🛠️ Tools Used

- MySQL  
- SQL  

---

## 🚀 Conclusion

This project demonstrates the ability to:

- Work with relational databases  
- Perform data analysis using SQL  
- Solve real-world business problems  
- Apply advanced SQL concepts like joins and subqueries  

---
