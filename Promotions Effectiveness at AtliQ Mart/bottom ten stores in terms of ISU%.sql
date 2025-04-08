
----which are the bottom ten stores in terms of ISU%  during the promotional period
WITH StoreISU AS (
    SELECT 
        s.store_id,
        s.city,
        SUM(fe.quantity_sold_after_promo) AS total_quantity_after_promo,
        SUM(fe.quantity_sold_before_promo) AS total_quantity_before_promo,
        (SUM(fe.quantity_sold_after_promo) - SUM(fe.quantity_sold_before_promo)) AS incremental_sold_quantity,
        ((SUM(fe.quantity_sold_after_promo) - SUM(fe.quantity_sold_before_promo)) * 1.0 / NULLIF(SUM(fe.quantity_sold_before_promo), 0)) * 100 AS isu_percentage
    FROM dbo.fact_events fe
    JOIN dbo.dim_stores s ON fe.store_id = s.store_id
    GROUP BY s.store_id, s.city
)
SELECT TOP 10
    sir.store_id,
    sir.city,
    ROUND(sir.isu_percentage, 2) AS ISU_percentage
FROM StoreISU sir
ORDER BY sir.isu_percentage ASC;
