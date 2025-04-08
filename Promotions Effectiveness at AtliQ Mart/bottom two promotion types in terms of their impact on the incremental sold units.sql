

--what are the bottom two promotion types in terms of their impact on the incremental sold units?
WITH PromotionImpact AS (
    SELECT 
        fe.promo_type,
        SUM(fe.quantity_sold_after_promo) AS total_quantity_after_promo,
        SUM(fe.quantity_sold_before_promo) AS total_quantity_before_promo,
        (SUM(fe.quantity_sold_after_promo) - SUM(fe.quantity_sold_before_promo)) AS incremental_sold_quantity
    FROM dbo.fact_events fe
    GROUP BY fe.promo_type
)
SELECT TOP 2
    promo_type,
    ROUND(incremental_sold_quantity, 2) AS incremental_sold_quantity
FROM PromotionImpact
ORDER BY incremental_sold_quantity ASC;
