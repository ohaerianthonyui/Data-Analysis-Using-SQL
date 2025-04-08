
--Top 10 stores in terms of incremental revenue generated from the promotions

WITH StoreIncrementalRevenue AS (
    SELECT 
        s.store_id,
        s.city,
        SUM(fe.quantity_sold_after_promo * fe.base_price) AS revenue_after_promo,
        SUM(fe.quantity_sold_before_promo * fe.base_price) AS revenue_before_promo,
        (SUM(fe.quantity_sold_after_promo * fe.base_price) - SUM(fe.quantity_sold_before_promo * fe.base_price)) AS incremental_revenue
    FROM dbo.fact_events fe
    JOIN dbo.dim_stores s ON fe.store_id = s.store_id
    GROUP BY s.store_id, s.city
)
SELECT TOP 10 
    sir.store_id,
    sir.city,
    ROUND(sir.incremental_revenue, 2) AS incremental_revenue
FROM StoreIncrementalRevenue sir
ORDER BY sir.incremental_revenue DESC;


