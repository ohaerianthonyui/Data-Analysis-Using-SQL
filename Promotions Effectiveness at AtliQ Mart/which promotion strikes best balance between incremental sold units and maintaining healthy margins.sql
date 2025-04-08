
---which promotion strikes best balance between incremental sold units and maintaining healthy margins
WITH PromotionAnalysis AS (
    SELECT 
        fe.promo_type,
        SUM(fe.quantity_sold_after_promo * fe.base_price) AS revenue_after_promo,
        SUM(fe.quantity_sold_before_promo * fe.base_price) AS revenue_before_promo,
        (SUM(fe.quantity_sold_after_promo) - SUM(fe.quantity_sold_before_promo)) AS incremental_sold_quantity,
        ((SUM(fe.quantity_sold_after_promo) - SUM(fe.quantity_sold_before_promo)) * 1.0 / NULLIF(SUM(fe.quantity_sold_before_promo), 0)) * 100 AS isu_percentage
    FROM dbo.fact_events fe
    WHERE fe.promo_type IN ('25% OFF', '50% OFF', '33% OFF', 'BOGOF', '500 Cashback')
    GROUP BY fe.promo_type
)
SELECT 
    promo_type,
    ROUND(AVG(isu_percentage), 2) AS avg_isu_percentage,
    ROUND(AVG(incremental_sold_quantity), 2) AS avg_incremental_sold_quantity,
    ROUND(AVG(revenue_after_promo - revenue_before_promo), 2) AS avg_incremental_revenue
FROM PromotionAnalysis
GROUP BY promo_type
ORDER BY avg_isu_percentage DESC;
