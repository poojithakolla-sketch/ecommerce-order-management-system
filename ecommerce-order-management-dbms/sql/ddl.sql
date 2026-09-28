CREATE TABLE Customer (
    customer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    registration_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Address (
    address_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INT NOT NULL,
    street VARCHAR(200),
    city VARCHAR(100),
    state VARCHAR(100),
    pincode VARCHAR(10),
    address_type VARCHAR(20) DEFAULT 'Home',
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Category (
    category_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    parent_category_id INT,
    FOREIGN KEY (parent_category_id)
        REFERENCES Category(category_id)
);

CREATE TABLE Product (
    product_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_name VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    stock_quantity INT DEFAULT 0,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

CREATE TABLE Orders (
    order_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INT NOT NULL,
    address_id INT,
    order_date DATE DEFAULT CURRENT_DATE,
    order_status VARCHAR(30) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES Address(address_id)
);

CREATE TABLE Order_Item (
    item_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Payment (
    payment_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id INT UNIQUE NOT NULL,
    payment_date DATE,
    amount DECIMAL(10,2),
    method VARCHAR(30),
    status VARCHAR(20) DEFAULT 'Pending',
    transaction_id VARCHAR(100) UNIQUE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
