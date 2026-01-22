CREATE TABLE dim_customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(100),
    segment VARCHAR(50), 
    region VARCHAR(50)
);

CREATE TABLE dim_products (
    product_id VARCHAR(50) PRIMARY KEY,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    base_cost DECIMAL(10, 2)
);

CREATE TABLE fact_orders (
    row_id SERIAL PRIMARY KEY,
    order_id VARCHAR(50),
    order_date DATE,
    customer_id VARCHAR(50) REFERENCES dim_customers(customer_id),
    product_id VARCHAR(50) REFERENCES dim_products(product_id),
    sales DECIMAL(10, 2),
    quantity INT,
    discount DECIMAL(5, 2),
    profit DECIMAL(10, 2)
);