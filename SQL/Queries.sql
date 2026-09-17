SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    o.order_id,
    o.order_date,
    o.order_status,
    o.total_amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY o.order_date DESC;


SELECT
    order_status,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_sales,
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders
GROUP BY order_status
ORDER BY total_sales DESC;



SELECT
    oi.product_id,
    pr.sku,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM order_items oi
INNER JOIN product_reference pr
    ON oi.product_id = pr.product_id
GROUP BY
    oi.product_id,
    pr.sku
ORDER BY total_revenue DESC
LIMIT 10;


SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS number_of_orders,
    ROUND(SUM(o.total_amount), 2) AS total_spending
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING SUM(o.total_amount) > 500
ORDER BY total_spending DESC;