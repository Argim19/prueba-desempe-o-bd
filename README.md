# Database Josue

## Project Description

This project was developed to organize and normalize a dataset provided in Microsoft Excel format. The original data contained duplicated records, inconsistent values and redundant information, making it difficult to manage and query.

The main objective of this project was to analyze the dataset, apply the first three normal forms (1NF, 2NF and 3NF), design an Entity Relationship Model (ERM), implement the database in PostgreSQL/MySQL and create SQL queries that solve different business requirements.

---

# Technologies Used

- PostgreSQL
- Draw.io
- SQL
- Git
- GitHub

---

# Database Engine

PostgreSQL 17

---

# Normalization Process

The normalization process was carried out in three stages.

## First Normal Form (1NF)

- Atomic values were maintained.
- Repeated groups were removed.
- Each column stores only one value.

## Second Normal Form (2NF)

- Partial dependencies were removed.
- Related information was separated into independent tables.
- Foreign keys were created to connect related entities.

## Third Normal Form (3NF)

- Transitive dependencies were eliminated.
- Redundant information was removed.
- The database structure was optimized to avoid duplicated data.

---

# Database Structure

The database was designed using a relational model.

Main entities include:

- City
- customers
- Category
- Product
- orders
- Inventory
- Distribution center

---

# Database Creation

1. Create the database.

```sql
CREATE DATABASE bd_josue_blanco;
```

2. Connect to the database.

3. Execute the DDL script.

```
ddl.sql
```

4. Verify that all tables were created successfully.

---

# Data Loading

Data can be loaded using one of the following methods:

- CSV Import
- COPY command
- SQL INSERT scripts
- Import Wizard

The data was previously cleaned and normalized before loading it into the database.

---

# CRUD Operations

The project includes SQL scripts for:

- Insert a new record
- Update existing information
- Delete records while respecting referential integrity

---

# Project Structure

```
project/

.
├── dml.sql
├── docker-compose.yml
├── MER.pdf
└── README.md

```

---

# Developer Information

**Full Name:** Josue Blanco

**Clan:** Centurion

**GitHub Repository:**

https://github.com/your-user/your-repository

---

# Conclusions

This project demonstrates the complete process of analyzing, normalizing and implementing a relational database from an unstructured dataset.

The final database reduces redundancy, improves data consistency and allows reliable SQL queries for business decision making.
