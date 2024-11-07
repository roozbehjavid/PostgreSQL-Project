-- Insert products data

INSERT INTO products (product_name, product_description)
VALUES
    ('Product A', 'Description for Product A'),
    ('Product B', 'Description for Product B'),
    ('Product C', 'Description for Product C');

-- Insert orders data

INSERT INTO orders (product_id, order_date, quantity)
VALUES
    (1, '2024-10-01', 10),
    (2, '2024-10-02', 5),
    (3, '2024-10-03', 20),
    (1, '2024-10-04', 8);

-- Insert inventory data

INSERT INTO inventory (product_id, stock_level)
VALUES
    (1, 100),
    (2, 50),
    (3, 200);