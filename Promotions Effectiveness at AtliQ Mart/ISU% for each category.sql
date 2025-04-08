

--- Incremental sold quantity(ISU%) for each category during the diwal campaign. provide rankings for the categories based on their ISU%.


WITH CategoryISU AS (
    SELECT 
        p.category,
        SUM(fe.quantity_sold_after_promo) AS total_quantity_after_promo,
        SUM(fe.quantity_sold_before_promo) AS total_quantity_before_promo,
        (SUM(fe.quantity_sold_after_promo) - SUM(fe.quantity_sold_before_promo)) AS incremental_sold_quantity,
        ((SUM(fe.quantity_sold_after_promo) - SUM(fe.quantity_sold_before_promo)) * 1.0 / NULLIF(SUM(fe.quantity_sold_before_promo), 0)) * 100 AS isu_percentage
    FROM dbo.fact_events fe
    JOIN dbo.dim_products p ON fe.product_code = p.product_code
    JOIN dbo.dim_campaigns c ON fe.campaign_id = c.campaign_id
    WHERE c.campaign_name = 'Diwali'  -- Filter for Diwali campaign
    GROUP BY p.category
)
SELECT 
    category,
    ROUND(isu_percentage, 2) AS ISU_percentage,
    RANK() OVER (ORDER BY isu_percentage DESC) AS rank_order
FROM CategoryISU
ORDER BY rank_order;
