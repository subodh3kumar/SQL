--DROP TABLE customers CASCADE CONSTRAINT;

CREATE TABLE customers (
	customer_id INTEGER CONSTRAINT customer_id_pk PRIMARY KEY,
	first_name VARCHAR2(10) NOT NULL,
	last_name VARCHAR2(10) NOT NULL,
	dob DATE,
	phone VARCHAR2(12)
);

INSERT INTO customers VALUES (1, 'John', 'Brown', '01-Jan-1965', '800-555-1211');
INSERT INTO customers VALUES (2, 'Cynthia', 'Green', '05-Feb-1968', '800-555-1212');
INSERT INTO customers VALUES (3, 'Steve', 'White', '16-Mar-1971', '800-555-1213');
INSERT INTO customers VALUES (4, 'Gail', 'Black', null, '800-555-1214');
INSERT INTO customers VALUES (5, 'Doreen', 'Blue', '01-May-1971', null);

SELECT * FROM customers;

--DROP TABLE product_types CASCADE CONSTRAINT;

CREATE TABLE product_types (
	product_type_id INTEGER CONSTRAINT product_type_id_pk PRIMARY KEY,
	name VARCHAR2(10) NOT NULL
);

INSERT INTO product_types VALUES (1, 'Book');
INSERT INTO product_types VALUES (2, 'Video');
INSERT INTO product_types VALUES (3, 'DVD');
INSERT INTO product_types VALUES (4, 'CD');
INSERT INTO product_types VALUES (5, 'Magazine');

SELECT * FROM product_types;

--DROP TABLE products CASCADE CONSTRAINT;

CREATE TABLE products (
	product_id INTEGER CONSTRAINT product_id_pk PRIMARY KEY,
	product_type_id INTEGER CONSTRAINT products_product_type_id_fk REFERENCES product_types(product_type_id),
	name VARCHAR2(30) NOT NULL,
	description VARCHAR2(50),
	price NUMBER(5, 2)
);

INSERT INTO products VALUES (1, 1, 'Modern Science', 'A description of modern science', 19.95);
INSERT INTO products VALUES (2, 1, 'Chemistry', 'Introduction to Chemistry', 30);
INSERT INTO products VALUES (3, 2, 'Supernova', 'A star explodes', 25.99);
INSERT INTO products VALUES (4, 2, 'Tank War', 'Action movie about a future war', 13.95);

SELECT * FROM products;

--DROP TABLE purchase CASCADE CONSTRAINT;

CREATE TABLE purchase (
	product_id INTEGER CONSTRAINT purchase_product_id_fk REFERENCES products(product_id),
	customer_id INTEGER CONSTRAINT purchase_customer_id_fk REFERENCES customers(customer_id),
	quantity INTEGER NOT NULL,
	CONSTRAINT purchase_pk PRIMARY KEY (product_id, customer_id)
);

INSERT INTO purchase VALUES (1, 1, 1);
INSERT INTO purchase VALUES (2, 1, 3);
INSERT INTO purchase VALUES (1, 4, 1);
INSERT INTO purchase VALUES (2, 2, 1);
INSERT INTO purchase VALUES (1, 3, 1);

SELECT * FROM purchase;

--DROP TABLE employees CASCADE CONSTRAINT;

CREATE TABLE employees (
	employee_id INTEGER CONSTRAINT employee_id_pk PRIMARY KEY,
	manager_id INTEGER,
	first_name VARCHAR2(10) NOT NULL,
	last_name VARCHAR2(10) NOT NULL,
	title VARCHAR2(20),
	salary NUMBER(6, 0)
);

INSERT INTO employees VALUES (1, NULL, 'James', 'Smith', 'CEO', 800000);
INSERT INTO employees VALUES (2, 1, 'Ron', 'Johnson', 'Sales Manager', 600000);
INSERT INTO employees VALUES (3, 2, 'Fred', 'Hobbs', 'Salesperson', 150000);
INSERT INTO employees VALUES (4, 2, 'Susan', 'Jones', 'Salesperson', 500000);

SELECT * FROM employees;

--DROP TABLE salary_grades CASCADE CONSTRAINT;

CREATE TABLE salary_grades (
	salary_grade_id INTEGER CONSTRAINT salary_grade_id_pk PRIMARY KEY,
	low_salary NUMBER(6, 0),
	high_salary NUMBER(6, 0)
);

INSERT INTO salary_grades VALUES (1, 1, 250000);
INSERT INTO salary_grades VALUES (2, 250001, 500000);
INSERT INTO salary_grades VALUES (3, 500001, 750000);
INSERT INTO salary_grades VALUES (4, 750001, 999999);

SELECT * FROM salary_grades;

COMMIT;

INSERT INTO customers VALUES (6, 'Fred', 'Brown', '01-Jan-1970', '800-555-1215');
SELECT * FROM customers;

DELETE FROM customers WHERE customer_id = 6;

SELECT rowid, customer_id FROM customers;

SELECT rownum, customer_id, first_name, last_name FROM customers;
SELECT rownum, customer_id, first_name, last_name FROM customers WHERE customer_id = 4;

SELECT to_date('18-Feb-2022') + 2 FROM dual;
SELECT to_date('18-Feb-2022') - 3 FROM dual;
SELECT to_date('18-Feb-2022') - to_date('15-Feb-2022') FROM dual;

SELECT name, price + 2 FROM products;
SELECT name, price * 3 + 1 FROM products;

SELECT 10 * (12 / 3 - 1) FROM dual;

SELECT price * 2 double_price FROM products;
SELECT price * 2 "Double_Price" FROM products;
SELECT 10 * (12 / 3 - 1) AS "Computation" FROM dual;

SELECT first_name || ' ' || last_name AS "CUSTOMER_NAME" FROM customers; 

SELECT customer_id, first_name, last_name, phone, dob FROM customers WHERE dob IS NULL;
SELECT customer_id, first_name, last_name, phone, dob FROM customers WHERE phone IS NULL;

SELECT customer_id, first_name, last_name, nvl(phone, 'N/A') AS phone FROM customers; 
SELECT customer_id, first_name, last_name, nvl(dob, '01-Jan-2000') AS dob FROM customers; 

SELECT customer_id FROM purchase;
SELECT DISTINCT customer_id FROM customers;

SELECT * FROM customers WHERE customer_id <> 2;
SELECT * FROM customers WHERE customer_id > 2;
SELECT * FROM customers WHERE customer_id > ANY (2, 3, 4);
SELECT * FROM customers WHERE customer_id > ALL (2, 3, 4);

SELECT * FROM customers WHERE first_name LIKE '_o%';
SELECT * FROM customers WHERE first_name NOT LIKE '_o%';
SELECT * FROM customers WHERE customer_id IN (2, 3);

SELECT * FROM customers WHERE customer_id IN (2, 3, null);
SELECT * FROM customers WHERE customer_id NOT IN (2, 3, null); 

SELECT * FROM customers WHERE customer_id BETWEEN 1 AND 3;
SELECT * FROM customers WHERE customer_id NOT BETWEEN 1 AND 3;


SELECT * FROM customers WHERE dob > '01-Jan-1970';
SELECT * FROM customers WHERE customer_id < 2 AND phone LIKE '%1211';
SELECT * FROM customers WHERE dob > '01-Jan-1970' OR customer_id < 2 AND phone LIKE '%1211';

SELECT * FROM customers ORDER BY last_name;
SELECT * FROM customers ORDER BY last_name DESC;
SELECT * FROM customers ORDER BY first_name ASC, last_name DESC;
SELECT * FROM customers ORDER BY 2;

SELECT * FROM tab;

















