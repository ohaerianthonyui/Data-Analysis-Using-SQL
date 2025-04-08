
---Display each campaign with the total revenue generated before and after the campaign.
SELECT 
    c.campaign_name,
    SUM(fe.quantity_sold_before_promo * fe.base_price) AS total_revenue_before_promo,
    SUM(fe.quantity_sold_after_promo * fe.base_price) AS total_revenue_after_promo
FROM dbo.fact_events fe
JOIN dbo.dim_campaigns c ON fe.campaign_id = c.campaign_id
GROUP BY c.campaign_name
ORDER BY total_revenue_after_promo DESC;
