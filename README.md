# Solent-Boats

A university database design project: a normalised PostgreSQL database for a boat business, with carefully defined relationships, constraints and data types, a full Entity Relationship Diagram (ERD), and documented design assumptions.

Overview

Solent Boat is a data modelling project that turns a business scenario into a working relational database. The focus is on good design: reducing redundancy through normalisation, enforcing data integrity with constraints, and choosing appropriate data types for every column.

Entity Relationship Diagram:
![SOLENT_BOAT_ERD](docs/erd.png)

Design Assumptions

The design assumptions made while modelling:
- Boats can have multiple propulsion and fuel types
- Emergency contacts can be linked to multiple customers and each customer can have several emergency contacts
- Each customer can have multiple boats and each boat can have multiple owners

Data Dictionary
The full data dictionary is in [DATA_DICTIONARY](docs/data-dictionary.pdf)

Tools Used
Lucidchart
PostgreSQL, with any SQL client (e.g. pgAdmin, psql, DBeaver)

