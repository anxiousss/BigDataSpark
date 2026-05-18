CREATE TABLE IF NOT EXISTS public.mock_data (
	id int4 NULL,
	customer_first_name varchar(50) NULL,
	customer_last_name varchar(50) NULL,
	customer_age int4 NULL,
	customer_email varchar(50) NULL,
	customer_country varchar(50) NULL,
	customer_postal_code varchar(50) NULL,
	customer_pet_type varchar(50) NULL,
	customer_pet_name varchar(50) NULL,
	customer_pet_breed varchar(50) NULL,
	seller_first_name varchar(50) NULL,
	seller_last_name varchar(50) NULL,
	seller_email varchar(50) NULL,
	seller_country varchar(50) NULL,
	seller_postal_code varchar(50) NULL,
	product_name varchar(50) NULL,
	product_category varchar(50) NULL,
	product_price float4 NULL,
	product_quantity int4 NULL,
	sale_date varchar(50) NULL,
	sale_customer_id int4 NULL,
	sale_seller_id int4 NULL,
	sale_product_id int4 NULL,
	sale_quantity int4 NULL,
	sale_total_price float4 NULL,
	store_name varchar(50) NULL,
	store_location varchar(50) NULL,
	store_city varchar(50) NULL,
	store_state varchar(50) NULL,
	store_country varchar(50) NULL,
	store_phone varchar(50) NULL,
	store_email varchar(50) NULL,
	pet_category varchar(50) NULL,
	product_weight float4 NULL,
	product_color varchar(50) NULL,
	product_size varchar(50) NULL,
	product_brand varchar(50) NULL,
	product_material varchar(50) NULL,
	product_description varchar(1024) NULL,
	product_rating float4 NULL,
	product_reviews int4 NULL,
	product_release_date varchar(50) NULL,
	product_expiry_date varchar(50) NULL,
	supplier_name varchar(50) NULL,
	supplier_contact varchar(50) NULL,
	supplier_email varchar(50) NULL,
	supplier_phone varchar(50) NULL,
	supplier_address varchar(50) NULL,
	supplier_city varchar(50) NULL,
	supplier_country varchar(50) NULL
);


DROP SCHEMA IF EXISTS star CASCADE;
CREATE SCHEMA star;

CREATE TABLE star.dim_date (
    date_id INTEGER PRIMARY KEY,
    full_date DATE NOT NULL,
    year SMALLINT NOT NULL,
    quarter SMALLINT NOT NULL,
    month SMALLINT NOT NULL,
    month_name VARCHAR(10) NOT NULL,
    day SMALLINT NOT NULL,
    day_of_week SMALLINT NOT NULL,
    day_name VARCHAR(10) NOT NULL,
    week_of_year SMALLINT NOT NULL
);

CREATE TABLE star.dim_customer (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INTEGER,
    email VARCHAR(50),
    country VARCHAR(50),
    postal_code VARCHAR(50),
    pet_type VARCHAR(50),
    pet_name VARCHAR(50),
    pet_breed VARCHAR(50)
);

CREATE TABLE star.dim_seller (
    seller_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    country VARCHAR(50),
    postal_code VARCHAR(50)
);

CREATE TABLE star.dim_supplier (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(50),
    supplier_contact VARCHAR(50),
    supplier_email VARCHAR(50),
    supplier_phone VARCHAR(50),
    supplier_address VARCHAR(50),
    supplier_city VARCHAR(50),
    supplier_country VARCHAR(50)
);

CREATE TABLE star.dim_product (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(50),
    product_category VARCHAR(50),
    pet_category VARCHAR(50),
    product_price FLOAT,
    product_weight FLOAT,
    product_color VARCHAR(50),
    product_size VARCHAR(50),
    product_brand VARCHAR(50),
    product_material VARCHAR(50),
    product_description VARCHAR(1024),
    product_rating FLOAT,
    product_reviews INTEGER,
    product_release_date DATE,
    product_expiry_date DATE,
    supplier_id INTEGER REFERENCES star.dim_supplier(supplier_id)
);

CREATE TABLE star.dim_store (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(50),
    store_location VARCHAR(50),
    store_city VARCHAR(50),
    store_state VARCHAR(50),
    store_country VARCHAR(50),
    store_phone VARCHAR(50),
    store_email VARCHAR(50)
);

CREATE TABLE star.fact_sales (
    sale_id SERIAL PRIMARY KEY,
    date_id INTEGER NOT NULL REFERENCES star.dim_date(date_id),
    customer_id INTEGER NOT NULL REFERENCES star.dim_customer(customer_id),
    seller_id INTEGER NOT NULL REFERENCES star.dim_seller(seller_id),
    product_id INTEGER NOT NULL REFERENCES star.dim_product(product_id),
    store_id INTEGER NOT NULL REFERENCES star.dim_store(store_id),
    quantity INTEGER NOT NULL,
    total_price FLOAT NOT NULL,
    unit_price FLOAT
);


copy mock_data from '/data/MOCK_DATA.csv'	  with (FORMAT csv, HEADER true);
copy mock_data from '/data/MOCK_DATA (1).csv' with (FORMAT csv, HEADER true);
copy mock_data from '/data/MOCK_DATA (2).csv' with (FORMAT csv, HEADER true);
copy mock_data from '/data/MOCK_DATA (3).csv' with (FORMAT csv, HEADER true);
copy mock_data from '/data/MOCK_DATA (4).csv' with (FORMAT csv, HEADER true);
copy mock_data from '/data/MOCK_DATA (5).csv' with (FORMAT csv, HEADER true);
copy mock_data from '/data/MOCK_DATA (6).csv' with (FORMAT csv, HEADER true);
copy mock_data from '/data/MOCK_DATA (7).csv' with (FORMAT csv, HEADER true);
copy mock_data from '/data/MOCK_DATA (8).csv' with (FORMAT csv, HEADER true);
copy mock_data from '/data/MOCK_DATA (9).csv' with (FORMAT csv, HEADER true);