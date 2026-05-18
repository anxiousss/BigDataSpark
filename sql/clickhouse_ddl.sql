-- 1. Топ-10 самых продаваемых продуктов
CREATE TABLE IF NOT EXISTS top_products (
    rank UInt8,
    product_id Int32,
    product_name String,
    total_quantity UInt64
) ENGINE = MergeTree()
ORDER BY rank;

-- 2. Топ-10 клиентов с наибольшей суммой покупок
CREATE TABLE IF NOT EXISTS top_customers (
    rank UInt8,
    customer_id Int32,
    full_name String,
    total_spent Float64
) ENGINE = MergeTree()
ORDER BY rank;

-- 3. Месячные и годовые тренды продаж
CREATE TABLE IF NOT EXISTS monthly_trends (
    year UInt16,
    month UInt8,
    month_name String,
    total_revenue Float64,
    total_quantity UInt64,
    num_orders UInt64
) ENGINE = MergeTree()
ORDER BY (year, month);

-- 4. Топ-5 магазинов с наибольшей выручкой
CREATE TABLE IF NOT EXISTS top_stores (
    rank UInt8,
    store_id Int32,
    store_name String,
    total_revenue Float64
) ENGINE = MergeTree()
ORDER BY rank;

-- 5. Топ-5 поставщиков с наибольшей выручкой
CREATE TABLE IF NOT EXISTS top_suppliers (
    rank UInt8,
    supplier_id Int32,
    supplier_name String,
    total_revenue Float64
) ENGINE = MergeTree()
ORDER BY rank;

-- 6. Продукты с наивысшим и наименьшим рейтингом
CREATE TABLE IF NOT EXISTS extreme_ratings (
    rating_type String,   -- 'Highest' или 'Lowest'
    product_id Int32,
    product_name String,
    product_rating Float64
) ENGINE = MergeTree()
ORDER BY rating_type;