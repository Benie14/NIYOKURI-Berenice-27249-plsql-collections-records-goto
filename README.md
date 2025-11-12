# NIYOKURI-Berenice-27249-plsql-collections-records-goto
Warehouse Stock Check PL/SQL 

This PL/SQL script demonstrates how to manage and display warehouse product information using records, nested tables, and loops in Oracle PL/SQL.
It also calculates the total stock value across multiple products while skipping defective products (those with invalid or negative quantities) using a GOTO statement.

The script is designed for educational purposes, illustrating:

PL/SQL RECORD types

Nested table collections

Looping and conditional logic

Using GOTO labels to skip invalid data

Basic exception handling

Displaying output using DBMS_OUTPUT.PUT_LINE

Script Features
Define Product Structure

Each warehouse product is represented as a record with the following fields:

product_id — Unique product identifier (NUMBER)

product_name — Name of the product (VARCHAR2)

category — Product category (VARCHAR2)

quantity — Number of items currently in stock (NUMBER)

price_per_unit — Price per unit in Rwandan Francs (NUMBER)

Store Multiple Products

Uses a nested table (ProductTable) to store multiple product records.

Initializes the table with 5 sample products, including one defective product (negative quantity).

Loop Through Products

Displays product details using DBMS_OUTPUT.PUT_LINE.

Skips defective products using a GOTO statement and label (skip_product).

Calculates and accumulates the total stock value for valid products.

Exception Handling

Handles unexpected errors using a generic WHEN OTHERS block.

Displays the exact error message encountered during execution.
