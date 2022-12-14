# FS1030 Pet Store eCommerce.
## Individual Final Project

The Pet Store eCommerce is a platform dedicated to selling products and services
for pets.

This repository contains the database elements needed by the platform. This
content is divided into four elements:
1. Entity Relationship.
2. Relational Model.
3. Entity Relationship Diagram.
4. SQL scripts.

### 1. Entity Relationship.

We are building a database to store information related to Pet Store eCommerce.
The requirement analysis identifies that we will need the following entities:
- Customer
- Supplier
- Product
- Categories
- Order

The relationships between these entities have been identifies as follows:
- A **customer** <ins>may have placed zero or more</ins> **orders**. An **order** <ins>must</ins> belong to <ins>one and only one</ins> **customer**.
- A **supplier** <ins>must sell one or more</ins> **products**. A **product** <ins>must</ins> be supplied by <ins>one and only one</ins> **supplier**.
- An **order** <ins>must have one or more</ins> **products**. A **product** <ins>may</ins> be part of <ins>zero or more</ins> **orders**.
- A **product** <ins>must belong to one or more</ins> **categories**. A **category** <ins>may</ins> be part of <ins>zero or more</ins> **products**.

### 2. Relational Model.
- Customer (<ins>customer_id</ins>, first_name, last_name, phone_number, email, address)
- Supplier (<ins>supplier_id</ins>, company_name, phone_number, email, address)
- Product (<ins>product_id</ins>, product_sku, name, supplier_id(fk), date_added, unit_price, stock)
- Categories (<ins>category_id</ins>, name, description)
- Product_categories(product_id(fk), category_id(fk))
- Orders (<ins>order_id</ins>, order_number, customer_id(fk), order_date, total)
- Order_details(<ins>order_details_id</ins>, order_id(fk), product_id(fk), quantity, cost)

### 3. Entity Relationship Diagram.
The ERD can be found in the following locations:
 - URL: https://app.diagrams.net/#G13JQ8ZtWxKMDUx-BEWSwHOuBwIfiTv82x
 - PNG exported from the URL: [Pet_Store_ERD.png](./ERD/Pet_Store_ERD.png)
 - PNG exported frm MySQL Workbench: [Pet_Store_ERD_MySQL.png](./ERD/Pet_Store_ERD_MySQL.png)
 - Comparison between the two diagrams: [Pet_Store_ERD_Comparison.png](./ERD/Pet_Store_ERD_Comparison.png)

### 4. SQL Scripts
The database was created using the SQL scripts available at: [SQL_Scripts](./SQL_Scripts/)
- To create the database, perform the script [pet_store_create_db.sql](./SQL_Scripts/pet_store_create_db.sql)
- To populate the database, perform the script [pet_store_populate_db.sql](./SQL_Scripts/pet_store_populate_db.sql)
- To run some useful queries, perform the script [pet_store_queries_db.sql](./SQL_Scripts/pet_store_queries_db.sql)