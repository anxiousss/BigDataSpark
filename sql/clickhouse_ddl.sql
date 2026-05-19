CREATE TABLE IF NOT EXISTS top_products (
    rank UInt8,
    product_id Int32,
    product_name String,
    total_quantity UInt64
) ENGINE = MergeTree()
ORDER BY rank;

CREATE TABLE IF NOT EXISTS top_customers (
    rank UInt8,
    customer_id Int32,
    full_name String,
    total_spent Float64
) ENGINE = MergeTree()
ORDER BY rank;

CREATE TABLE IF NOT EXISTS monthly_trends (
    year UInt16,
    month UInt8,
    month_name String,
    total_revenue Float64,
    total_quantity UInt64,
    num_orders UInt64
) ENGINE = MergeTree()
ORDER BY (year, month);

CREATE TABLE IF NOT EXISTS top_stores (
    rank UInt8,
    store_id Int32,
    store_name String,
    total_revenue Float64
) ENGINE = MergeTree()
ORDER BY rank;

CREATE TABLE IF NOT EXISTS top_suppliers (
    rank UInt8,
    supplier_id Int32,
    supplier_name String,
    total_revenue Float64
) ENGINE = MergeTree()
ORDER BY rank;

CREATE TABLE IF NOT EXISTS extreme_ratings (
    rating_type String,   
    product_id Int32,
    product_name String,
    product_rating Float64
) ENGINE = MergeTree()
ORDER BY rating_type;