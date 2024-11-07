-- Create the CTE (Common Table Expression) for Monthly Sales

WITH monthly_sales AS (
    SELECT 
        p.product_name, 
        DATE_TRUNC('month', o.order_date) AS order_month, 
        SUM(o.quantity) AS total_quantity_sold
    FROM 
        products p
    JOIN orders o ON p.product_id = o.product_id
    GROUP BY 
        p.product_name, DATE_TRUNC('month', o.order_date)
)
SELECT 
    m.product_name,
    m.order_month,
    m.total_quantity_sold,
    i.stock_level
FROM 
    monthly_sales m
JOIN inventory i ON i.product_id = m.product_id;
