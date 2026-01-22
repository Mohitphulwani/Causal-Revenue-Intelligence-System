-- 1. Drop the view first to prevent dependency errors
DROP VIEW IF EXISTS v_tableau_leakage_summary CASCADE;

-- 2. Force-Convert the column by mapping 1 to TRUE and 0 to FALSE
ALTER TABLE fact_orders_raw 
ALTER COLUMN is_treated TYPE BOOLEAN 
USING (
    CASE 
        WHEN is_treated = 1 THEN TRUE 
        ELSE FALSE 
    END
);

-- 3. Re-apply the logic to ensure data is current
UPDATE fact_orders_raw 
SET is_treated = (discount > 0.20);

-- 4. Recreate the Tableau View
CREATE OR REPLACE VIEW v_tableau_leakage_summary AS
SELECT 
    region,
    category,
    is_treated as discount_strategy,
    SUM(sales)::numeric as total_sales,
    SUM(profit)::numeric as total_profit,
    COUNT(order_id) as order_count,
    AVG(discount)::numeric as avg_discount
FROM fact_orders_raw
GROUP BY region, category, is_treated;