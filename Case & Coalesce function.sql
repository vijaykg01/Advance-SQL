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

/* 1.'EXPENSIVE' if the price is greater than or equal to 50000
   2.'MODERATE' if the price is between 10000 and 49999
   3.'AFFORDABLE' if the price is lesser than 10000
*/

SELECT PRODUCT_name,price,
	CASE
		WHEN price>=50000 THEN 'Expensive'
		WHEN price>=10000 AND price<=49999 THEN 'Moderate'
		ELSE 'Affordable'
	END AS price_category
FROM products1;

--CASE with BETWEEN & AND 
SELECT PRODUCT_name,quantity,
	CASE
		WHEN quantity>=20 THEN 'In stock'
		WHEN quantity BETWEEN 10 AND 19 THEN 'Limited stock'
		ELSE 'Out of stock'
	END AS price_category
FROM products1;

--CASE with LIKE

SELECT PRODUCT_name,category,
	CASE
		WHEN category LIKE 'Electronics' THEN 'Electronics_item'
		WHEN category LIKE 'Stationery' THEN 'Stationery_item'
		WHEN category LIKE 'Furniture' THEN 'Furniture_item'
		WHEN category LIKE 'Kitchen' THEN 'Kitchen_item'
		ELSE 'Accessories_item'
	END AS price_category
FROM products1;


select * from products1;

ALTER TABLE products1
add column discount_price numeric(10,2);

update products1
set discount_price=price*0.9
where product_name not in ('Office Chair','LED Monitor');


select * from products1;

SELECT product_name,price,
	coalesce (discount_price,price) AS final_price
FROM products1;

