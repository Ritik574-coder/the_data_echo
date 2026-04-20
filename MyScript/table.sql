--CREATE DATABASE RetailDB ;

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    gender VARCHAR(10),
    city VARCHAR(50),
    country VARCHAR(50),
    ip_address VARCHAR(50)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    collection VARCHAR(50),
    price NUMERIC(10,2),
    rating NUMERIC(2,1),
    availability BOOLEAN
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    status VARCHAR(20),
    order_purchased_at TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_at TIMESTAMP
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    product_price NUMERIC(10,2)
);