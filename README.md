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
- Order

The relationships between these entities have been identifies as follows:
- A **customer** <ins>may have placed zero or more</ins> **orders**. An **order** <ins>must</ins> belong to <ins>one and only one</ins> **customer**.
- A **supplier** <ins>must sell one or more</ins> **products**. A **product** <ins>must</ins> be supplied by <ins>one and only one</ins> **supplier**.
- An **order** <ins>must have one or more</ins> **products**. A **product** <ins>may</ins> be part of <ins>zero or more</ins> **order**.
- A **product** <ins>must belong to one or more</ins> **categories**. A **category** <ins>may</ins> be part of <ins>zero or more</ins> **products**.