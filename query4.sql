SELECT c.name,
    o.amount
FROM customers c
    JOIN orders o ON c.id = o.customer_id
ORDER BY o.amount DESC
FETCH FIRST 1 ROWS WITH TIES