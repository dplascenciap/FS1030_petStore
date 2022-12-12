-- https://github.com/maurom88/YorkU_CSFS1030.git
-- Delete the project database in order to start fresh.
-- If database does not exist the error code 1008 is returned.
--   Error Code: 1008. Can't drop database 'pet_store_db'; database doesn't exist
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
	date_added DATETIME NOT NULL
		DEFAULT CURRENT_TIMESTAMP
		ON UPDATE CURRENT_TIMESTAMP,
    unit_price VARCHAR(255) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    PRIMARY KEY (product_id),
	CONSTRAINT fk_supplier_id
		FOREIGN KEY (supplier_id)
        REFERENCES supplier(supplier_id)
);

-- Display the table data information to make sure it was created correctly
DESCRIBE product;