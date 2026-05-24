CREATE TABLE products1 (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price NUMERIC(10,2)
        CHECK (price > 0),
    quantity INT
        CHECK (quantity >= 0),
    email VARCHAR(150)
        UNIQUE NOT NULL,
    added_date DATE
        DEFAULT CURRENT_DATE,
    discount_rate NUMERIC(5,2)
        CHECK (discount_rate >= 0 AND discount_rate <= 100)
);

INSERT INTO products1
(product_name, category, price, quantity, email, added_date, discount_rate)
VALUES
	('Wireless Mouse', 'Electronics', 799.00, 25, 'mouse@gmail.com', '2025-01-10', 10.00),
	('Bluetooth Speaker', 'Electronics', 2499.00, 15, 'speaker@yahoo.com', '2025-02-05', 15.50),
	('Office Chair', 'Furniture', 5500.00, 8, 'chair@outlook.com', '2025-03-12', 12.00),
	('Water Bottle', 'Kitchen', 299.00, 50, 'bottle@hotmail.com', '2025-01-25', 5.00),
	('Gaming Keyboard', 'Electronics', 3200.00, 12, 'keyboard@icloud.com', '2025-04-08', 18.00),
	('Notebook Pack', 'Stationery', 450.00, 40, 'notebook@zoho.com', '2025-03-18', 7.50),
	('LED Monitor', 'Electronics', 12500.00, 6, 'monitor@protonmail.com', '2025-02-20', 20.00),
	('Backpack', 'Accessories', 1800.00, 20, 'bag@mail.com', '2025-01-30', 9.00),
	('Coffee Mug', 'Kitchen', 350.00, 35, 'mug@aol.com', '2025-04-15', 6.00),
	('Study Table', 'Furniture', 7200.00, 5, 'table@rediffmail.com', '2025-05-01', 14.00);

select * from products1;

-- TOTAL QUANTITY OF ALL PRODUCTS

SELECT SUM(quantity) AS total_quantity
FROM products1;

-- TOTAL QUANTITY OF ELECTRONICS PRODUCTS

SELECT SUM(quantity) AS quantity_details
FROM products1
WHERE category = 'Electronics';

-- TOTAL QUANTITY OF ELECTRONICS PRODUCTS
-- WITH PRICE GREATER THAN 20000

SELECT SUM(quantity) AS quantity_details
FROM products1
WHERE category = 'Electronics'
AND price > 2000;

-- TOTAL QUANTITY OF ELECTRONICS PRODUCTS
-- OR PRODUCTS ADDED AFTER 2024-02-01

SELECT SUM(quantity) AS quantity_details
FROM products1
WHERE category = 'Electronics'
OR added_date > '2024-02-01';

-- TOTAL NUMBER OF PRODUCTS

SELECT COUNT(*) AS total_product
FROM products1;

-- TOTAL NUMBER OF PRODUCTS
-- WHERE PRODUCT NAME CONTAINS 'phone'

SELECT COUNT(*) AS total_product_details
FROM products1
WHERE category LIKE 'Furniture';

select * from products1;

-- AVERAGE PRICE OF PRODUCTS

SELECT AVG(price) AS avg_price
FROM products1;

-- AVERAGE PRICE OF ACCESSORIES PRODUCTS

SELECT AVG(price) AS avg_price_accessories
FROM products1
WHERE category = 'Accessories';

-- AVERAGE PRICE OF ACCESSORIES
-- OR PRODUCTS ADDED AFTER 2024-02-01

SELECT AVG(price) AS avg_price_accessories
FROM products1
WHERE category = 'Accessories'
OR added_date > '2024-02-01';

-- MAXIMUM AND MINIMUM PRICE

SELECT 
    MAX(price) AS max_price,
    MIN(price) AS min_price
FROM products1;










