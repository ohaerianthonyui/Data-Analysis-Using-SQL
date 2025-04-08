---What are the top two promotions that resulted in the highest incremental revenue


WITH PromotionRevenue AS (
    SELECT 
        fe.promo_type,
        SUM(fe.quantity_sold_after_promo * fe.base_price) AS revenue_after_promo,
        SUM(fe.quantity_sold_before_promo * fe.base_price) AS revenue_before_promo,
        (SUM(fe.quantity_sold_after_promo * fe.base_price) - SUM(fe.quantity_sold_before_promo * fe.base_price)) AS incremental_revenue
    FROM dbo.fact_events fe
    GROUP BY fe.promo_type
)
SELECT TOP 2
    promo_type,
    ROUND(incremental_revenue, 2) AS incremental_revenue
FROM PromotionRevenue
ORDER BY incremental_revenue DESC;
