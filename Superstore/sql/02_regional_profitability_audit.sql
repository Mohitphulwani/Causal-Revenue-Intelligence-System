-- CRIS System Health Check: Fixed Type Casting for Financial Accuracy
SELECT 
    region,
    ROUND(SUM(sales)::numeric, 2) as total_sales,
    ROUND(SUM(profit)::numeric, 2) as total_profit,
    ROUND((SUM(profit) / NULLIF(SUM(sales), 0) * 100)::numeric, 2) as net_margin_pct,
    ROUND(AVG(discount * 100)::numeric, 2) as avg_discount_pct
FROM fact_orders_raw
GROUP BY region
ORDER BY net_margin_pct ASC;