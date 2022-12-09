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
- A **customer** <ins>may have placed zero or more</ins> **orders**. An **order** must belong to one and only one **customer**.
- A **supplier** must sell one or more **products**. A **product** must be supplied by one and only one **supplier**.
- An **order** must have one or more **products**. A **product** may be part of zero or one **order**.
- A **product** must belong to one or more **categories**. A **category** may be part of zero or more **products**.