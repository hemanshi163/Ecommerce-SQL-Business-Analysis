-- LEVEL 1: BASICS --
-- Retrieve customer names and emails for email marketing
select name, email from customers;

-- View complete product catalog with all available details
select * from products;

-- List all unique product categories
select distinct category from products;

-- Show all products priced above ₹1,000
select name from products where price>1000;

-- Display products within a mid-range price bracket (₹2,000 to ₹5,000)
select name, price from products where price between 2000 and 5000;

--  Fetch data for specific customer IDs (e.g., from loyalty program list) asssuming customers - 3,4,5
select * from customers where customer_id in (3,4,5);

-- Identify customers whose names start with the letter ‘A’
select * from customers where name like 'A%';

-- List electronics products priced under ₹3,000
Select * from products where category='Electronics' and price<3000;

-- Display product names and prices in descending order of price
select name, price from products order by price desc;

--  Display product names and prices, sorted by price and then by name
select * from products order by price desc, name asc;

-- LEVEL 2 --
-- Retrieve orders where customer information is missing (possibly due to data migration or deletion)
select * from orders where customer_id is NULL;

--  Display customer names and emails using column aliases for frontend readability
select name as Customer_name, email as Customer_email from customers;

-- Calculate total value per item ordered by multiplying quantity and item price
select name, price*stock_quantity as total_value from products;

-- Combine customer name and phone number in a single column
select concat(name, "-->" , phone) as contact_directory from customers;

-- Extract only the date part from order timestamps for date-wise reporting
select date(order_date) from orders;

-- List products that do not have any stock left
select * from products where stock_quantity = 0;

-- LEVEL 3 --
-- Count the total number of orders placed
select count(*) as order_count from orders;

-- Calculate the total revenue collected from all orders
select sum(total_amount) as total_revenue from orders;

--  Calculate the average order value
select avg(total_amount) as average_aov from orders;

-- Count the number of customers who have placed at least one order
select count(distinct customer_id) as customer_count from orders;

-- Find the number of orders placed by each customer
select customer_id, count(order_id) as orders from orders group by customer_id;

--  Find total sales amount made by each customer
select customer_id, sum(total_amount) as total_order from orders group by customer_id;

--  List the number of products sold per category
select category, count(product_id) as Prods_per_cat from products group by category;

--  Find the average item price per category
select category , avg(price) as avg_price from products group by category;

-- Show number of orders placed per day
select date(order_date), count(order_id) as orders from orders group by date(order_date);

-- List total payments received per payment method
select method, sum(amount_paid) as total from payments group by method;

select * from order_items;

-- LEVEL 4 --
--  Retrieve order details along with the customer name (INNER JOIN)
select c.name, o.*
from customers c
inner join orders o
on c.customer_id=o.customer_id;

--  Get list of products that have been sold (INNER JOIN with order_items)
select p.product_id, oi.order_id
from products p
inner join order_items oi
on p.product_id = oi.product_id;

--  List all orders with their payment method (INNER JOIN)
select p.method, o.*
from orders o
inner join payments p
on p.order_id = o.order_id;

-- Get list of customers and their orders (LEFT JOIN)
select c.name, o.order_id
from customers c
left join orders o
on c.customer_id= o.customer_id;

-- List all products along with order item quantity (LEFT JOIN)
select p.product_id, oi.quantity
from products p
left join order_items oi
on p.product_id= oi.product_id;

--  List all payments including those with no matching orders (RIGHT JOIN)
select p.*, o.order_date
from orders o
right join payments p
on p.order_id = o.order_id;

-- Combine data from three tables: customer, order, and payment
select c.*,o.*,p.*
from customers c
left join orders o
on c.customer_id=o.	customer_id
left join payments p
on o.order_id=p.order_id;

-- LEVEL 5 --
-- List all products priced above the average product price
select * from products where price > (select avg(price) from products);

-- Find customers who have placed at least one order
select name from customers where customer_id in (select distinct customer_id from orders);

-- Show orders whose total amount is above the average for that customer
select *
from orders o
where total_amount >
(select avg(total_amount) from orders
where customer_id = o.customer_id);

--  Display customers who haven’t placed any orders
select name from customers where customer_id not in 
(select customer_id from orders);

-- Show products that were never ordered
select name from products where product_id not in
(select product_id from orders);

-- Show highest value order per customer
select customer_id, max(total_amount) from orders group by customer_id;

-- Highest Order Per Customer (Including Names)
select c.name, max(o.total_amount) as highest_order
from orders o
inner join customers c
on o.customer_id = c.customer_id
group by c.customer_id;

-- LEVEL 6 --
-- List all customers who have either placed an order or written a product review
select customer_id from orders 
union
select customer_id from product_reviews;

--  List all customers who have placed an order as well as reviewed a product
select distinct customer_id from orders where customer_id in
(select customer_id from product_reviews);