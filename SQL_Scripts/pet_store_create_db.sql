-- https://github.com/maurom88/YorkU_CSFS1030.git
-- Delete the project database in order to start fresh.
-- If database does not exist the error code 1008 is returned.
-- Error Code: 1008. Can't drop database 'pet_store_db'; database doesn't exist
DROP DATABASE pet_store_db;

-- Show all databases.
SHOW DATABASES;

-- Create a database and name it pet_store_db.
CREATE DATABASE pet_store_db;

-- Show all databases again, 'pet_store_db' should be displayed.
SHOW DATABASES;

-- Select the database 'pet_store_db' to be used.`
USE pet_store_db;

-- Show the tables in the database.
-- At this point there are no tables in the database
SHOW TABLES;

/* Create the table 'customer' with the following columns:
customer_id (pk)
first_name
last_name
phone_number
email
address
*/
CREATE TABLE customer (
    customer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(50),
    email VARCHAR(50) UNIQUE NOT NULL,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (customer_id)
);
-- Display the table data information to make sure it was created correctly
DESCRIBE customer;

/* Create the table 'supplier' with the following columns:
supplier_id (pk)
company_name
phone_number
email
address
*/
CREATE TABLE supplier (
    supplier_id INT NOT NULL AUTO_INCREMENT,
    company_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(50),
    email VARCHAR(50) UNIQUE NOT NULL,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (supplier_id)
);
-- Display the table data information to make sure it was created correctly
DESCRIBE supplier;

/* Create the table 'product' with the following columns:
product_id (pk)
product_sku
name
supplier_id (fk)
unit_price
stock
*/
CREATE TABLE product (
    product_id INT NOT NULL AUTO_INCREMENT,
    product_sku VARCHAR(255) NOT NULL,
    name VARCHAR(50),
    supplier_id INT NOT NULL,
	date_added DATETIME NOT NULL,
    unit_price DECIMAL(6,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    PRIMARY KEY (product_id),
	CONSTRAINT fk_supplier_id
		FOREIGN KEY (supplier_id)
        REFERENCES supplier(supplier_id)
);
-- Display the table data information to make sure it was created correctly
DESCRIBE product;

/* Create the table 'categories' with the following columns:
product_id (fk)
category_id (fk)
*/
CREATE TABLE categories (
    category_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(50),
    PRIMARY KEY (category_id)
);
-- Display the table data information to make sure it was created correctly
DESCRIBE categories;

/* Create the brigde table 'product_categories' with the following columns:
product_id (fk)
category_id (fk)
*/
CREATE TABLE product_categories (
    product_id INT NOT NULL,
    category_id INT NOT NULL,
	CONSTRAINT fk_product_id
		FOREIGN KEY (product_id) REFERENCES product(product_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_category_id
        FOREIGN KEY (category_id) REFERENCES categories(category_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);
-- Display the table data information to make sure it was created correctly
DESCRIBE product_categories;

/* Create the brigde table 'product_categories' with the following columns:
order_id (pk)
order_number
customer_id (fk)
order_date
total
*/
CREATE TABLE orders (
    order_id INT NOT NULL AUTO_INCREMENT,
    order_number VARCHAR(50) NOT NULL UNIQUE,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    total DECIMAL(6,2),
    PRIMARY KEY (order_id),
	CONSTRAINT fk_customer_id
		FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
-- Display the table data information to make sure it was created correctly
DESCRIBE orders;

/* Create the brigde table 'product_categories' with the following columns:
order_details_id (pk)
order_id (fk)
product_id (fk)
quantity
cost
*/
CREATE TABLE order_details (
    order_details_id INT NOT NULL AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT,
    cost DECIMAL(6,2),
    PRIMARY KEY (order_details_id),
	CONSTRAINT fk_order_id
		FOREIGN KEY (order_id) REFERENCES orders(order_id),
	CONSTRAINT fk_order_product_id
		FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Display the table data information to make sure it was created correctly
DESCRIBE order_details;