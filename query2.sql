SELECT store_id,
    COUNT(*) AS items_count
FROM items
GROUP BY store_id