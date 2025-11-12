
SQL> SET SERVEROUTPUT ON;
SQL>
SQL> DECLARE
  2      TYPE ProductRecord IS RECORD (
  3          product_id      NUMBER,
  4          product_name    VARCHAR2(50),
  5          category        VARCHAR2(30),
  6          quantity        NUMBER,
  7          price_per_unit  NUMBER
  8      );
  9
 10      TYPE ProductTable IS TABLE OF ProductRecord;
 11
 12      products ProductTable := ProductTable();
 13
 14      total_value NUMBER := 0;
 15
 16  BEGIN
 17      products.EXTEND(5);
 18      products(1) := ProductRecord(101, 'Laptop', 'Electronics', 10, 800000);
 19      products(2) := ProductRecord(102, 'Smartphone', 'Electronics', -5, 400000);
 20      products(3) := ProductRecord(103, 'Desk Chair', 'Furniture', 15, 75000);
 21      products(4) := ProductRecord(104, 'Office Desk', 'Furniture', 7, 150000);
 22      products(5) := ProductRecord(105, 'Water Bottle', 'Accessories', 20, 5000);
 23
 24      DBMS_OUTPUT.PUT_LINE('--- WAREHOUSE STOCK DETAILS ---');
 25
 26      FOR i IN 1 .. products.COUNT LOOP
 27
 28          IF products(i).quantity <= 0 THEN
 29              DBMS_OUTPUT.PUT_LINE('Skipping defective product: ' || products(i).product_name);
 30              GOTO skip_product;
 31          END IF;
 32
 33          DBMS_OUTPUT.PUT_LINE('Product ID: ' || products(i).product_id);
 34          DBMS_OUTPUT.PUT_LINE('Product Name: ' || products(i).product_name);
 35          DBMS_OUTPUT.PUT_LINE('Category: ' || products(i).category);
 36          DBMS_OUTPUT.PUT_LINE('Quantity: ' || products(i).quantity);
 37          DBMS_OUTPUT.PUT_LINE('Price per Unit: ' || products(i).price_per_unit || ' RWF');
 38          DBMS_OUTPUT.PUT_LINE('----------------------------------');
 39
 40          total_value := total_value + (products(i).quantity * products(i).price_per_unit);
 41
 42          <<skip_product>>
 43          NULL;
 44      END LOOP;
 45
 46      DBMS_OUTPUT.PUT_LINE('Total Stock Value: ' || total_value || ' RWF');
 47
 48  EXCEPTION
 49      WHEN OTHERS THEN
 50          DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
 51  END;
 52  /
