-- Show tables in the db.
SHOW tables;

-- User pet_store_db.
USE pet_store_db;

-- Display all the products.
SELECT * FROM product;

-- Sort products by price, from cheapest to most expensive.
SELECT * FROM product
	ORDER BY unit_price ASC;

-- Find the cheapest item in the store.
SELECT * FROM product
	ORDER BY unit_price ASC
    LIMIT 1;

-- Find the most expensive item in the store.
SELECT * FROM product
	ORDER BY unit_price DESC
    LIMIT 1;

-- Find the items that arrived to the store this month (December 2022).
SELECT * FROM product
	WHERE date_added BETWEEN '2022-12-01' AND '2022-12-31';

-- Find the items that arrived to the store this month (current month).
SELECT * FROM product
	WHERE MONTH(date_added) = MONTH(CURRENT_DATE())
	AND YEAR(date_added) = YEAR(CURRENT_DATE());

-- Find the items that arrived to the store this week (current week).
-- TODO: Ask about 'DATE_ADD()'. It looks like it doesn't work.
SELECT * FROM product
	WHERE date_added >= (CURDATE() - INTERVAL 7 DAY);

-- Sort products by availability.
SELECT * FROM product
	ORDER BY stock ASC;

-- Display the average price of products.
SELECT AVG(unit_price) AS AveragePrice FROM product;

-- Find the supplier with the most items in our inventory.
SELECT sup.company_name, prod.name, prod.unit_price, prod.stock
	FROM product as prod
    JOIN supplier as sup
		ON sup.supplier_id = prod.supplier_id
	ORDER BY prod.stock DESC
    LIMIT 1;

-- Display all the categories available.
SELECT * FROM categories;

-- Sort the products by category.
SELECT prod.product_id, prod.name as product_name, pc.category_id, cat.name as category_name
	FROM product as prod
    JOIN product_categories as pc
		ON pc.product_id = prod.product_id
	JOIN categories as cat
		ON cat.category_id = pc.category_id
	ORDER BY cat.name ASC
;

-- Display all the products (name and cost) that belong to the category 'toys'.
SELECT prod.product_id, prod.name as product_name, pc.category_id, cat.name as category_name
	FROM product as prod
    JOIN product_categories as pc
		ON pc.product_id = prod.product_id
	JOIN categories as cat
		ON cat.category_id = pc.category_id
	WHERE cat.name = 'toys'
;

-- Find the product 'blue fox' and the category that it belongs.
SELECT prod.name as product_name, cat.name as category_name, pc.category_id
	FROM product as prod
    JOIN product_categories as pc
		ON pc.product_id = prod.product_id
	JOIN categories as cat
		ON cat.category_id = pc.category_id
	WHERE prod.name = 'Blue fox';
;

-- Update 'Blue fox' (id=54) category from 9 to 8.
UPDATE product_categories
	SET category_id = 8
    WHERE product_id = 54 AND category_id = 9;

-- Show all the orders.
SELECT * FROM orders;

-- Sort orders by date.
SELECT * FROM orders
	ORDER BY order_date ASC;

-- Display the customer name and email for each order.
SELECT cust.first_name, cust.last_name, cust.email, ord.order_number, ord.order_date, ord.total
	FROM customer as cust
    JOIN orders as ord
		ON ord.customer_id = cust.customer_id
;

-- Alter the table to fix the problem in the fields email and phone
-- Swap the columns by renaming them
SELECT * FROM customer;
ALTER TABLE customer
	RENAME COLUMN phone_number
    TO phone_number_aux;

ALTER TABLE customer
	RENAME COLUMN email
    TO phone_number;

ALTER TABLE customer
	RENAME COLUMN phone_number_aux
    TO email;
SELECT * FROM customer;

-- Display details of order number 57220-83.
SELECT ord.order_number, cust.first_name, cust.last_name, ord.order_date,
		prod.name as product_name, sup.company_name as vendor,
        prod.unit_price, odt.quantity, odt.cost as order_subtotal, ord.total as order_total
	FROM order_details as odt
    JOIN orders as ord
        ON ord.order_id = odt.order_id AND ord.order_number = '57220-83'
	JOIN customer as cust
		ON cust.customer_id = ord.customer_id
	JOIN product as prod
		ON prod.product_id = odt.product_id
	JOIN supplier as sup
		ON sup.supplier_id = prod.supplier_id
;
