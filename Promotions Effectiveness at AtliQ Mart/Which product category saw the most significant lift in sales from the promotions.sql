
--Which product category saw the most significant lift in sales from the promotions?
WITH SalesAnalysis AS (
    SELECT
        dp.category AS product_category,
        fe.promo_type,
        SUM(fe.quantity_sold_after_promo) AS total_units_sold_after_promo,
        SUM(fe.quantity_sold_before_promo) AS total_units_sold_before_promo,
        SUM(fe.quantity_sold_after_promo * fe.base_price) AS total_revenue_after_promo,
        SUM(fe.quantity_sold_before_promo * fe.base_price) AS total_revenue_before_promo
    FROM
        dbo.fact_events fe
    JOIN
        dbo.dim_products dp ON fe.product_code = dp.product_code
    GROUP BY
        dp.category,
        fe.promo_type
)
SELECT
    product_category,
    promo_type,
    ROUND(
        (total_units_sold_after_promo - total_units_sold_before_promo) * 100.0 /
        NULLIF(total_units_sold_before_promo, 0), 2
    ) AS isu_percentage,
    total_units_sold_after_promo - total_units_sold_before_promo AS incremental_units_sold,
    total_revenue_after_promo - total_revenue_before_promo AS incremental_revenue
FROM
    SalesAnalysis
ORDER BY
    incremental_units_sold DESC;
