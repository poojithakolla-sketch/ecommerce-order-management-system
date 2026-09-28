--join query
SELECT c.first_name, o.order_id, o.order_status
FROM Customer c
JOIN Orders o
ON c.customer_id = o.customer_id;
--aggregate query
SELECT customer_id, COUNT(*) AS total_orders
FROM Orders
GROUP BY customer_id;
--View query
CREATE VIEW Order_Details AS
SELECT o.order_id, c.first_name, o.order_date, o.order_status
FROM Orders o
JOIN Customer c
ON o.customer_id = c.customer_id;
--Other SQL Query
SELECT product_name, price
FROM Product
WHERE price > 1000
ORDER BY price DESC;
