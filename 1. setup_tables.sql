-- Create products table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name TEXT NOT NULL,
    product_description TEXT
);

-- Create inventory table
CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    stock_level INT,
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

-- Create orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

-- Create restock_log table
CREATE TABLE restock_log (
    id SERIAL PRIMARY KEY,
    product_id INT,
    product_name TEXT,
    stock_level INT,
    notification_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    message TEXT,
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);