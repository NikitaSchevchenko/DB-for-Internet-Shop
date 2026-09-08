SELECT c.name,
    COUNT(o.id)
FROM customers c
    JOIN orders o ON c.id = o.customer_id
GROUP BY c.name
HAVING COUNT(o.id) = (
    SELECT MAX(orders_count)
    FROM (
        SELECT COUNT(*) AS orders_count
        FROM orders
        GROUP BY orders.customer_id
        ) t
)