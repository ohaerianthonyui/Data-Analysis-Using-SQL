
--How does the performance of stores vary by city?
WITH StorePerformance AS (
    SELECT 
        s.store_id,
        s.city,
        SUM(fe.quantity_sold_after_promo) AS total_quantity_after_promo,
        SUM(fe.quantity_sold_before_promo) AS total_quantity_before_promo,
        (SUM(fe.quantity_sold_after_promo) - SUM(fe.quantity_sold_before_promo)) AS incremental_sold_quantity,
        ((SUM(fe.quantity_sold_after_promo) - SUM(fe.quantity_sold_before_promo)) * 1.0 / NULLIF(SUM(fe.quantity_sold_before_promo), 0)) * 100 AS isu_percentage
    FROM dbo.fact_events fe
    JOIN dbo.dim_stores s ON fe.store_id = s.store_id
    JOIN dbo.dim_stores st ON s.store_id = s.store_id
    GROUP BY s.store_id, s.city
)
SELECT 
    city,
    COUNT(DISTINCT store_id) AS number_of_stores,
    ROUND(AVG(isu_percentage), 2) AS average_isu_percentage,
    ROUND(MAX(isu_percentage), 2) AS highest_isu_percentage,
    ROUND(MIN(isu_percentage), 2) AS lowest_isu_percentage
FROM StorePerformance
GROUP BY city
ORDER BY average_isu_percentage DESC;
