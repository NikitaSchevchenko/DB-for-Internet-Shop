SELECT brand_id,
    COUNT(*) AS models_count
FROM models
GROUP BY brand_id