--Incremental revenue of products


WITH ProductIR AS (
    SELECT 
        p.product_name,
        p.category,
        SUM(fe.quantity_sold_after_promo * fe.base_price) AS revenue_after_promo,
        SUM(fe.quantity_sold_before_promo * fe.base_price) AS revenue_before_promo,
        (SUM(fe.quantity_sold_after_promo * fe.base_price) - SUM(fe.quantity_sold_before_promo * fe.base_price)) AS incremental_revenue,
        ((SUM(fe.quantity_sold_after_promo * fe.base_price) - SUM(fe.quantity_sold_before_promo * fe.base_price)) * 1.0 / NULLIF(SUM(fe.quantity_sold_before_promo * fe.base_price), 0)) * 100 AS ir_percentage
    FROM dbo.fact_events fe
    JOIN dbo.dim_products p ON fe.product_code = p.product_code
    GROUP BY p.product_name, p.category
)
SELECT TOP 5
    product_name,
    category,
    ROUND(ir_percentage, 2) AS IR_percentage
FROM ProductIR
WHERE revenue_before_promo > 0  -- Exclude products with zero revenue before the promotion
ORDER BY ir_percentage DESC
;
