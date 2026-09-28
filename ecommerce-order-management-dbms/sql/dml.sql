INSERT INTO Customer
(first_name, last_name, email, registration_date)
VALUES
('Anita', 'Patel', 'anita@mail.com', '2023-01-15'),
('Ramesh', 'Nair', 'ramesh@mail.com', '2023-03-22'),
('Divya', 'Singh', 'divya@mail.com', '2024-06-10');


-- 2. ADDRESS
INSERT INTO Address
(customer_id, street, city, state, pincode, address_type)
VALUES
(1, 'MG Road', 'Hyderabad', 'Telangana', '500001', 'Home'),
(2, 'Main Street', 'Chennai', 'Tamil Nadu', '600001', 'Home'),
(3, 'Park Road', 'Bangalore', 'Karnataka', '560001', 'Home');


-- 3. CATEGORY
INSERT INTO Category
(category_name, parent_category_id)
VALUES
('Electronics', NULL),
('Clothing', NULL);

-- Mobile Phones is a child category of Electronics
INSERT INTO Category
(category_name, parent_category_id)
VALUES
('Mobile Phones', 1);


-- 4. PRODUCT
INSERT INTO Product
(product_name, description, price, stock_quantity, category_id)
VALUES
('Samsung Galaxy S24',
 'Latest Samsung smartphone',
 65000.00, 50, 1),

('Laptop HP Pavilion',
 'HP Pavilion laptop',
 55000.00, 30, 1),

('Cotton T-Shirt',
 'Comfortable cotton t-shirt',
 499.00, 200, 2);


-- 5. ORDERS
INSERT INTO Orders
(customer_id, address_id, order_date, order_status)
VALUES
(1, 1, '2024-08-01', 'Delivered'),
(2, 2, '2024-08-05', 'Shipped'),
(1, 1, '2024-08-10', 'Pending');


-- 6. ORDER ITEM
INSERT INTO Order_Item
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 65000.00),
(2, 2, 1, 55000.00),
(3, 3, 2, 499.00);


-- 7. PAYMENT
INSERT INTO Payment
(order_id, payment_date, amount, method, status, transaction_id)
VALUES
(1, '2024-08-01', 65000.00, 'UPI', 'Success', 'TXN001'),
(2, '2024-08-05', 55000.00, 'Card', 'Success', 'TXN002'),
(3, '2024-08-10', 998.00, 'COD', 'Pending', 'TXN003');
